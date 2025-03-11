import SwiftUI

struct Demo04: View {
    @State var count: Int = 0
    
    var body: some View {
        // MARK: - 2
        ExtractedView(count: $count)//binding
        Text("Outside cound: \(count)")
            .font(.largeTitle)
            .padding(EdgeInsets(top: 48, leading: 0, bottom: 0, trailing: 0))
    }
    
    struct ExtractedView: View {
        @Binding var count: Int//binding
        var body: some View {
            VStack {
                Text("Inside count: \(count)")
                    .font(.largeTitle)
                Button("+") {
                    self.count += 1
                }.font(.largeTitle)
                    .background(.brown)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                    .shadow(color: .orange, radius: 10, x: 10, y: 10)
                    .buttonStyle(.bordered)
                
                Button("Reset") {
                    self.count = 0
                }.font(.largeTitle)
                    .background(.red)
                    .foregroundStyle(.white)
                    .clipShape(.capsule)
                    .shadow(color: .red.opacity(0.8), radius: 5, x: 10, y: 10)
                    .buttonStyle(.bordered)
            }
        }
    }
}

#Preview {
    Demo04()
}
