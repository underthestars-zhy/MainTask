public struct MainTask {
    let runner: (() async -> ())?
    
    @discardableResult
    public init(_ callBack: @escaping () async -> ()) {
        self.runner = callBack
        self.start()
    }
    
    func start() {
        Task {
            await run()
        }
    }
    
    @MainActor func run() async {
        if let runner = runner {
            await runner()
        }
    }
}
