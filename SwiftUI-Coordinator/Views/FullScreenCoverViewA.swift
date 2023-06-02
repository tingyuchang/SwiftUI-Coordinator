//
//  FullScreenCoverViewA.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct FullScreenCoverViewA: View {
    @EnvironmentObject var coordinator: DefaultCoordinator
    var body: some View {
        List {
            Text("This is FullScreenCoverView A")
            Button("Present FullScreenCoverView B") {
                coordinator.present(fullScreenCover: .fullScreenCoverB)
            }
            Button("Dismiss") {
                coordinator.dismiss()
            }
        }
        .navigationTitle("FullScreenCoverView A")
    }
}

struct FullScreenCoverViewA_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCoverViewA()
    }
}
