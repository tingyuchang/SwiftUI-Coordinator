//
//  ContentView.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

struct ContentView<C: Coordinatorable>: View {
    // TODO: Should use Coordinatorable for injection 
    @StateObject var coordinator: C
    
    var body: some View {
        NavigationStack(path: $coordinator.path, root: {
           
            coordinator.build(.pageA, nil, nil)
                .navigationDestination(for: Page.self) { page in
                    coordinator.build(page, nil, nil)
                }
                .sheet(item: $coordinator.sheet) { sheet in
                    coordinator.build(nil, sheet, nil)
                }
                .fullScreenCover(item: $coordinator.fullScreenCover) { fullScreenCover in
                    coordinator.build(nil, nil, fullScreenCover)
                }
        })
        .environmentObject(coordinator)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView<DefaultCoordinator>(coordinator: DefaultCoordinator())
    }
}
