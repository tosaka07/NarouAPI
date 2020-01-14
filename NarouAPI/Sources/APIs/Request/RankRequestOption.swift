//
//  RankRequestOption.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/14.
//

import Foundation

public enum RankRequestOption {
    case gzip(Int)
    
    var builder: URLParameterBuildable {
        switch self {
        case .gzip(let compressionLevel):
            return GZipParameterBuilder(compressionLevel: compressionLevel)
        }
    }
}
