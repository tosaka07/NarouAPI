//
//  Ranking.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/14.
//

import Foundation

public struct Ranking: Decodable {
    /// Nコード
    public var ncode: String
    /// ポイント
    public var point: Int
    /// 順位
    public var rank: Int
    
    private enum CodingKeys: String, CodingKey {
        case ncode
        case point = "pt"
        case rank
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ncode = try values.decode(String.self, forKey: .ncode)
        point = try values.decode(Int.self, forKey: .point)
        rank = try values.decode(Int.self, forKey: .rank)
    }
}
