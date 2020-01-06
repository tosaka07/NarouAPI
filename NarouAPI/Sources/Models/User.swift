//
//  User.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/06.
//

import Foundation

public struct User: Decodable {
    /// ユーザID
    public var userID: Int
    /// ユーザ名
    public var name: String
    /// ユーザ名のフリガナ
    public var yomikata: String
    /// ユーザ名のフリガナの頭文字
    public var name1st: String?
    /// 小説投稿数
    public var novelCount: Int
    /// レビュー投稿数
    public var reviewCount: Int
    /// 小説累計文字数
    public var novelLength: Int
    /// 総合評価ポイントの合計
    public var sumGlobalPoint: Int

    private enum CodingKeys: String, CodingKey {
        case userID = "userid"
        case name
        case yomikata
        case name1st
        case novelCount = "novel_cnt"
        case reviewCount = "review_cnt"
        case novelLength = "novel_length"
        case sumGlobalPoint = "sum_global_point"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userID = try values.decode(Int.self, forKey: .userID)
        name = try values.decode(String.self, forKey: .name)
        yomikata = try values.decode(String.self, forKey: .yomikata)
        name1st = try values.decode(String?.self, forKey: .name1st)
        novelCount = try values.decode(Int.self, forKey: .novelCount)
        reviewCount = try values.decode(Int.self, forKey: .reviewCount)
        novelLength = try values.decode(Int.self, forKey: .novelLength)
        sumGlobalPoint = try values.decode(Int.self, forKey: .sumGlobalPoint)
    }
}
