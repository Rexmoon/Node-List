//
//  NodeListViewModel.swift
//  Node List
//
//  Created by Bryan Luna on 2/10/24.
//

import Foundation

final class HomeViewModel {
    
    // MARK: - Properties
    
    var items: [Item]
    
    // MARK: - Initializers
    
    init() {
        self.items = (0...5).map { num in
            let items = (0...2).map { Item(title: "Sub-Node \(num) #\($0)", children: nil) }
            return Item(title: "Node #\(num)", children: num % 2 == 0 ? items : nil)
        }
    }
}
