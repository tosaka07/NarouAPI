//
//  RankingRequest.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/14.
//

public struct RankingRequest: RequestProtocol {
    public typealias ResponseType = RankingResponse

    let parameterBuilders: [URLParameterBuildable]

    public var method: HTTPMethod {
        return .get
    }

    public var path: String {
        return "rank/rankget/"
    }

    public var parameters: Parameters? {
        let outputBuilder = OutputParameterBuilder()
        return (parameterBuilders + [outputBuilder])
            .map { $0.build() }
            .reduce([String: Any]()) { (value, new) -> [String: Any] in
                value.merging(new, uniquingKeysWith: { $1 })
            }
    }

    public init(options: [RankingRequestOption]) {
        self.parameterBuilders = (options.map { $0.builder })
    }
}
