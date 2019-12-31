//
//  Genre.swift
//  NarouAPI
//
//  Created by tosaka on 2019/08/22.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Foundation

/// ジャンル
public enum Genre: Int, Decodable {
    /// 異世界〔恋愛〕
    case differentWorld = 101
    /// 現実世界〔恋愛〕
    case realWorld = 102
    /// ハイファンタジー〔ファンタジー〕
    case highFantasy = 201
    /// ローファンタジー〔ファンタジー〕
    case lowFantasy = 202
    /// 純文学〔文芸〕
    case pureLiterature = 301
    /// ヒューマンドラマ〔文芸〕
    case humanDrama = 302
    /// 歴史〔文芸〕
    case history = 303
    /// 推理〔文芸〕
    case mystery = 304
    /// ホラー〔文芸〕
    case horror = 305
    /// アクション〔文芸〕
    case action = 306
    /// コメディー〔文芸〕
    case comedy = 307
    /// VRゲーム〔SF〕
    case vrGame = 401
    /// 宇宙〔SF〕
    case universe = 402
    /// 空想科学〔SF〕
    case scienceFiction = 403
    /// パニック〔SF〕
    case panic = 404
    /// 童話〔その他〕
    case fairyTale = 9901
    /// 詩〔その他〕
    case poem = 9902
    /// エッセイ〔その他〕
    case essay = 9903
    /// リプレイ〔その他〕
    case replay = 9904
    /// その他〔その他〕
    case other = 9999
    /// ノンジャンル〔ノンジャンル〕
    case none = 9801
}
