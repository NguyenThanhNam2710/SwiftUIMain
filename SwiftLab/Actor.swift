import SwiftUI

var c = 0

func add() async {
    for _ in 0..<1000 {
        c += 1
    }
}

struct Actor {
    /// main
    static func main() async {
        async let task1 = add()
        async let task2 = add()
        await task1
        await task2
        // bat dong bo, c tra ra ket qua sai
        print("total: \(c)")
        print("--Giai phap--")
        async let task3 = add2()
        async let task4 = add2()
        await task3
        await task4
        let counter = await counter.getC()
        print("total: \(counter)")
        
    }
}

//Actor: Là một kiểu tham chiếu (reference type), được thiết kế để xử lý concurrency an toàn trong Swift. Actor bảo vệ dữ liệu bên trong khỏi việc truy cập đồng thời từ nhiều luồng (threads) mà không cần sử dụng khóa (locks) thủ công.
var counter = Counter()
func add2() async {
    for _ in 0..<1000 {
        await counter.add()
    }
}
actor Counter {
    private var _c: Int = 0
    
    func getC() -> Int {
        return _c
    }
    
    func add() {
        _c += 1
    }
}
