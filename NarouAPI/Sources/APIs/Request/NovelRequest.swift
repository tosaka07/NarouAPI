//
//  NovelRequest.swift
//  Tsukimi
//
//  Created by tosaka on 2019/08/23.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

public struct NovelRequest: RequestProtocol {
    public typealias ResponseType = NovelResponse

    let parameterBuilders: [URLParameterBuildable]

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "novelapi/api"
    }

    public var parameters: Parameters? {
        let outputBuilder = OutputParameterBuilder()
        return (parameterBuilders + [outputBuilder])
            .map { $0.build() }
            .reduce([String: Any]()) { (value, new) -> [String: Any] in
                value.merging(new, uniquingKeysWith: { $1 })
            }
    }

    public init(options: [RequestOption], filterOptions: [NovelFilterOption]) {
        self.parameterBuilders = (options.map { $0.builder } + filterOptions.map { $0.builder })
    }
}


