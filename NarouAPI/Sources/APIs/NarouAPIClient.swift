//
//  NetworkPublisher.swift
//  Tsukimi
//
//  Created by tosaka on 2019/08/23.
//  Copyright © 2019 tosaka.net. All rights reserved.
//

import Alamofire
import Foundation

public struct NarouAPIClient {

    public enum Failure: Error {
        case error(String)
    }

    private static let successRange = 200 ..< 300
    private static let contentType = ["application/json"]
    private static let retryCount: Int = 1
    private static let queue: DispatchQueue = .main
    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()

    private static let decoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        return decoder
    }()

    private static func request<T>(_ request: T) -> DataRequest where T: BaseRequestProtocol {
        AF.request(request)
            .validate(statusCode: successRange)
            .validate(contentType: contentType)
    }

    public static func request<T: BaseRequestProtocol, V: Codable>(_ request: T, completion: @escaping (Result<V, AFError>) -> Void) where T.ResponseType == V {
        self.request(request).responseDecodable(of: V.self, queue: queue, decoder: decoder) { response in
            completion(response.result)
        }
    }

    public static func fetchNovels(options: [RequestOption], filterOptions: [NovelFilterOption], completion: @escaping (Result<NovelResponse, Failure>) -> Void) {
        let request = NovelRequest(options: options, filterOptions: filterOptions)
        self.request(request).responseDecodable(of: NovelResponse.self, queue: queue, decoder: decoder) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(Failure.error(error.localizedDescription)))
            }
        }
    }

    public static func fetchUsers(options: [RequestOption], filterOptions: [UserFilterOption], completion: @escaping (Result<UserResponse, Failure>) -> Void) {
        let request = UserRequest(options: options, filterOptions: filterOptions)
        self.request(request).responseDecodable(of: UserResponse.self, queue: queue, decoder: decoder) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(Failure.error(error.localizedDescription)))
            }
        }
    }
    
    public static func fetchRankings(options: [RankingRequestOption], completion: @escaping (Result<RankingResponse, Failure>) -> Void) {
        let request = RankingRequest(options: options)
        self.request(request).responseDecodable(of: RankingResponse.self, queue: queue, decoder: decoder) { response in
            switch response.result {
            case .success(let value):
                completion(.success(value))
            case .failure(let error):
                completion(.failure(Failure.error(error.localizedDescription)))
            }
        }
    }
}
