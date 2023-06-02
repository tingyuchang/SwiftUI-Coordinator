//
//  PushViewE.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct PushViewE: View {
    @EnvironmentObject var coordinator: DefaultCoordinator
    var body: some View {
        List {
            Text("This is page E")
        }
        .toolbar(content: {
            ToolbarItem {
                Button("Pop to Root") {
                    coordinator.popToRoot()
                }
            }
        })
        .navigationTitle("Page E")
    }
}

struct PushViewE_Previews: PreviewProvider {
    static var previews: some View {
        PushViewE()
    }
}
