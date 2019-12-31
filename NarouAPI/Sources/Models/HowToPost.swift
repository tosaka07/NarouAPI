//
//  HowToPost.swift
//  NarouAPI
//
//  Created by tosaka on 2019/08/23.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Foundation

public enum HowToPost: Int, Decodable {
    /// ケータイのみ
    case phone = 1
    /// PCのみ
    case pc = 2
    /// PCとケータイ
    case pcWithPhone = 3
}
