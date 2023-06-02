//
//  SwiftUI_CoordinatorApp.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import SwiftUI

@main
struct SwiftUI_CoordinatorApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView<DefaultCoordinator>(coordinator: DefaultCoordinator())
        }
    }
}
