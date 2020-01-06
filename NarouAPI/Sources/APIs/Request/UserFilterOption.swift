//
//  UserFilterOption.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/06.
//

import Foundation

public enum UserFilterOption {
    /// ユーザ名とユーザ名のフリガナ
    case username(SearchWords)
    case userID(Int)
    /// フリガナの頭文字.対象範囲: 「ぁ」～「ん」.対象外: 漢字や英数字
    case name1st(String)
    /// 小説投稿数
    case novelCount(RangeOption<Int>)
    /// レビュー投稿数
    case reviewCount(RangeOption<Int>)

    var builder: URLParameterBuildable {
        switch self {
        case .username(let searchWords):
            return UsernameParameterBuilder(searchWords: searchWords)
        case .userID(let userID):
            return UserIDParameterBuilder(userID: userID)
        case .name1st(let name1st):
            return Name1stParameterBuilder(name1st: name1st)
        case .novelCount(let range):
            return NovelCountParameterBuilder(rangeOption: range)
        case .reviewCount(let range):
            return ReviewCountParameterBuilder(rangeOption: range)
        }
    }
}
