import SwiftUI

struct Demo02: View {
    var body: some View {
        //MARK: - 1
        //        ZStack(alignment: .top) {
        //            Rectangle().fill(.yellow)
        //                .frame(width: .infinity, height: .infinity)
        //            Rectangle().fill(.blue)
        //                .stroke(.orange, lineWidth: 10)//bo ben ngoai
        //                .strokeBorder(.pink, lineWidth: 10)//bo ben trong
        //                .frame(width: 350, height: 500)
        //        }
        
        //MARK: - 2
        //        VStack(
        //            alignment: .trailing,
        //            spacing: 0
        //        ) {
        //            Spacer()
        //            Rectangle().fill(.green)
        //                .frame(width: 100, height: 100)
        //                .frame(maxWidth: .infinity)
        //            Spacer()
        //            Rectangle().fill(.red)
        //                .frame(width: 100, height: 100)
        //            Spacer()
        //            Rectangle().fill(.yellow)
        //                .frame(width: 100, height: 100)
        //            Spacer()
        //        }
        //
        //        HStack(
        //            alignment: .top,
        //            spacing: 0
        //        ) {
        //            Spacer()
        //            Rectangle().fill(.green)
        //                .frame(width: 100, height: 100)
        //                .frame(maxHeight: .infinity)
        //            Spacer()
        //            Rectangle().fill(.red)
        //                .frame(width: 100, height: 100)
        //            Spacer()
        //            Rectangle().fill(.yellow)
        //                .frame(width: 100, height: 100)
        //            Spacer()
        //        }
        
        //MARK: - 3
//        HStack(
//            spacing: 0
//        ) {
//            Rectangle().fill(.red)
//            Rectangle().fill(.green)
////                .layoutPriority(1)
//        }
//        HStack(
//            spacing: 0
//        ) {
//            Text("a1231313123123b a1231313123123b a1231313123123b ")
//            Text("c1231313123123d c1231313123123d c1231313123123d ")
//        }
//        
//        GeometryReader { geo in
//            HStack(
//                spacing: 0
//            ) {
//                Rectangle().fill(.red)
//                    .frame(width: geo.size.width / 3)
//                Rectangle().fill(.green)
//                    .frame(width: geo.size.width * 0.65)
//            }
//        }
        
        
        //MARK: - 4
        ScrollView {
            VStack(
                alignment: .leading,
                spacing: 10
            ) {
                ScrollView(
                    .horizontal
                ) {
                    HStack(
                        alignment: .firstTextBaseline,
                        spacing: 10
                    ) {
                        ForEach(
                            1...100,
                            id: \.self
                        ) {
                            Text("Item \($0)")
                        }
                    }
                }
                
                ForEach(
                    1...100,
                    id: \.self
                ) {
                    Text("Item \($0)")
                }
            }
        }
    }
}

#Preview {
    Demo02()
}
