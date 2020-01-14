//
//  RankRequest.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/14.
//

import Alamofire

public struct RankRequest: BaseRequestProtocol {
    public typealias ResponseType = RankResponse

    let parameterBuilders: [URLParameterBuildable]

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "rank/rankin/"
    }

    public var parameters: Parameters? {
        return parameterBuilders
            .map { $0.build() }
            .reduce([String: Any]()) { (value, new) -> [String: Any] in
                value.merging(new, uniquingKeysWith: { $1 })
            }
    }

    public init(ncode: String, options: [RankRequestOption]) {
        let builder = [NCodeParameterBuilder(nCodes: [ncode]), OutputParameterBuilder()] + options.map { $0.builder }
        self.parameterBuilders = builder
    }
}
