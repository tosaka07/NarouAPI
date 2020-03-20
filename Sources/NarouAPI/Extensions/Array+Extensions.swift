//
//  Array+Extensions.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/14.
//

import Foundation

extension Collection {
    public subscript(safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
