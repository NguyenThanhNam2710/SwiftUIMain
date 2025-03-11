import SwiftUI

struct ContentView: View {
    @State var value: String = ""
    @State var value2: String = ""
    @State var value3: String = "value3"
    
    var body: some View {
        VStack {
            Text("Output: \(value.uppercased())")
            TextField("Hello", text: $value)
                .frame(width: 200, height: 100)
                .padding(20)
                .textFieldStyle(.plain)
                .background(.yellow)
                .foregroundStyle(.blue)
                .cornerRadius(10)
                .opacity(0.5)
                .accentColor(.orange)
                .overlay {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(lineWidth: 5)
                }
                .shadow(color: .green, radius: 10, x: 10, y: 10)
                .keyboardType(.numberPad)
            
            SecureField("PIN Code", text: $value2)
                .frame(width: .infinity, height: 100)
                .padding(20)
                .textFieldStyle(.plain)
                .background(.yellow)
            
            TextEditor(text: $value3)
                .frame(width: .infinity, height: 200)
                .padding(20)
                .textFieldStyle(.plain)
                .background(.yellow)
                .lineSpacing(8)
        }.font(.largeTitle)
    }
}

#Preview {
    ContentView()
}
