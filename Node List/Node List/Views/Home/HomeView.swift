//
//  ContentView.swift
//  Node List
//
//  Created by Bryan Luna on 2/9/24.
//

import SwiftUI

struct HomeView: View {
    
    private let viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink {
                    NodeListView(items: viewModel.items)
                } label: {
                    Text("Select another")
                        .padding()
                        .tint(.white)
                        .background(RoundedRectangle(cornerRadius: 8).fill(.blue))
                }

            }
            .navigationTitle("Home View")
        }
    }
}

#Preview {
    HomeView(viewModel: .init())
}
