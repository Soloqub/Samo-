//
//  ContentView.swift
//  Sample
//
//  Created by Денис Львович on 03.03.2024.
//

import SwiftUI

struct ContentView: View {
    var model: ContentModel
    
    var body: some View {
        List(model.rowModels, id: \.id) { rowModel in
            RowView(model: rowModel)
        }
    }
}

struct RowView: View {
    @StateObject var model: RowModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(Array(model.items.enumerated()), id: \.offset) { column in
                    ItemView(value: column.element)
                        .padding(1.0)
                }
            }
        }
    }
}

struct ItemView: View {
    var value: Int
    @State private var scale = 1.0
            
    var body: some View {

        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .delaysTouches(for: 0.05)
                .gesture(
                    DragGesture(minimumDistance: 0.0, coordinateSpace: .global)
                        .onChanged { _ in
                            withAnimation {
                                scale = 0.8
                            }
                        }
                        .onEnded { _ in
                            withAnimation {
                                scale = 1.0
                            }
                        }
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.blue, lineWidth: 2.0)                
                        .scaleEffect(scale))
            

            Text("\(value)")
                .font(.largeTitle)
                .foregroundStyle(.secondary)
                .allowsHitTesting(false)
        }

    }
}



#Preview {
    ContentView(model: ModelMaker().makeContentModel())
}
