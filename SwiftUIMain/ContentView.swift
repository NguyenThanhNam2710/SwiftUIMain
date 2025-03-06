import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Rectangle().fill(.yellow)
                .frame(width: .infinity, height: .infinity)
            Rectangle().fill(.blue)
                .stroke(.orange, lineWidth: 10)
                .frame(width: 350, height: 500)
        }
    }
}

#Preview {
    ContentView()
}
