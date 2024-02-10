//
//  NodeList.swift
//  Node List
//
//  Created by Bryan Luna on 2/10/24.
//

import SwiftUI

struct NodeListView: View {
    
    @State private var items: [Item]
    
    init(items: [Item]) {
        self.items = items
    }
    
    var body: some View {
        ScrollView {
            ForEach(items) { item in
                Button {
                    changeState(for: item.id)
                } label: {
                    Text(item.title)
                        .font(.headline)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 72)
                .tint(.white)
                .background(
                    RoundedRectangle(cornerRadius: 20).fill(.black)
                        .overlay(content: {
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(lineWidth: 5)
                                .fill(.blue)
                        })
                )
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                
                if item.showChildren,
                   let items = item.children {
                    NodeListView(items: items)
                        .padding(.leading, 20)
                }
            }
        }
        .background(.black)
    }
    
    private func changeState(for id: UUID) {
        guard let index = items.firstIndex(where: { $0.id == id }) else { return }
        var item = items[index]
        item.toggle()
        items[index] = item
    }
}

#Preview {
    let items: [Item] = HomeViewModel().items
    
    return NodeListView(items: items)
}
