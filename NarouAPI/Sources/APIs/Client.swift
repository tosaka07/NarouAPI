//
//  Client.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/03/13.
//

import Foundation

public typealias Parameters = [String: Any]

public enum HTTPMethod: String {
    case get
    case post
    case patch
    case delete
    case connect
    case head
    case options
    case put
    case trace
    
    func encodesParametersInURL() -> Bool {
        return [.get, .head, .delete].contains(self)
    }
}

public protocol APIProtocol {
    associatedtype ResponseType
    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var headers: [String: String]? { get }
    var cachePolicy: URLRequest.CachePolicy { get }
    var timeoutInterval: TimeInterval { get }
}

public extension APIProtocol {
    var baseURL: URL {
        return URL(string: "https://api.syosetu.com/")! // swiftlint:disable:this force_try
    }
    
    var headers: [String: String]? {
        return nil
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        return .useProtocolCachePolicy
    }
    
    var timeoutInterval: TimeInterval {
        return 20.0
    }
}

public protocol RequestProtocol: APIProtocol {
    var parameters: [String: Any]? { get }
}

public extension RequestProtocol {
    func asURLRequest() throws -> URLRequest {
        guard let url = createURL() else {
            throw NSError()
        }
        var request = URLRequest(url: url, cachePolicy: cachePolicy)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.timeoutInterval = timeoutInterval
        return request
    }
    
    private func createURL() -> URL? {
        let url = baseURL.appendingPathComponent(path)
        if let parameters = parameters {
            if method.encodesParametersInURL() {
                let items = parameters.map { param -> URLQueryItem in
                    URLQueryItem(name: param.key, value: (param.value as? String) ?? "\(param.value)")
                }
                var component = URLComponents(url: url, resolvingAgainstBaseURL: false)
                component?.queryItems = items
                return component?.url
            } else {
                return nil
            }
        }
        return nil
    }
}
