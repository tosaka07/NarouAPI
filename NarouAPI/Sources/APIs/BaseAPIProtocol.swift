//
//  BaseAPIProtocol.swift
//  Tsukimi
//
//  Created by tosaka on 2019/08/23.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Alamofire
import Foundation

public protocol BaseAPIProtocol {
    associatedtype ResponseType // レスポンスの型

    var method: HTTPMethod { get } // get,post,delete などなど
    var baseURL: URL { get } // APIの共通呼び出し元。 ex "https://~~~"
    var path: String { get } // リクエストごとのパス
    var headers: HTTPHeaders? { get } // ヘッダー情報
}

public extension BaseAPIProtocol {
    var baseURL: URL {
        // 絶対にあることがある保証されているので「try！」を使用している
        return URL(string: "https://api.syosetu.com/")! // swiftlint:disable:this force_try
    }

    var headers: HTTPHeaders? { // 先ほど上で定義したもの。なければ「return nil」でok
        return nil
    }
}

public protocol BaseRequestProtocol: BaseAPIProtocol, URLRequestConvertible {
    var parameters: Parameters? { get }
    var encoding: URLEncoding { get }
}

public extension BaseRequestProtocol {
    var encoding: URLEncoding {
        // parameter の変換の仕方を設定
        // defaultの場合、get→quertString、post→httpBodyとよしなに行ってくれる
        return URLEncoding.default
    }

    func asURLRequest() throws -> URLRequest {
        // requestごとの　pathを設定
        var urlRequest = URLRequest(url: baseURL.appendingPathComponent(path))

        // requestごとの　methodを設定(get/post/delete etc...)
        urlRequest.httpMethod = method.rawValue

        // headersを設定
        urlRequest.allHTTPHeaderFields = headers?.dictionary

        // timeout時間を設定
        urlRequest.timeoutInterval = TimeInterval(30)

        // requestごとの　parameterを設定
        if let params = parameters {
            urlRequest = try encoding.encode(urlRequest, with: params)
        }

        return urlRequest
    }
}
