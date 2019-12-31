//
//  APIOptions.swift
//  NarouAPI
//
//  Created by tosaka on 2019/12/31.
//

import Foundation

/// リクエストオプション
public enum RequestOption {
    case gzip(Int)
    case limit(Int)
    case startPosition(Int)
    case order(Order)

    var builder: URLParameterBuildable {
        switch self {
        case .gzip(let compressionLevel):
            return GZipParameterBuilder(compressionLevel: compressionLevel)
        case .limit(let limit):
            return LimitParameterBuilder(limit: limit)
        case .startPosition(let position):
            return StartPositionParameterBuilder(startPosition: position)
        case .order(let order):
            return OrderParameterBuilder(order: order)
        }
    }
}

/// フィルターオプション
public enum FilterOption {
    /// タイトル
    case title(SearchWords)
    /// あらすじ
    case ex(SearchWords)
    /// キーワード
    case keyword(SearchWords)
    /// 作者名
    case wname(SearchWords)
    /// ビッグジャンル
    case bigGenre([BigGenre])
    /// 除外ビッグジャンル
    case excludeBigGenre([BigGenre])
    /// ジャンル
    case genre([Genre])
    /// 除外ジャンル
    case excludeGenre([Genre])
    /// ユーザID
    case userID([String])
    /// R15
    case r15(Bool)
    /// BL
    case bl(Bool)
    /// GL
    case gl(Bool)
    /// 残酷
    case zankoku(Bool)
    /// 転生
    case tensei(Bool)
    /// 転移
    case tenni(Bool)
    /// 文字数指定or読了時間（併用不可のため）
    case lengthOrTime(LengthOrTime)
    /// 会話率
    case kaiwaritu(RangeOption<Int>)
    /// 挿絵の数
    case sasie(RangeOption<Int>)
    /// Nコード
    case ncode([String])
    /// 小説タイプ
    case type(RequestNovelType)
    /// 文体
    case buntai([BuntaiType])
    /// 連載停止中
    case stop(Bool)
    /// 最終掲載日指定
    case lastup(LastupType)
    /// ピックアップ指定
    case isPickup(Bool)

    var builder: URLParameterBuildable {
        switch self {
        case .title(let searchWords):
            return TitleParameterBuilder(searchWords: searchWords)
        case .ex(let searchWords):
            return ExParameterBuilder(searchWords: searchWords)
        case .keyword(let searchWords):
            return KeywordParameterBuilder(searchWords: searchWords)
        case .wname(let searchWords):
            return WNameParameterBuilder(searchWords: searchWords)
        case .bigGenre(let bigGenres):
            return BigGenreExcludeParameterBuilder(bigGenreList: bigGenres)
        case .excludeBigGenre(let excludeBigGenre):
            return BigGenreExcludeParameterBuilder(bigGenreList: excludeBigGenre)
        case .genre(let genres):
            return GenreParameterBuilder(genreList: genres)
        case .excludeGenre(let excludeGenres):
            return GenreExcludeParameterBuilder(genreList: excludeGenres)
        case .userID(let userIDs):
            return UserIDParameterBuilder(userIDs: userIDs)
        case .r15(let isR15):
            return R15ParameterBuilder(isR15: isR15)
        case .bl(let isBL):
            return BLParameterBuilder(isBL: isBL)
        case .gl(let isGL):
            return GLParameterBuilder(isGL: isGL)
        case .zankoku(let isZankoku):
            return ZankokuParameterBuilder(isZankoku: isZankoku)
        case .tensei(let isTensei):
            return TenseiParameterBuilder(isTensei: isTensei)
        case .tenni(let isTenni):
            return TenniParameterBuilder(isTenni: isTenni)
        case .lengthOrTime(let lengthOrTime):
            switch lengthOrTime {
            case .length(let range):
                return LengthParameterBuilder(length: range)
            case .time(let range):
                return TimeParameterBuilder(time: range)
            }
        case .kaiwaritu(let rangeOption):
            return KaiwarituParameterBuilder(kaiwaritu: rangeOption)
        case .sasie(let sasie):
            return SasieParameterBuilder(sasie: sasie)
        case .ncode(let nCodes):
            return NCodeParameterBuilder(nCodes: nCodes)
        case .type(let requestNovelType):
            return TypeParameterBuilder(requestNovelType: requestNovelType)
        case .buntai(let buntaiTypes):
            return BuntaiParameterBuilder(buntaiTypes: buntaiTypes)
        case .stop(let stop):
            return StopParameterBuilder(stop: stop)
        case .lastup(let lastUpType):
            return LastUpParameterBuilder(lastUpType: lastUpType)
        case .isPickup(let pickUp):
            return PickUpParameterBuilder(pickUp: pickUp)
        }
    }
}

/// 順序オプション
public enum Order: String {
    /// 新着更新順
    case new = "new"
    /// ブックマーク数の多い順
    case favoriteNovelCount = "favnovelcnt"
    /// レビュー数の多い順
    case reviewCount = "reviewcnt"
    /// 総合ポイントの高い順
    case hyoka = "hyoka"
    /// 総合ポイントの低い順
    case hyokaAsc = "hyokaasc"
    /// 日間ポイントの高い順
    case dailyPoint = "dailypoint"
    /// 週間ポイントの高い順
    case weeklyPoint = "weeklypoint"
    /// 月間ポイントの高い順
    case monthlyPoint = "monthlypoint"
    /// 四半期ポイントの高い順
    case quarterPoint = "quarterpoint"
    /// 年間ポイントの高い順
    case yearlyPoint = "yearlypoint"
    /// 感想の多い順
    case impressionCount = "impressioncnt"
    /// 評価者数の多い順
    case hyokaCount = "hyokacnt"
    /// 評価者数の少ない順
    case hyokaCountAsc = "hyokacntasc"
    /// 週間ユニークユーザの多い順(毎週火曜日早朝リセット・前週の日曜日から土曜日分)
    case weekly = "weekly"
    /// 小説本文の文字数が多い順
    case lengthDesc = "lengthdesc"
    /// 小説本文の文字数が少ない順
    case lengthAsc = "lengthasc"
    /// 新着投稿順
    case ncodeDesc = "ncodedesc"
    /// 更新が古い順
    case old = "old"
}

/// 小説タイプ
public enum RequestNovelType: String {
    /// 短編
    case short = "t"
    /// 連載中
    case serialized = "r"
    /// 完結済連載小説
    case completedSerialize = "er"
    /// すべての連載小説(連載中および完結済)
    case serializedAndCompleted = "re"
    /// 短編と完結済連載小説
    case shortAndCompleted = "ter"
}

/// 文体タイプ
public enum BuntaiType: String {
    /// 字下げされておらず、連続改行が多い作品
    case notIndentationMuchNewLine
    /// 字下げされていないが、改行数は平均な作品
    case notIndentationAvarageNewLine
    /// 字下げが適切だが、連続改行が多い作品
    case indantationMuchNewLine
    /// 字下げが適切でかつ改行数も平均な作品
    case indantationAvarageNewLine
}

/// 最終掲載日タイプ
public enum LastupType {
    /// 今週(日曜日の午前0時はじまり)
    case thisWeek
    /// 先週
    case lastWeek
    /// 過去7日間(7日前の午前0時はじまり)
    case sevenday
    /// 今月
    case thisMonth
    /// 先月
    case lastMonth
    /// タイムスタンプで指定(min, max)
    case timestamp(Int, Int)

    var rawValue: String {
        switch self {
        case .thisWeek:
            return "thisweek"
        case .lastWeek:
            return "lastweek"
        case .sevenday:
            return "sevenday"
        case .thisMonth:
            return "thismonth"
        case .lastMonth:
            return "lastmonth"
        case .timestamp(let min, let max):
            return "\(min)-\(max)"
        }
    }
}

/// 文字数指定or読了時間
public enum LengthOrTime {
    /// 文字数指定
    case length(RangeOption<Int>)
    /// 読了時間指定
    case time(RangeOption<Int>)
}

/// 範囲オプション
public enum RangeOption<T: Comparable> {
    /// ちょうど
    case just(T)
    /// N以下
    case lowerThan(T)
    /// N以上
    case upperThan(T)
    /// N以上N以下
    case range(Range<T>)
}

/// 検索ワード
public struct SearchWords {
    /// 検索ワード
    let searchWords: [String]
    /// 除外ワード
    let excludeWords: [String]
}
