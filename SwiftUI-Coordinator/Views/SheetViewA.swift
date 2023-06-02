//
//  SheetViewA.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct SheetViewA: View {
    @EnvironmentObject var coordinator: DefaultCoordinator
    var body: some View {
        List {
            Text("This is Sheet A")
            Button("Present Sheet B") {
                coordinator.present(sheet: .sheetB)
            }
            Button("Dismiss") {
                coordinator.dismiss()
            }
        }
        .navigationTitle("Sheet A")
    }
}

struct SheetViewA_Previews: PreviewProvider {
    static var previews: some View {
        SheetViewA()
    }
}
