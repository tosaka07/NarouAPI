//
//  NovelType.swift
//  NarouAPI
//
//  Created by tosaka on 2019/08/23.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Foundation

public enum NovelType: Int, Decodable {
    /// 連載
    case serial = 1
    /// 短編
    case short = 2
}
