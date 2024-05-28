//
//  Verification.swift
//  DashTracker
//
//  Created by Anders Bjorland on 13/03/2024.
//

import SwiftUI

struct Verification: View {
    @ObservedObject var loginData: LoginViewmodel
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack {
            VStack {
                
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "arrow.left")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    Spacer()
                    Text("Verify Phone")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                }
                .padding()
                Text("Code sent to \(loginData.phNo)")
                    .foregroundColor(.gray)
                    .padding()
                Spacer(minLength: 0)
                HStack(spacing: 15) {
                    ForEach(0..<6, id: \.self) { index in
                        // displaying code....
                        CodeView(code: getCodeAtIndex(index: index))
                    }
                }
                .padding()
                Spacer(minLength: 0)
            }
            .frame(height: UIScreen.main.bounds.height / 1.8)
            .background(Color.white)
            .cornerRadius(20)
            Spacer()
        }
        .background(Color("bg").ignoresSafeArea(.all, edges: .bottom))
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }

    // getting code at each Index....

    func getCodeAtIndex(index: Int) -> String {
        if loginData.phNo.count > index {
            let current = loginData.phNo.index(loginData.phNo.startIndex, offsetBy: index)
            return String(loginData.phNo[current])
        }
        return ""
    }
}

struct CodeView: View {
    var code: String
    var body: some View {
        VStack(spacing: 10) {
            Text(code)
                .foregroundColor(.black)
                .fontWeight(.bold)
                .font(.title2)
                .frame(height: 45)
            Capsule()
                .fill(Color.gray.opacity(0.5))
                .frame(height: 4)
        }
    }
}


