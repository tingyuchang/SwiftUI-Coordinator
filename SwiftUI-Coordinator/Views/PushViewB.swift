//
//  PushViewB.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct PushViewB: View {
    @EnvironmentObject var coordinator: DefaultCoordinator
    var body: some View {
        List {
            Text("This is page B")
        }
        .toolbar(content: {
            ToolbarItem {
                Button("Next") {
                    coordinator.push(page: .pageC)
                }
            }
        })
        .navigationTitle("Page B")
    }
}

struct PushViewB_Previews: PreviewProvider {
    static var previews: some View {
        PushViewB()
    }
}
