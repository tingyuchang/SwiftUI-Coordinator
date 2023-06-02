//
//  PushViewC.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct PushViewC: View {
    @EnvironmentObject var coordinator: DefaultCoordinator
    var body: some View {
        List {
            Text("This is page C")
        }
        .toolbar(content: {
            ToolbarItem {
                Button("Next") {
                    coordinator.push(page: .pageD)
                }
            }
        })
        .navigationTitle("Page C")
    }
}

struct PushViewC_Previews: PreviewProvider {
    static var previews: some View {
        PushViewC()
    }
}
