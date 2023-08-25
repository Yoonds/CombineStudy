//
//  Decode.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/25.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, CoronaError> {
  let decoder = JSONDecoder()
  decoder.dateDecodingStrategy = .secondsSince1970

  return Just(data)
    .decode(type: T.self, decoder: decoder)
    .mapError { .parsing(description: $0.localizedDescription) }
    .eraseToAnyPublisher()
}
