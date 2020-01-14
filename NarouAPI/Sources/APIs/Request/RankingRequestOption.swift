//
//  RankingRequestOption.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/14.
//

import Foundation

public enum RankingRequestOption {
    case gzip(Int)
    case rankingType(RankingType)
    
    var builder: URLParameterBuildable {
        switch self {
        case .gzip(let compressionLevel):
            return GZipParameterBuilder(compressionLevel: compressionLevel)
        case .rankingType(let rankingType):
            return RankingTypeParameterBuilder(rankingType: rankingType)
        }
    }
}

public struct RankingType {
    public enum DateType {
        /// 日毎
        case daily
        /// 週毎
        case weekly
        /// 月毎
        case monthly
        /// 四半期毎
        case quarterly
    }
    
    public var date: Date
    public var type: DateType
    
    public init (date: Date, type: DateType) {
        self.date = date
        self.type = type
    }
}
