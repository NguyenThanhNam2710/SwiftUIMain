import SwiftUI

struct Demo01: View {
    var body: some View {
        Rectangle().fill(.red)
            .frame(width: .infinity, height: .infinity)
            .ignoresSafeArea()
            .overlay {
                RoundedRectangle(cornerSize: CGSize(width: 20, height: 20), style: .circular).fill(.green)
                    .frame(width: 350, height: 350)
                    .shadow(color: .yellow, radius: 20, x: -10, y: -10)
                    .overlay {
                        ExtractedView()
                    }
            }
    }
}

#Preview {
    ContentView()
}

struct ExtractedView: View {
    var body: some View {
        Circle().fill(.blue)
        //.border(.black, width: 5)
            .stroke(Color.red, lineWidth: 4)
            .frame(width: 300, height: 300)
            .overlay {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    path.addArc(center: CGPoint(x: 50, y: 150), radius: 10, startAngle: .zero, endAngle: .zero, clockwise: true)
                    path.addLine(to: CGPoint(x: 200, y: 200))
                }.stroke(Color.gray, lineWidth: 5)
            }
    }
}
