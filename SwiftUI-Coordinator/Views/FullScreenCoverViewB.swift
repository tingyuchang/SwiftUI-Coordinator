//
//  FullScreenCoverViewB.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct FullScreenCoverViewB: View {
    @EnvironmentObject var coordinator: DefaultCoordinator
    var body: some View {
        List {
            Text("This is FullScreenCoverView B")
            Button("Present FullScreenCoverView A") {
                coordinator.present(fullScreenCover: .fullScreenCoverA)
            }
            Button("Dismiss") {
                coordinator.dismiss()
            }
        }
        .navigationTitle("FullScreenCoverView B")
    }
}

struct FullScreenCoverViewB_Previews: PreviewProvider {
    static var previews: some View {
        FullScreenCoverViewB()
    }
}
