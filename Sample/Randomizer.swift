//
//  Randomizer.swift
//  Sample
//
//  Created by Денис Львович on 03.03.2024.
//

import Foundation

struct Randomizer {
    var rows: Int {
        Int.random(in: 101..<250)
    }
    
    var cells: [Int] {
        (0..<cellsQuantity).map { _ in Int.random(in: 0..<10) }
    }
    
    private var cellsQuantity: Int {
        Int.random(in: 10..<20)
    }
    
    func updateItems(items: [Int]) -> [Int] {
        var items = items
        let index = Int.random(in: 0..<items.count)
        
        items[index] = Int.random(in: 0..<10)
        return items
    }
}
