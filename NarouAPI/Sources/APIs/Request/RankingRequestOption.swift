//
//  RankingRequestOption.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/14.
//

import Foundation

private let rankDateFormat = "yyyyMMdd"

public enum RankingRequestOption {
    case gzip(Int)
    case rankingType(RankingType)
    
    var builder: URLParameterBuildable {
        switch self {
        case .gzip(let compressionLevel):
            return GZipParameterBuilder(compressionLevel: compressionLevel)
        case .rankingType(let rankingType):
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = rankDateFormat
            return RankingTypeParameterBuilder(rankingType: rankingType, dateFormatter: dateFormatter)
        }
    }
}

public struct RankingType {
    
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = rankDateFormat
        return formatter
    }()
    
    public enum DateType: String {
        /// 日毎
        case daily = "d"
        /// 週毎
        case weekly = "w"
        /// 月毎
        case monthly = "m"
        /// 四半期毎
        case quarterly = "q"
    }
    
    public var date: Date
    public var type: DateType
    
    public init (date: Date, type: DateType) {
        self.date = date
        self.type = type
    }
    
    /// "20100102-d" のような文字列で初期化
    public init(rankString: String) throws {
        let stringList = rankString.split(separator: "-")
        
        guard let dateString = stringList.first, let date = RankingType.dateFormatter.date(from: String(dateString)) else {
            throw RankingTypeInitialiedError.decodeToDate
        }
        guard let typeString = stringList[safe: 1], let type = DateType(rawValue: String(typeString)) else {
            throw RankingTypeInitialiedError.decodeToDateType
        }
        
        self.date = date
        self.type = type
    }
}

enum RankingTypeInitialiedError: Error {
    case decodeToDate
    case decodeToDateType
}
