//
//  CoronaService.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/22.
//

import Foundation
import Combine

enum CoronaError: Error {
    case parsing(description: String)
    case network(description: String)
}

class CoronaService {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func requestCoronaData(by city: String) -> AnyPublisher<CoronaDataResponse, CoronaError> {
        
        guard let url = CoronaAPI.makeCoronaURL() else {
            let error = CoronaError.network(description: "couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher() // 하는 역활 궁금
        }
        
        let responseData = session.dataTaskPublisher(for: url)
            .mapError { .network(description: $0.localizedDescription) }
            .flatMap(maxPublishers: .max(1)) { decode($0.data) }
    }
}


extension CoronaService {
    
    func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, CoronaError> {
      let decoder = JSONDecoder()
      decoder.dateDecodingStrategy = .secondsSince1970

      return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { .parsing(description: $0.localizedDescription) }
        .eraseToAnyPublisher()
    }
    
}
