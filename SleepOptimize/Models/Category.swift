//
//  Category.swift
//  SleepOptimize
//
//  Created by Eze Chidera Paschal on 22/08/2024.
//

import Foundation

struct Item: Hashable {
    var image: String
    var title: String
}

struct Category: Hashable {
    var name: String
    var items: [Item]
}
