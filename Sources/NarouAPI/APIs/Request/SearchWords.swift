//
//  SearchWords.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/06.
//

import Foundation

/// 検索ワード
public struct SearchWords {
    /// 検索ワード
    public let searchWords: [String]
    /// 除外ワード
    public let excludeWords: [String]

    /// 一人だけ検索
    /// - Parameter word: 検索ワード
    public init(word: String) {
        searchWords = [word]
        excludeWords = []
    }

    /// 一人だけ除外検索
    /// - Parameter word: 検索ワード
    public init(excludeWord: String) {
        searchWords = []
        excludeWords = [excludeWord]
    }

    public init(searchWords: [String], excludeWords: [String]) {
        self.searchWords = searchWords
        self.excludeWords = excludeWords
    }
}
