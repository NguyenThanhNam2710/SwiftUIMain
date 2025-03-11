import SwiftUI

struct Demo03: View {
    @State var isPressed: Bool = false
    
    var body: some View {
        // MARK: - 1
        //        Rectangle().fill(AppColors.primary)
        //            .frame(width: 300, height: 50)
        //        Text("adahjsdgadgajdadhahdaghdajgdagsdjagdjgadgajdhgajdahjdgajdhgajsdgajdgajdgajdgajhsdgajhdgajgdajgdajgsdajgdajgdajgdgajsdajhs")
        //            .lineLimit(2)
        //            .truncationMode(.middle)
        //            .multilineTextAlignment(.trailing)
        ////            .fontWeight(.semibold)
        //            .bold()
        //            .italic()
        //            .foregroundStyle(.blue)
        //            .background(.yellow)
        //            .opacity(0.5)
        //            .font(.title)
        //            .padding(EdgeInsets(top: 10, leading: 20, bottom: 30, trailing: 40))
        //        Text("Default font")
        //            .font(.custom("", size: 20))
        //        Text("Custom font")
        //            .font(.custom("Playfair9pt-BoldItalic", size: 20))
        //        Spacer()
        
        // MARK: - 2
        Button(role: .destructive) {
            print("destructive")
        } label: {
            Circle().fill(.red)
                .frame(width: 40, height: 40)
        }

        
        Button("Button") {
            self.isPressed.toggle()
        }.font(.largeTitle)
            .background(.brown)
            .foregroundStyle(.white)
            .clipShape(.capsule)
            .shadow(color: .orange, radius: 10, x: 10, y: 10)
            .buttonStyle(.bordered)
//            .scaleEffect(1.5, anchor: .topLeading)
            .scaleEffect(isPressed ? 1.5 : 1)
            .animation(.easeIn, value: isPressed)
    }
}

#Preview {
    Demo03()
}
