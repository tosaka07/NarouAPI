//
//  Novel.swift
//  NarouAPI
//
//  Created by tosaka on 2019/08/22.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Foundation

public struct Novel: Decodable {
    /// 小説名
    public var title: String
    /// Ncode
    public var ncode: String
    /// 作者のユーザID
    public var userID: Int
    /// 作者名
    public var writer: String
    /// 小説のあらすじ
    public var story: String
    /// 大ジャンル
    public var bigGenre: BigGenre
    /// ジャンル
    public var genre: Genre
    /// 現在未使用項目(常に空文字列が返ります)
    public var gensaku: String
    /// キーワード
    public var keyword: [String]
    /// 初回掲載日
    public var generalFirstup: Date
    /// 最終掲載日
    public var generalLastup: Date
    /// 小説タイプ
    public var novelType: NovelType
    /// 終了タイプ
    public var end: EndType
    /// 全掲載部分数
    public var generalAllNo: Int
    /// 小説文字数
    public var length: Int
    /// 読了時間(分単位)。小説文字数÷500を切り上げした数値
    public var time: Int
    /// 長期連載停止中か
    public var isStop: Bool
    /// 登録必須キーワードに「R15」が含まれるか
    public var isR15: Bool
    /// 登録必須キーワードに「ボーイズラブ」が含まれる
    public var isBL: Bool
    /// 登録必須キーワードに「ガールズラブ」が含まれる
    public var isGL: Bool
    /// 登録必須キーワードに「残酷な描写あり」が含まれる
    public var isZankoku: Bool
    /// 登録必須キーワードに「異世界転生」が含まれる
    public var isTensei: Bool
    /// 登録必須キーワードに「異世界転移」が含まれる
    public var isTenni: Bool
    /// どうやって投稿されてるか
    public var howToPost: HowToPost
    /// 総合評価ポイント(=(ブックマーク数×2)+評価点)
    public var globalPoint: Int
    /// 日間ポイント
    public var dailyPoint: Int
    /// 週間ポイント
    public var weeklyPoint: Int
    /// 月間ポイント
    public var monthlyPoint: Int
    /// 四半期ポイント
    public var quarterPoint: Int
    /// 年間ポイント
    public var yearlyPoint: Int
    /// ブックマーク数
    public var favNovelCount: Int
    /// 感想数
    public var impressionCount: Int
    /// レビュー数
    public var reviewCount: Int
    /// 評価点
    public var allPoint: Int
    /// 評価者数
    public var allHyokaCount: Int
    /// 挿絵の数
    public var sasieCount: Int
    /// 会話率
    public var kaiwaritu: Int
    /// 小説の更新日時
    public var novelUpdatedAt: Date
    /// 最終更新日時（システム用）
    public var updatedAt: Date
    /// 週間ユニークユーザ(optionを設定しないと表示されない)
    public var weeklyUnique: Int?

    private enum CodingKeys: String, CodingKey {
        case title
        case ncode
        case userID = "userid"
        case writer
        case story
        case bigGenre = "biggenre"
        case genre
        case gensaku
        case keyword
        case generalFirstup = "general_firstup"
        case generalLastup = "general_lastup"
        case novelType = "novel_type"
        case end
        case generalAllNo = "general_all_no"
        case length
        case time
        case isStop = "isstop"
        case isR15 = "isr15"
        case isBL = "isbl"
        case isGL = "isgl"
        case isZankoku = "iszankoku"
        case isTensei = "istensei"
        case isTenni = "istenni"
        case howToPost = "pc_or_k"
        case globalPoint = "global_point"
        case dailyPoint = "daily_point"
        case weeklyPoint = "weekly_point"
        case monthlyPoint = "monthly_point"
        case quarterPoint = "quarter_point"
        case yearlyPoint = "yearly_point"
        case favNovelCount = "fav_novel_cnt"
        case impressionCount = "impression_cnt"
        case reviewCount = "review_cnt"
        case allPoint = "all_point"
        case allHyokaCount = "all_hyoka_cnt"
        case sasieCount = "sasie_cnt"
        case kaiwaritu
        case novelUpdatedAt = "novelupdated_at"
        case updatedAt = "updated_at"
        case weeklyUnique = "weekly_unique"
    }

    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        ncode = try values.decode(String.self, forKey: .ncode)
        userID = try values.decode(Int.self, forKey: .userID)
        writer = try values.decode(String.self, forKey: .writer)
        story = try values.decode(String.self, forKey: .story)
        bigGenre = try values.decode(BigGenre.self, forKey: .bigGenre)
        genre = try values.decode(Genre.self, forKey: .genre)
        gensaku = try values.decode(String.self, forKey: .gensaku)
        keyword = try values.decode(String.self, forKey: .keyword).components(separatedBy: " ")
        generalFirstup = try values.decode(Date.self, forKey: .generalFirstup)
        generalLastup = try values.decode(Date.self, forKey: .generalLastup)
        novelType = try values.decode(NovelType.self, forKey: .novelType)
        end = try values.decode(EndType.self, forKey: .end)
        generalAllNo = try values.decode(Int.self, forKey: .generalAllNo)
        length = try values.decode(Int.self, forKey: .length)
        time = try values.decode(Int.self, forKey: .time)
        isStop = Bool(truncating: try values.decode(Int.self, forKey: .isStop) as NSNumber)
        isR15 = Bool(truncating: try values.decode(Int.self, forKey: .isR15) as NSNumber)
        isBL = Bool(truncating: try values.decode(Int.self, forKey: .isBL) as NSNumber)
        isGL = Bool(truncating: try values.decode(Int.self, forKey: .isGL) as NSNumber)
        isZankoku = Bool(truncating: try values.decode(Int.self, forKey: .isZankoku) as NSNumber)
        isTensei = Bool(truncating: try values.decode(Int.self, forKey: .isTensei) as NSNumber)
        isTenni = Bool(truncating: try values.decode(Int.self, forKey: .isTenni) as NSNumber)
        isZankoku = Bool(truncating: try values.decode(Int.self, forKey: .isZankoku) as NSNumber)
        howToPost = try values.decode(HowToPost.self, forKey: .howToPost)
        globalPoint = try values.decode(Int.self, forKey: .globalPoint)
        dailyPoint = try values.decode(Int.self, forKey: .dailyPoint)
        weeklyPoint = try values.decode(Int.self, forKey: .weeklyPoint)
        monthlyPoint = try values.decode(Int.self, forKey: .monthlyPoint)
        quarterPoint = try values.decode(Int.self, forKey: .quarterPoint)
        yearlyPoint = try values.decode(Int.self, forKey: .yearlyPoint)
        favNovelCount = try values.decode(Int.self, forKey: .favNovelCount)
        impressionCount = try values.decode(Int.self, forKey: .impressionCount)
        reviewCount = try values.decode(Int.self, forKey: .reviewCount)
        allPoint = try values.decode(Int.self, forKey: .allPoint)
        allHyokaCount = try values.decode(Int.self, forKey: .allHyokaCount)
        sasieCount = try values.decode(Int.self, forKey: .sasieCount)
        kaiwaritu = try values.decode(Int.self, forKey: .kaiwaritu)
        novelUpdatedAt = try values.decode(Date.self, forKey: .novelUpdatedAt)
        updatedAt = try values.decode(Date.self, forKey: .updatedAt)
        weeklyUnique = try? values.decode(Int.self, forKey: .weeklyUnique)
    }
}
