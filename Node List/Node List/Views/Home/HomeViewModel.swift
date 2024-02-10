//
//  NodeListViewModel.swift
//  Node List
//
//  Created by Bryan Luna on 2/10/24.
//

import Foundation

final class HomeViewModel: ObservableObject {
    
    // MARK: - Properties
    
    let items: [Item] = (0...5).map { num in
        let items = (0...2).map { Item(title: "Sub-Node #\($0)", showChildren: false, children: nil) }
        return Item(title: "Node #\(num)", showChildren: false, children: num % 2 == 0 ? items : nil)
    }
}
