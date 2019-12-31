//
//  OrderRequestOptionBuilder.swift
//  NarouAPI
//
//  Created by tosaka on 2019/12/31.
//

import Foundation

struct GZipParameterBuilder: URLParameterBuildable {

    let compressionLevel: Int

    func build() -> [String : String] {
        let level = max(min(compressionLevel, 5), 1)
        return ["gzip": "\(level)"]
    }
}

struct LimitParameterBuilder: URLParameterBuildable {

    let limit: Int

    func build() -> [String: String] {
        let limit = max(min(self.limit, 500), 1)
        return ["lim": "\(limit)"]
    }
}

struct StartPositionParameterBuilder: URLParameterBuildable {

    let startPosition: Int

    func build() -> [String: String] {
        let startPosition = max(min(self.startPosition, 500), 1)
        return ["st": "\(startPosition)"]
    }
}

struct OrderParameterBuilder: URLParameterBuildable {

    let order: Order

    func build() -> [String: String] {
        ["order": order.rawValue]
    }
}

struct OutputParameterBuilder: URLParameterBuildable {
    func build() -> [String : String] {
        ["out": "json"] // jsonという決め
    }
}

struct TitleParameterBuilder: URLParameterBuildable {

    let searchWords: SearchWords

    func build() -> [String : String] {
        [
            "title": "1",
            "word": searchWords.searchWords.joined(separator: " "),
            "notword": searchWords.excludeWords.joined(separator: " ")
        ]
    }
}

struct ExParameterBuilder: URLParameterBuildable {

    let searchWords: SearchWords

    func build() -> [String : String] {
        [
            "ex": "1",
            "word": searchWords.searchWords.joined(separator: " "),
            "notword": searchWords.excludeWords.joined(separator: " ")
        ]
    }
}

struct KeywordParameterBuilder: URLParameterBuildable {

    let searchWords: SearchWords

    func build() -> [String : String] {
        [
            "keyword": "1",
            "word": searchWords.searchWords.joined(separator: " "),
            "notword": searchWords.excludeWords.joined(separator: " ")
        ]
    }
}

struct WNameParameterBuilder: URLParameterBuildable {

    let searchWords: SearchWords

    func build() -> [String : String] {
        [
            "wname": "1",
            "word": searchWords.searchWords.joined(separator: " "),
            "notword": searchWords.excludeWords.joined(separator: " ")
        ]
    }
}

struct BigGenreParameterBuilder: URLParameterBuildable {

    let bigGenreList: [BigGenre]

    func build() -> [String : String] {
        ["biggenre": bigGenreList.map { "\($0.rawValue)" }.joined(separator: "-")]
    }
}

struct BigGenreExcludeParameterBuilder: URLParameterBuildable {

    let bigGenreList: [BigGenre]

    func build() -> [String : String] {
        ["notbiggenre": bigGenreList.map { "\($0.rawValue)" }.joined(separator: "-")]
    }
}

struct GenreParameterBuilder: URLParameterBuildable {

    let genreList: [Genre]

    func build() -> [String : String] {
        ["genre": genreList.map { "\($0.rawValue)" }.joined(separator: "-")]
    }
}

struct GenreExcludeParameterBuilder: URLParameterBuildable {

    let genreList: [Genre]

    func build() -> [String : String] {
        ["notgenre": genreList.map { "\($0.rawValue)" }.joined(separator: "-")]
    }
}

struct UserIDParameterBuilder: URLParameterBuildable {
    let userIDs: [String]

    func build() -> [String : String] {
        ["userid":userIDs.joined(separator: "-")]
    }
}

struct R15ParameterBuilder: URLParameterBuildable {
    let isR15: Bool

    func build() -> [String : String] {
        let key = isR15 ? "isr15" : "notr15"
        return [key: "1"]
    }
}

struct BLParameterBuilder: URLParameterBuildable {
    let isBL: Bool

    func build() -> [String : String] {
        let key = isBL ? "isbl" : "notbl"
        return [key: "1"]
    }
}

struct GLParameterBuilder: URLParameterBuildable {
    let isGL: Bool

    func build() -> [String : String] {
        let key = isGL ? "isgl" : "notgl"
        return [key: "1"]
    }
}

struct ZankokuParameterBuilder: URLParameterBuildable {
    let isZankoku: Bool

    func build() -> [String : String] {
        let key = isZankoku ? "iszankoku" : "notzankoku"
        return [key: "1"]
    }
}

struct TenseiParameterBuilder: URLParameterBuildable {
    let isTensei: Bool

    func build() -> [String : String] {
        let key = isTensei ? "istensei" : "nottensei"
        return [key: "1"]
    }
}

struct TenniParameterBuilder: URLParameterBuildable {
    let isTenni: Bool

    func build() -> [String : String] {
        let key = isTenni ? "istenni" : "nottenni"
        return [key: "1"]
    }
}

struct LengthParameterBuilder: URLParameterBuildable {
    let length: RangeOption<Int>

    func build() -> [String : String] {
        let key = "length"
        switch length {
        case .just(let value):
            return [key: "\(value)"]
        case .lowerThan(let value):
            return [key: "-\(value)"]
        case .upperThan(let value):
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
    let time: RangeOption<Int>

    func build() -> [String : String] {
        let key = "time"
        switch time {
        case .just(let value):
            return [key: "\(value)"]
        case .lowerThan(let value):
            return [key: "-\(value)"]
        case .upperThan(let value):
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
    let kaiwaritu: RangeOption<Int>

    func build() -> [String : String] {
        let key = "kaiwaritu"
        switch kaiwaritu {
        case .just(let value):
            return [key: "\(value)"]
        case .lowerThan(let value):
            return [key: "-\(value)"]
        case .upperThan(let value):
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
    let sasie: RangeOption<Int>

    func build() -> [String : String] {
        let key = "sasie"
        switch sasie {
        case .just(let value):
            return [key: "\(value)"]
        case .lowerThan(let value):
            return [key: "-\(value)"]
        case .upperThan(let value):
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

    func build() -> [String : String] {
        ["ncode": nCodes.joined(separator: "-")]
    }
}

struct TypeParameterBuilder: URLParameterBuildable {

    let requestNovelType: RequestNovelType

    func build() -> [String: String] {
        ["type": requestNovelType.rawValue]
    }
}

struct BuntaiParameterBuilder: URLParameterBuildable {

    let buntaiTypes: [BuntaiType]

    func build() -> [String: String] {
        ["buntai": buntaiTypes.map { $0.rawValue }.joined(separator: "-")]
    }
}

struct StopParameterBuilder: URLParameterBuildable {
    let stop: Bool

    func build() -> [String : String] {
        let value = stop ? "2" : "1"
        return ["stop": value]
    }
}

struct LastUpParameterBuilder: URLParameterBuildable {
    let lastUpType: LastupType

    func build() -> [String : String] {
        ["lastup": lastUpType.rawValue]
    }
}

struct PickUpParameterBuilder: URLParameterBuildable {
    let pickUp: Bool

    func build() -> [String : String] {
        if pickUp {
            return ["ispickup": "1"]
        }
        return [:]
    }
}
