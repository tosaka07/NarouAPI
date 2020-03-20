//
//  NetworkPublisher.swift
//  Tsukimi
//
//  Created by tosaka on 2019/08/23.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Foundation

public class NarouAPIClient {

    public enum Failure: Error {
        case invalidUrl
        case invalidQueryParameter
        // swiftlint:disable:next duplicate_enum_cases
        case fail(statusCode: Int)
        // swiftlint:disable:next duplicate_enum_cases
        case custom(description: String)
    }

    private let urlSession: URLSession
    private let successRange = 200 ... 200
    private let contentType = ["application/json"]
    private let retryCount: Int = 1
    private let queue: DispatchQueue = .main
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
    private lazy var decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()
    
    public init(urlSession: URLSession = .shared) {
        self.urlSession = urlSession
    }
    
    private func request<T: RequestProtocol, V>(_ request: T, completion: @escaping (Result<V, Failure>) -> Void) where T.ResponseType == V, V: Decodable {
        guard let urlRequest = try? request.asURLRequest() else {
            return completion(.failure(.invalidUrl))
        }
        let task = urlSession.dataTask(with: urlRequest) { [weak self] data, res, error in
            guard let self = self else {
                return completion(.failure(.custom(description: "Unexpected")))
            }
            guard let data = data else {
                let err: Failure
                if let res = res {
                    // swiftlint:disable:next force_cast
                    err = .fail(statusCode: (res as! HTTPURLResponse).statusCode)
                } else {
                    // swiftlint:disable:next force_unwrapping
                    err = .custom(description: error!.localizedDescription)
                }
                return completion(.failure(err))
            }
            do {
                let result = try self.decoder.decode(V.self, from: data)
                completion(.success(result))
                return
            } catch {
                completion(.failure(.custom(description: error.localizedDescription)))
            }
        }
        task.resume()
    }
    
    public func fetchNovels(options: [RequestOption], filterOptions: [NovelFilterOption], completion: @escaping (Result<NovelResponse, Failure>) -> Void) {
        let request = NovelRequest(options: options, filterOptions: filterOptions)
        self.request(request, completion: completion)
    }
    
    public func fetchUsers(options: [RequestOption], filterOptions: [UserFilterOption], completion: @escaping (Result<UserResponse, Failure>) -> Void) {
        let request = UserRequest(options: options, filterOptions: filterOptions)
        self.request(request, completion: completion)
    }
    
    public func fetchRankings(options: [RankingRequestOption], completion: @escaping (Result<RankingResponse, Failure>) -> Void) {
        let request = RankingRequest(options: options)
        self.request(request, completion: completion)
    }
    
    public func fetchRanks(ncode: String, options: [RankRequestOption], completion: @escaping (Result<RankResponse, Failure>) -> Void) {
        let request = RankRequest(ncode: ncode, options: options)
        self.request(request, completion: completion)
    }
}
