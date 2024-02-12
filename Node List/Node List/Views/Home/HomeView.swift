//
//  ContentView.swift
//  Node List
//
//  Created by Bryan Luna on 2/9/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var selectedItem: Item?
    
    private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel,
         selectedItem: Item?) {
        self.viewModel = viewModel
        self.selectedItem = selectedItem
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Selected: \(selectedItem?.title ?? "Not item")")
                
                NavigationLink {
                    NodeListView(items: viewModel.items, selectedItem: $selectedItem)
                } label: {
                    Text("Select Item")
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
    HomeView(viewModel: .init(), selectedItem: nil)
}
