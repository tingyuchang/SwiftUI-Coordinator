# SwiftUI Coordinator

NavigationView in SwiftUI has many problems, so many people still use NavigationController to manage views

but in SwiftUI, I think we should give up view controller.

This repository is trying to use new NavigationStack to implement Flow Coordinator 

let check it out!

The protocol is quite simple:

in 3 different Navigation behaviors, we use the `path`, `sheet` and `fullScreenCover` to manage

and also define `push`, `pop` `present` API to use.

```Swift
protocol Coordinatorable: ObservableObject {
    // for page view, use NavigationPath to manage
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
```

in the ContentView, we set coordinatorable class to be a @StateObject, and let NavigationStack's path bind with coordinatorable.path

and show any view with `navigationDestination`, `sheet` or `fullScreenCover`

coordinatorable.path can hold any Hashable type, and we tell NavigationStack if the type is `Page` then build page view to present(push)

sheet & fullScreenCover just binded with coordinatorable, if they are changed then present it.

```Swift

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
```








