//
//  Rank.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/14.
//

import Foundation

public struct Rank: Decodable {
    /// ランキングタイプ
    public var rankingType: RankingType
    /// ポイント
    public var point: Int
    /// 順位
    public var rank: Int
    
    private enum CodingKeys: String, CodingKey {
        case rankingType
        case point = "pt"
        case rank
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let rankRaw = try values.decode(String.self, forKey: .rankingType)
        rankingType = try RankingType(rankString: rankRaw)
        point = try values.decode(Int.self, forKey: .point)
        rank = try values.decode(Int.self, forKey: .rank)
    }
}
