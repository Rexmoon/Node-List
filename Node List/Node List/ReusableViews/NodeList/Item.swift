//
//  Item.swift
//  Node List
//
//  Created by Bryan Luna on 2/9/24.
//

import Foundation

struct Item: Identifiable {
    var id: UUID = .init()
    let title: String
    var showChildren: Bool
    let children: [Item]?
    
    mutating func toggle() {
        showChildren.toggle()
    }
}
