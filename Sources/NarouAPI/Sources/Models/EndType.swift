//
//  EndType.swift
//  NarouAPI
//
//  Created by tosaka on 2019/08/23.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Foundation

public enum EndType: Int, Decodable {
    /// 短編小説と完結済小説
    case shortOrCompleted = 0
    /// 連載中
    case serialized = 1
}
