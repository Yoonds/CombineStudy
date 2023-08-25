//
//  CoronaERror.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/25.
//

import Foundation

enum CoronaError: Error {
    case parsing(description: String)
    case network(description: String)
}
