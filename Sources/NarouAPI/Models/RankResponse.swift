//
//  RankResponse.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/14.
//

import Foundation

public struct RankResponse: Decodable {
    
    public var rankList: [Rank]

    public init(from decoder: Decoder) throws {
        var unkeyedContainer = try decoder.unkeyedContainer()
        var list = [Rank]()
        while !unkeyedContainer.isAtEnd {
            list.append(try unkeyedContainer.decode(Rank.self))
        }
        rankList = list
    }
}
