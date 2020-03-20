//
//  RankingResponse.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/14.
//

import Foundation

public struct RankingResponse: Decodable {
    
    public var rankingList: [Ranking]

    public init(from decoder: Decoder) throws {
        var unkeyedContainer = try decoder.unkeyedContainer()
        var list = [Ranking]()
        while !unkeyedContainer.isAtEnd {
            list.append(try unkeyedContainer.decode(Ranking.self))
        }
        rankingList = list
    }
}
