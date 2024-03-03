//
//  Timer.swift
//  Sample
//
//  Created by Денис Львович on 03.03.2024.
//

import Foundation

struct AsyncTimer {
    func timerTickStream() async -> AsyncStream<Void> {
        let stream = AsyncStream<Void> { continuation in
            Task {
                while true {
                    try await Task.sleep(for: .seconds(1))
                    continuation.yield()
                }
            }
        }
        
        return stream
    }
}
