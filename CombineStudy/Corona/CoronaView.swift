//
//  CoronaView.swift
//  CombineStudy
//
//  Created by YoonDaesung on 2023/08/22.
//

import SwiftUI

struct CoronaView: View {
    
    @ObservedObject var viewMdoel: CoronaViewModel
    
    var body: some View {
        VStack {
            seachTextField
            Button(
                "검색",
                action: {
                
            })
        }
        .padding()
    }
    
}

extension CoronaView {
    
    var seachTextField: some View {
        HStack(alignment: .center) {
            TextField("지역 입력", text: $viewMdoel.city)
        }
    }
    
}
