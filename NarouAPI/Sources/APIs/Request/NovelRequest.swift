//
//  NovelRequest.swift
//  Tsukimi
//
//  Created by tosaka on 2019/08/23.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Alamofire

public struct NovelRequest: BaseRequestProtocol {
    public typealias ResponseType = NovelResponse

    let parameterBuilders: [URLParameterBuildable]

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return ""
    }

    public var parameters: Parameters? {
        let outputBuilder = OutputParameterBuilder()
        return (parameterBuilders + [outputBuilder])
            .map { $0.build() }
            .reduce([String: String]()) { (value, new) -> [String: String] in
                value.merging(new, uniquingKeysWith: { $1 })
            }
    }

    public init(options: [RequestOption], filterOptions: [FilterOption]) {
        self.parameterBuilders = (options.map { $0.builder } + filterOptions.map { $0.builder })
    }

    public init(parameterBuilders: [URLParameterBuildable]) {
        self.parameterBuilders = parameterBuilders
    }
}


