// ContentView.swift

import SwiftUI

struct VideoPlayerViewControllerWrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> ViewController {
        return ViewController()
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {

    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ZStack {
                    VideoPlayerViewControllerWrapper()
                        .edgesIgnoringSafeArea(.all)

                    VStack {
                        NavigationLink(destination: LoginView()) {
                            Text("Get started")
                                .foregroundColor(Color(hex: "#FFFFFF"))
                                .font(.system(size: 20))
                                .font(.title)
                                .fontDesign(.rounded)
                                .fontWeight(.medium)
                                .frame(width: 300, height: 60)
                                .background(Color(hex: "#FAC04C"))
                                .cornerRadius(20)
                        }
                        .position(x: geometry.size.width / 2, y: geometry.size.height - 60)
                    }
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}




// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// MARK: - HEX COLOR
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#"))
        let rgbValue = UInt32(hex, radix: 16)
        let r = Double((rgbValue! & 0xFF0000) >> 16) / 255
        let g = Double((rgbValue! & 0x00FF00) >> 8) / 255
        let b = Double(rgbValue! & 0x0000FF) / 255
        self.init(red: r, green: g, blue: b)
    }
}
