//
//  RangeOption.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/06.
//

import Foundation

/// 範囲オプション
public enum ExtendedRangeOption<T: Comparable> {
    /// =
    case equal(T)
    /// T以下
    case lessThanOrEqual(T)
    /// T以上
    case greaterThanOrEqual(T)
    /// range
    case range(Range<T>)
}

/// 範囲オプション
public enum RangeOption<T: Comparable> {
    /// N以下
    case lessThanOrEqual(T)
    /// N以上
    case greaterThanOrEqual(T)
    /// range
    case range(Range<T>)
}
