//
//  PushViewA.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct PushViewA: View {
    @EnvironmentObject var coordinator: DefaultCoordinator
    var body: some View {
        List {
            Text("This is page A")
            Button("Present Sheet") {
                coordinator.present(sheet: .sheetA)
            }
            
            Button("Present FullScreenCover") {
                coordinator.present(fullScreenCover: .fullScreenCoverA)
            }
        }
        .toolbar(content: {
            ToolbarItem {
                Button("Next") {
                    coordinator.push(page: .pageB)
                }
            }
        })
        .navigationTitle("Page A")
    }
}

struct PushViewA_Previews: PreviewProvider {
    static var previews: some View {
        PushViewA()
    }
}
