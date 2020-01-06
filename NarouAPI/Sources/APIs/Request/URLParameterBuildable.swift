//
//  URLRequestBuildable.swift
//  NarouAPI
//
//  Created by tosaka on 2019/12/31.
//

import Foundation

public protocol URLParameterBuildable {
    func build() -> [String: Any]
}
