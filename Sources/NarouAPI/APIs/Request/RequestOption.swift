//
//  RequestOption.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/06.
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
