//
//  SheetViewC.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct SheetViewC: View {
    @EnvironmentObject var coordinator: DefaultCoordinator
    var body: some View {
        List {
            Text("This is Sheet C")
            Button("Present Sheet A") {
                coordinator.present(sheet: .sheetA)
            }
            Button("Present Sheet B") {
                coordinator.present(sheet: .sheetB)
            }
            Button("Dismiss") {
                coordinator.dismiss()
            }
        }
        .navigationTitle("Sheet C")
    }
}

struct SheetViewC_Previews: PreviewProvider {
    static var previews: some View {
        SheetViewC()
    }
}
