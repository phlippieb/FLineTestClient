import FLineCore
import ReSwift

let core = FLineCore.StoreFactory().createStore()

// Main loop

var didQuit = false
let debug = true

class Main {
     public func getOptionsMessage(for state: FLineCore.FirelineState) -> String {
        return "Enter q to quit."
    }

    func getAction(for input: String) -> Action? {
        if input == "q" {
            return MainMenuAction.quit
        }

        return nil
    }
}

let main = Main()

while !didQuit {
    let state = core.state!
    if debug {
        print("State: \(state)")
    }

    print(main.getOptionsMessage(for: state))
    
    print(">_ ", terminator: "")
    guard let input = readLine() else {
        print("Something went wrong.")
        break
    }

    if let action = main.getAction(for: input) {
        if debug {
            print("Action: \(action)")
        }
        core.dispatch(action)
        didQuit = core.state.didQuit

    } else {
        print("Not recognized.")
    }
}

