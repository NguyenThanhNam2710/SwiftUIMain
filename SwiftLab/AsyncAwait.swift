import SwiftUI

struct AsyncAwait {
    /// main
    static func main() {
        //MARK: - async await
        runTask()
    }
}
//MARK: async await
func delayTask(seconds: UInt64) async {
    print("Start delayTask[\(seconds)] \(Date())")
    try? await Task.sleep(nanoseconds: seconds * 1_000_000_000)
    print("End delayTask[\(seconds)] \(Date())")
}

func twoTask() async {
    await delayTask(seconds: 2)
    await delayTask(seconds: 3)
}

func runTask() {
    print("Start runTask: \(Date())")
    let semaraphone = DispatchSemaphore(value: 0)
    Task {
        print("Start task: \(Date())")
        /**
            - task, task2: chay dong thoi
            - trong task2: khi delayTask2 chay xong thi chay delayTask3
         */
        async let task = delayTask(seconds: 4)
        async let task2 = twoTask()
        await task2
        await task
        print("End task: \(Date())")
        semaraphone.signal()
    }
    semaraphone.wait()
    print("End runTask: \(Date())")
}
