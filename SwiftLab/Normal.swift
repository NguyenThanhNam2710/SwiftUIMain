import SwiftUI

struct Normal {
    /// main
    static func main() {
        print("Hello", "World", separator: "-")
        print("Hi", terminator: "")
        print("!")
        
        let a = 1
        let b = 0
        let max = if a > b {a} else {b}
        print(max)
        
        let list: [Int] = Array(0...10)
        print("-- stride --")
        //to: khong bao gom gia tri cuoi, -1
        //through: Bao gom gia tri cuoi, 0
        for index in stride(from: list.count - 1, through: 0, by: -1) {
            print(list[index], terminator: index == list.first ? " .\n" :" ,")
        }
        
        print("-- while --")
        var count = 0
        while count < list.count {
            print(list[count], terminator: count == list.last ? " .\n" :" ,")
            count+=1
        }
        
        print("-- repeat while --")
        count = 0
        repeat {
            print(list[count], terminator: count == list.last ? " .\n" :" ,")
            count+=1
        } while count < list.count
        
        print("-- while true--")
        count = 0
        while true {
            print(list[count], terminator: count == list.last ? " .\n" :" ,")
            count+=1
            if count >= list.count {
                break
            }
        }
        
        //MARK: - function
        print("--Generic--")
        let myClass = MyClass<String, Int>(a: "Hello", b: 10)
        print(myClass, myClass.doSomeThing(), separator: " : ")
        
        print(O().doSomeThing())
        print(myFunc(a: 10, b: 11))
        print(sum(a: 10, b: 11))
    }
}

//MARK: Class
class MyClass<A, B>: CustomStringConvertible {
    var a: A
    var b: B
    
    init(a: A, b: B) {
        self.a = a
        self.b = b
    }
    
    //in ra type moi
    var description: String {
        return "MyClass: [\(type(of: a)), \(type(of: b))]"
    }
    
    func doSomeThing() -> A {
        return a
    }
}

protocol P {
    associatedtype T
    func doSomeThing() -> T
}
class O: P {
    typealias T = Int
    
    func doSomeThing() -> Int {
        return 10
    }
}

func myFunc<c>(a: c, b : c) -> String {
    return "\(type(of: a))-\(a), \(type(of: b))-\(b)"
}

func sum<c: Numeric>(a: c, b : c) -> c {
    return a + b
}
