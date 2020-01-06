//
//  UserResponse.swift
//  NarouAPI
//
//  Created by 坂上 翔悟 on 2020/01/06.
//

import Foundation

public struct UserResponse: Decodable {
    public var allCount: Int
    public var users: [User]

    public init(from decoder: Decoder) throws {
        var unkeyedContainer = try decoder.unkeyedContainer()
        allCount = try unkeyedContainer.decode(Count.self).allcount

        var result: [User] = []
        result.reserveCapacity(allCount)
        while !unkeyedContainer.isAtEnd {
            result.append(try unkeyedContainer.decode(User.self))
        }
        users = result
    }
}
