//
//  SheetViewB.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct SheetViewB: View {
    @EnvironmentObject var coordinator: DefaultCoordinator
    var body: some View {
        List {
            Text("This is Sheet B")
            Button("Present Sheet A") {
                coordinator.present(sheet: .sheetA)
            }
            Button("Present Sheet C") {
                coordinator.present(sheet: .sheetC)
            }
            Button("Dismiss") {
                coordinator.dismiss()
            }
        }
        .navigationTitle("Sheet B")
    }
}

struct SheetViewB_Previews: PreviewProvider {
    static var previews: some View {
        SheetViewB()
    }
}
