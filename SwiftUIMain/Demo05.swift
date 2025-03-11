import SwiftUI

struct Demo05: View {
    class Counter: ObservableObject {
        @Published var countFirst: Int = 0 //@Published de su dung binding
        @Published var countSecond: Int = -1
        @Published var countThird: Int = -2
    }
    
    @StateObject var counter = Counter()//@StateObject dung de khai bao binding object trong View. chi dung duoc trong 1 View va cac View con cua no neu truyen du lieu vao
    var body: some View {
        VStack {
            Text("Count: \(counter.countFirst); \(counter.countSecond); \(counter.countThird)")
            HStack {
                Button("+") {
                    counter.countFirst += 1
                }
                .padding(.trailing, 16.0)
                Button("+") {
                    counter.countSecond += 1
                }
                .padding(.trailing, 16.0)
                Button("+") {
                    counter.countThird += 1
                }
            }
            ChildView(counter: counter)//truyen vao counter cho View con
        }.font(.largeTitle)
            .environmentObject(counter) //khai bao object dung trong ca moi truong, den view nao can dung chi can khai bao @EnvironmentObject de trien khai
    }
    
    struct ChildView: View {
        @StateObject var counter = Counter()
        
        var body: some View {
            VStack {
                Text("Child Count: \(counter.countFirst); \(counter.countSecond); \(counter.countThird)")
                HStack {
                    Button("-") {
                        counter.countFirst -= 1
                    }
                    .padding(.trailing, 16.0)
                    Button("-") {
                        counter.countSecond -= 1
                    }
                    .padding(.trailing, 16.0)
                    Button("-") {
                        counter.countThird -= 1
                    }
                }
                GrandChildView()
            }.font(.largeTitle)
        }
    }
    
    struct GrandChildView: View {
        @EnvironmentObject var counter: Counter //@EnvironmentObject de nhan biet la dang khai bao object cuar toan bo moi truong, su dung va cap nhat tai view nay
        
        var body: some View {
            VStack {
                Text("Grand Child Count: \(counter.countFirst); \(counter.countSecond); \(counter.countThird)")
                HStack {
                    Button("x") {
                        counter.countFirst = 0
                    }
                    .padding(.trailing, 16.0)
                    Button("x") {
                        counter.countSecond = -1
                    }
                    .padding(.trailing, 16.0)
                    Button("x") {
                        counter.countThird = -2
                    }
                }
            }.font(.largeTitle)
        }
    }
}

#Preview {
    Demo05()
}
