//
//  PushViewD.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct PushViewD: View {
    @EnvironmentObject var coordinator: DefaultCoordinator
    var body: some View {
        List {
            Text("This is page D")
        }
        .toolbar(content: {
            ToolbarItem {
                Button("Next") {
                    coordinator.push(page: .pageE)
                }
            }
        })
        .navigationTitle("Page D")
    }
}

struct PushViewD_Previews: PreviewProvider {
    static var previews: some View {
        PushViewD()
    }
}
