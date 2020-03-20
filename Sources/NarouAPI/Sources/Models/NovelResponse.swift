//
//  NovelResponse.swift
//  NarouAPI
//
//  Created by tosaka on 2019/08/23.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Foundation

public struct NovelResponse: Decodable {
    public var allCount: Int
    public var novels: [Novel]

    public init(from decoder: Decoder) throws {
        var unkeyedContainer = try decoder.unkeyedContainer()
        allCount = try unkeyedContainer.decode(Count.self).allcount

        var result: [Novel] = []
        result.reserveCapacity(allCount)
        while !unkeyedContainer.isAtEnd {
            result.append(try unkeyedContainer.decode(Novel.self))
        }
        novels = result
    }
}
