//
//  CoronaService.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/22.
//

import Foundation
import Combine

protocol CoronaFetchable {
    
    func coronaFetch() -> AnyPublisher<CoronaDataResponse, CoronaError>
    
}

class CoronaService: CoronaFetchable {
    
    private let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }

}

extension CoronaService {
    
    func coronaFetch() -> AnyPublisher<CoronaDataResponse, CoronaError> {
        return requestCoronaData(with: CoronaAPI.urlComponents)
    }
    
    private func requestCoronaData(with components: URLComponents) -> AnyPublisher<CoronaDataResponse, CoronaError> {
        
        guard let url = components.url else {
            let error = CoronaError.network(description: "Couldn't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        
        return session.dataTaskPublisher(for: URLRequest(url: url))
            .mapError { CoronaError.network(description: $0.localizedDescription) }
            .flatMap(maxPublishers: .max(1)) { decode($0.data) }
            .eraseToAnyPublisher()
    }
}
