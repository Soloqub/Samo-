//
//  ContentModel.swift
//  Sample
//
//  Created by Денис Львович on 03.03.2024.
//

import Foundation

final class ContentModel: ObservableObject {
    private let streamer = AsyncTimer()
    
    let rowModels: [RowModel]
    
    init(rowModels: [RowModel]) {
        self.rowModels = rowModels
        start()
    }
    
    private func start() {
        Task {
            for await _ in await streamer.timerTickStream() {
                rowModels.forEach { rowModel in
                    rowModel.receiveTick()
                }
                print()
            }
        }
    }
}

final class RowModel: ObservableObject {
    let id: Int
    @Published var items: [Int]
        
    init(id: Int, items: [Int]) {
        self.id = id
        self.items = items
    }
    
    @MainActor
    private func updateItems() {
        items = Randomizer().updateItems(items: items)
    }
    
    func receiveTick() {
        Task {
            await updateItems()
        }
    }
}
