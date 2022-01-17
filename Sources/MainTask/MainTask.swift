public struct MainTask {
    let runner: (() -> ())?
    
    @discardableResult
    init(_ callBack: @escaping () -> ()) {
        self.runner = callBack
        self.start()
    }
    
    func start() {
        Task {
            await run()
        }
    }
    
    @MainActor func run() {
        if let runner = runner {
            runner()
        }
    }
}
