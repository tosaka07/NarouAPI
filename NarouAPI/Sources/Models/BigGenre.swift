//
//  BigGenre.swift
//  NarouAPI
//
//  Created by tosaka on 2019/08/22.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Foundation

/// 大ジャンル
public enum BigGenre: Int, Decodable {
    /// 恋愛
    case love = 1
    /// ファンタジー
    case fantasy = 2
    /// 文芸
    case literature = 3
    /// SF
    case sf = 4
    /// その他
    case other = 99
    /// ノンジャンル
    case none = 98
}
