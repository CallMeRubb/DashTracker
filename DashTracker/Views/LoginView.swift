import SwiftUI

struct LoginView: View {
    @StateObject var loginData = LoginViewmodel()
    @State private var phoneNumber = ""
    @State private var isNextViewActive = false
    
    func sendHttpPost() {
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(Color(hex: "#FFFFFF"))
                    .ignoresSafeArea()
                
                VStack(spacing: 1) {
                    VStack {
                        Image("Logo")
                            .resizable()
                            .frame(width: 213, height: 65)
                            .padding(.top, 80)
                        
                        Text("Continue using phone number")
                            .font(.system(size: 24))
                            .font(.title)
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.top, 50)
                        
                        VStack {
                            HStack {
                                Text("+ \(loginData.getCountryCode()) \(loginData.phNo)")
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 20))
                                    .font(.title)
                                    .fontWeight(.medium)
                                
                                TextField("Enter number", text: $phoneNumber)
                                    .font(.system(size: 22))
                                    .font(.system(size: 20))
                                    .font(.title)
                                    .fontWeight(.medium)
                                    .multilineTextAlignment(.center)
                                    .keyboardType(.numberPad)
                            }
                            .padding(.top, 25)
                        }
                        
                        Button(action: {
                            isNextViewActive = true
                            sendHttpPost()
                        }) {
                            Text("Continue")
                                .foregroundColor(.black)
                                .font(.title)
                                .fontWeight(.medium)
                                .padding(.vertical, 25)
                                .padding(.horizontal, 60)
                                .background(Color(hex: "#FAC04C"))
                                .cornerRadius(20)
                                .padding(.top, 30)
                        }
                        .disabled(phoneNumber.isEmpty)
                        .opacity(phoneNumber.isEmpty ? 0.5 : 1.0)
                    }
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .background(
                NavigationLink(
                    destination: Verification(loginData: loginData),
                    isActive: $isNextViewActive,
                    label: EmptyView.init
                )
            )
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
