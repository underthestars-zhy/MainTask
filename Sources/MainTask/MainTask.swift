public struct MainTask {
    @MainActor let runner: (() async -> ())?
    
    @discardableResult
    public init(_ callBack: @escaping @MainActor () async -> ()) {
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
