//
//  Item.swift
//  Node List
//
//  Created by Bryan Luna on 2/9/24.
//

import Foundation

struct Item: Identifiable, Equatable {
    var id: UUID = .init()
    let title: String
    let children: [Item]?
}
