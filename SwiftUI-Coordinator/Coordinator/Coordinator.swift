//
//  Coordinator.swift
//  SwiftUI-Coordinator
//
//  Created by matt on 2023/6/2.
//

import Foundation
import SwiftUI

// Page, Sheet and FullScreenCover are just easy implementation to list pages
// You can use any alternative type to manage your views

enum Page: String, Identifiable {
    case pageA, pageB, pageC, pageD, pageE
    
    var id: String {
        self.rawValue
    }
}

enum Sheet: String, Identifiable {
    case sheetA, sheetB, sheetC
    
    var id: String {
        self.rawValue
    }
}

enum FullScreenCover: String, Identifiable {
    case fullScreenCoverA, fullScreenCoverB
    
    var id: String {
        self.rawValue
    }
}


// Coordinatorable define the Coodinator's behavior
protocol Coordinatorable: ObservableObject {
    // for page view, use  NavigationPath to manage
    var path: NavigationPath { get set  }
    var sheet: Sheet? { get set }
    var fullScreenCover: FullScreenCover? { get set }
    
    // below functions are basic navigationView actions
    func push(page: Page)
    func present(sheet: Sheet)
    func present(fullScreenCover: FullScreenCover)
    func pop()
    func popToRoot()
    // maybe we can separate sheet / fullScreenCover to different dismiss funtions
    func dismiss()
    
    associatedtype T: View
    @ViewBuilder
    func build(_ page: Page?, _ sheet: Sheet?, _ fullScreenCover: FullScreenCover?) -> T
}


// DefaultCoordinator implements Coordinatorable
// we use this class to be EnvirmentObject & ObserableObject in the our views
class DefaultCoordinator: Coordinatorable {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    @Published var fullScreenCover: FullScreenCover?
    
    func push(page: Page) {
        path.append(page)
    }
    
    func present(sheet: Sheet) {
        self.sheet = sheet
    }
    
    func present(fullScreenCover: FullScreenCover) {
        self.fullScreenCover = fullScreenCover
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func dismiss() {
        self.sheet = nil
        self.fullScreenCover = nil
    }
    
    // build generate View, when NavigationStack diceide to push or present, they will execute these functions to get presenting View.
    // TODO: Maybe can promote to protocol func, but need to re-design Page, Sheet and FullScreenCover to more Abstract type
    @ViewBuilder
    func build(_ page: Page? = nil, _ sheet: Sheet? = nil , _ fullScreenCover: FullScreenCover? = nil) -> some View {
        if let page = page {
            build(page: page)
        } else if let sheet = sheet {
            build(sheet: sheet)
        } else if let fullScreenCover = fullScreenCover {
            build(fullScreenCover: fullScreenCover)
        }
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
        case .pageA:
            PushViewA()
        case .pageB:
            PushViewB()
        case .pageC:
            PushViewC()
        case .pageD:
            PushViewD()
        case .pageE:
            PushViewE()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
        case .sheetA:
            SheetViewA()
        case .sheetB:
            SheetViewB()
        case .sheetC:
            SheetViewC()
        }
    }
    
    @ViewBuilder
    func build(fullScreenCover: FullScreenCover) -> some View {
        switch fullScreenCover {
        case .fullScreenCoverA:
            FullScreenCoverViewA()
        case .fullScreenCoverB:
            FullScreenCoverViewB()
        }
    }
}
