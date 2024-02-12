//
//  NodeList.swift
//  Node List
//
//  Created by Bryan Luna on 2/10/24.
//

import SwiftUI

struct NodeListView: View {

    @Binding private var selectedItem: Item?
    @State private var selectedSubItem: Item?
    
    private let items: [Item]
    
    init(items: [Item], 
         selectedItem: Binding<Item?>) {
        self.items = items
        _selectedItem = selectedItem
        self.selectedSubItem = selectedItem.wrappedValue
    }
    
    var body: some View {
        ScrollView {
            ForEach(items) { item in
                LazyVStack {
                    Button {
                        selectedItem = item
                    } label: {
                        Text(item.title)
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .frame(height: 72)
                            .tint(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20).fill(.black)
                                    .overlay(content: {
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(lineWidth: 5)
                                            .fill(isSelected(item: item) ? .blue : .gray)
                                    })
                            )
                            .padding(.vertical, 5)
                            .padding(.horizontal, 10)
                    }
                    
                    if isSelected(item: item),
                       let children = item.children {
                        NodeListView(items: children, selectedItem: $selectedItem)
                            .padding(.leading, 30)
                    }
                }
            }
        }
        .background(.black)
    }
    
    private func isSelected(item: Item) -> Bool {
        guard let selectedItem else { return false }
        return selectedItem.id == item.id
    }
}

#Preview {
    let items: [Item] = HomeViewModel().items
    
    return NodeListView(items: items, selectedItem: .constant(nil))
}
