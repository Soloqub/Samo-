//
//  SampleApp.swift
//  Sample
//
//  Created by Денис Львович on 03.03.2024.
//

import SwiftUI

@main
struct SampleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(model: ModelMaker().makeContentModel())
        }
    }
}
