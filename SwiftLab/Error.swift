import SwiftUI

enum MyError: Error {
    case err(msg: String)
    
    func isMyError(e: MyError) -> Bool {
        if case .err(let msg) = e {
            return true
        }
        return false
    }
}

func test(s: String) throws -> String {
    if s.isEmpty {
        throw MyError.err(msg: "Error Empty")
    }
    return s.uppercased()
}

struct ErrorDemo {
    /// main
    static func main() async {
        defer {
            print("them vao de lam xu ly cuoi cung, giong voi try catch finally trong ngon ngu khac")
        }
        do {
            let v1 = try test(s: "a")
            print("v1: ", v1)
            let v2 = try test(s: "")
            print("v2: ", v2)
        } catch let err as MyError where err.isMyError(e: err) {
            print("Catch MyError: \(err)")
        } catch {
            print("Catch Error: \(error)")
        }
        let v3 = try! test(s: "c")
        print("v3: ", v3)
    }
}

//defer hay de tren dau ham
//defer đảm bảo rằng khối mã bên trong nó sẽ chạy khi scope hiện tại kết thúc, bất kể có ngoại lệ (error) hay không. Điều này rất hữu ích để dọn dẹp tài nguyên (như đóng file, giải phóng bộ nhớ, hoặc khôi phục trạng thái).
//EX:
//func processFile() throws {
//    let file = "example.txt"
//    print("Mở file: \(file)")
//
//    defer {
//        print("Đóng file: \(file)") // Luôn được gọi, dù có lỗi hay không
//    }
//
//    if file == "example.txt" {
//        throw NSError(domain: "Error", code: -1, userInfo: nil)
//    }
//}
//
//do {
//    try processFile()
//} catch {
//    print("Lỗi: \(error)")
//}
//RETURN:
//Mở file: example.txt
//Lỗi: Error Domain=Error Code=-1 "(null)"
//Đóng file: example.txt
