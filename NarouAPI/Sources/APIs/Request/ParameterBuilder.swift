//
//  OrderRequestOptionBuilder.swift
//  NarouAPI
//
//  Created by tosaka on 2019/12/31.
//

import Foundation

struct GZipParameterBuilder: URLParameterBuildable {

    let compressionLevel: Int

    func build() -> [String : Any] {
        let level = max(min(compressionLevel, 5), 1)
        return ["gzip": "\(level)"]
    }
}

struct LimitParameterBuilder: URLParameterBuildable {

    let limit: Int

    func build() -> [String: Any] {
        let limit = max(min(self.limit, 500), 1)
        return ["lim": "\(limit)"]
    }
}

struct StartPositionParameterBuilder: URLParameterBuildable {

    let startPosition: Int

    func build() -> [String: Any] {
        let startPosition = max(min(self.startPosition, 500), 1)
        return ["st": "\(startPosition)"]
    }
}

struct OrderParameterBuilder: URLParameterBuildable {

    let order: Order

    func build() -> [String: Any] {
        ["order": order.rawValue]
    }
}

struct OutputParameterBuilder: URLParameterBuildable {
    func build() -> [String : Any] {
        ["out": "json"] // jsonという決め
    }
}

struct TitleParameterBuilder: URLParameterBuildable {

    let searchWords: SearchWords

    func build() -> [String : Any] {
        [
            "title": "1",
            "word": searchWords.searchWords.joined(separator: " "),
            "notword": searchWords.excludeWords.joined(separator: " ")
        ]
    }
}

struct ExParameterBuilder: URLParameterBuildable {

    let searchWords: SearchWords

    func build() -> [String : Any] {
        [
            "ex": "1",
            "word": searchWords.searchWords.joined(separator: " "),
            "notword": searchWords.excludeWords.joined(separator: " ")
        ]
    }
}

struct KeywordParameterBuilder: URLParameterBuildable {

    let searchWords: SearchWords

    func build() -> [String : Any] {
        [
            "keyword": "1",
            "word": searchWords.searchWords.joined(separator: " "),
            "notword": searchWords.excludeWords.joined(separator: " ")
        ]
    }
}

struct WNameParameterBuilder: URLParameterBuildable {

    let searchWords: SearchWords

    func build() -> [String : Any] {
        [
            "wname": "1",
            "word": searchWords.searchWords.joined(separator: " "),
            "notword": searchWords.excludeWords.joined(separator: " ")
        ]
    }
}

struct BigGenreParameterBuilder: URLParameterBuildable {

    let bigGenreList: [BigGenre]

    func build() -> [String : Any] {
        ["biggenre": bigGenreList.map { "\($0.rawValue)" }.joined(separator: "-")]
    }
}

struct BigGenreExcludeParameterBuilder: URLParameterBuildable {

    let bigGenreList: [BigGenre]

    func build() -> [String : Any] {
        ["notbiggenre": bigGenreList.map { "\($0.rawValue)" }.joined(separator: "-")]
    }
}

struct GenreParameterBuilder: URLParameterBuildable {

    let genreList: [Genre]

    func build() -> [String : Any] {
        ["genre": genreList.map { "\($0.rawValue)" }.joined(separator: "-")]
    }
}

struct GenreExcludeParameterBuilder: URLParameterBuildable {

    let genreList: [Genre]

    func build() -> [String : Any] {
        ["notgenre": genreList.map { "\($0.rawValue)" }.joined(separator: "-")]
    }
}

struct MultipleUserIDParameterBuilder: URLParameterBuildable {
    let userIDs: [Int]

    func build() -> [String : Any] {
        ["userid": userIDs.map { "\($0)" }.joined(separator: "-")]
    }
}

struct UserIDParameterBuilder: URLParameterBuildable {
    let userID: Int

    func build() -> [String: Any] {
        ["userid": userID]
    }
}

struct R15ParameterBuilder: URLParameterBuildable {
    let isR15: Bool

    func build() -> [String : Any] {
        let key = isR15 ? "isr15" : "notr15"
        return [key: "1"]
    }
}

struct BLParameterBuilder: URLParameterBuildable {
    let isBL: Bool

    func build() -> [String : Any] {
        let key = isBL ? "isbl" : "notbl"
        return [key: "1"]
    }
}

struct GLParameterBuilder: URLParameterBuildable {
    let isGL: Bool

    func build() -> [String : Any] {
        let key = isGL ? "isgl" : "notgl"
        return [key: "1"]
    }
}

struct ZankokuParameterBuilder: URLParameterBuildable {
    let isZankoku: Bool

    func build() -> [String : Any] {
        let key = isZankoku ? "iszankoku" : "notzankoku"
        return [key: "1"]
    }
}

struct TenseiParameterBuilder: URLParameterBuildable {
    let isTensei: Bool

    func build() -> [String : Any] {
        let key = isTensei ? "istensei" : "nottensei"
        return [key: "1"]
    }
}

struct TenniParameterBuilder: URLParameterBuildable {
    let isTenni: Bool

    func build() -> [String : Any] {
        let key = isTenni ? "istenni" : "nottenni"
        return [key: "1"]
    }
}

struct LengthParameterBuilder: URLParameterBuildable {
    let length: ExtendedRangeOption<Int>

    func build() -> [String : Any] {
        let key = "length"
        switch length {
        case .equal(let value):
            return [key: "\(value)"]
        case .lessThanOrEqual(let value):
            return [key: "-\(value)"]
        case .greaterThanOrEqual(let value):
            return [key: "\(value)-"]
        case .range(let range):
            guard let min = range.min(), let max = range.max() else {
                return [:]
            }
            return [key: "\(min)-\(max)"]
        }
    }
}

struct TimeParameterBuilder: URLParameterBuildable {
    let time: ExtendedRangeOption<Int>

    func build() -> [String : Any] {
        let key = "time"
        switch time {
        case .equal(let value):
            return [key: "\(value)"]
        case .lessThanOrEqual(let value):
            return [key: "-\(value)"]
        case .greaterThanOrEqual(let value):
            return [key: "\(value)-"]
        case .range(let range):
            guard let min = range.min(), let max = range.max() else {
                return [:]
            }
            return [key: "\(min)-\(max)"]
        }
    }
}

struct KaiwarituParameterBuilder: URLParameterBuildable {
    let kaiwaritu: ExtendedRangeOption<Int>

    func build() -> [String : Any] {
        let key = "kaiwaritu"
        switch kaiwaritu {
        case .equal(let value):
            return [key: "\(value)"]
        case .lessThanOrEqual(let value):
            return [key: "-\(value)"]
        case .greaterThanOrEqual(let value):
            return [key: "\(value)-"]
        case .range(let range):
            guard let min = range.min(), let max = range.max() else {
                return [:]
            }
            return [key: "\(min)-\(max)"]
        }
    }
}

struct SasieParameterBuilder: URLParameterBuildable {
    let sasie: ExtendedRangeOption<Int>

    func build() -> [String : Any] {
        let key = "sasie"
        switch sasie {
        case .equal(let value):
            return [key: "\(value)"]
        case .lessThanOrEqual(let value):
            return [key: "-\(value)"]
        case .greaterThanOrEqual(let value):
            return [key: "\(value)-"]
        case .range(let range):
            guard let min = range.min(), let max = range.max() else {
                return [:]
            }
            return [key: "\(min)-\(max)"]
        }
    }
}

struct NCodeParameterBuilder: URLParameterBuildable {
    let nCodes: [String]

    func build() -> [String : Any] {
        ["ncode": nCodes.joined(separator: "-")]
    }
}

struct TypeParameterBuilder: URLParameterBuildable {

    let requestNovelType: RequestNovelType

    func build() -> [String: Any] {
        ["type": requestNovelType.rawValue]
    }
}

struct BuntaiParameterBuilder: URLParameterBuildable {

    let buntaiTypes: [BuntaiType]

    func build() -> [String: Any] {
        ["buntai": buntaiTypes.map { $0.rawValue }.joined(separator: "-")]
    }
}

struct StopParameterBuilder: URLParameterBuildable {
    let stop: Bool

    func build() -> [String : Any] {
        let value = stop ? "2" : "1"
        return ["stop": value]
    }
}

struct LastUpParameterBuilder: URLParameterBuildable {
    let lastUpType: LastupType

    func build() -> [String : Any] {
        ["lastup": lastUpType.rawValue]
    }
}

struct PickUpParameterBuilder: URLParameterBuildable {
    let pickUp: Bool

    func build() -> [String : Any] {
        if pickUp {
            return ["ispickup": "1"]
        }
        return [:]
    }
}

struct Name1stParameterBuilder: URLParameterBuildable {
    let name1st: String

    func build() -> [String : Any] {
        return ["name1st": name1st]
    }
}

struct NovelCountParameterBuilder: URLParameterBuildable {
    let rangeOption: RangeOption<Int>

    func build() -> [String : Any] {
        switch rangeOption {
        case .greaterThanOrEqual(let value):
            return ["minnovel": value]
        case .lessThanOrEqual(let value):
            return ["maxnovel": value]
        case .range(let range):
            guard let min = range.min(), let max = range.max() else {
                return [:]
            }
            return ["minnovel": min, "maxnovel": max]
        }
    }
}

struct ReviewCountParameterBuilder: URLParameterBuildable {
    let rangeOption: RangeOption<Int>

    func build() -> [String : Any] {
        switch rangeOption {
        case .greaterThanOrEqual(let value):
            return ["minreview": value]
        case .lessThanOrEqual(let value):
            return ["maxreview": value]
        case .range(let range):
            guard let min = range.min(), let max = range.max() else {
                return [:]
            }
            return ["minnovel": min, "maxnovel": max]
        }
    }
}

struct UsernameParameterBuilder: URLParameterBuildable {
    let searchWords: SearchWords

    func build() -> [String : Any] {
        var parameters: [String : Any] = [:]
        if !searchWords.searchWords.isEmpty {
            parameters["word"] = searchWords.searchWords.joined(separator: " ")
        }
        if !searchWords.excludeWords.isEmpty {
            parameters["notword"] = searchWords.excludeWords.joined(separator: " ")
        }
        return parameters
    }
}

struct RankingTypeParameterBuilder: URLParameterBuildable {
    let rankingType: RankingType
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter
    }()
    
    func build() -> [String : Any] {
        let key = "rtype"
        let formattedDate = dateFormatter.string(from: rankingType.date)
        switch rankingType.type {
        case .daily:
            return [key: "\(formattedDate)-d"]
        case .weekly:
            return [key: "\(formattedDate)-w"]
        case .monthly:
            return [key: "\(formattedDate)-m"]
        case .quarterly:
            return [key: "\(formattedDate)-q"]
        }
    }
}
