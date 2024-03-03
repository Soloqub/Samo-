//
//  ModelMaker.swift
//  Sample
//
//  Created by Денис Львович on 04.03.2024.
//

import Foundation

struct ModelMaker {
    private let randomizer = Randomizer()
    
    func makeContentModel() -> ContentModel {
        let modelsNum = randomizer.rows
        let rowModels = makeRowModels(modelsNum)
        
        return ContentModel(rowModels: rowModels)
    }
    
    private func makeRowModels(_ quantity: Int) -> [RowModel] {
        (0..<quantity).map { RowModel(id: $0, items: randomizer.cells) }
    }
}
