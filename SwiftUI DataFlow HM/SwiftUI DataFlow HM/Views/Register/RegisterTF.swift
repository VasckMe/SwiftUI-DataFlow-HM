//
//  RegisterTF.swift
//  SwiftUI DataFlow HM
//
//  Created by Apple Macbook Pro 13 on 14.10.22.
//

import SwiftUI

struct RegisterTF: View {
    
    @Binding var name: String
    @Binding var showAlert: Bool
    
    var body: some View {
        ZStack {
            if name.count == 0 {
                Text("Enter your name")
                    .foregroundColor(.orange.opacity(0.4))
            }
            TextField("", text: $name)
            .frame(width: 300, height: 60)
            .multilineTextAlignment(.center)
            .overlay(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .stroke(name.count <= 5 ? Color.red : Color.green, lineWidth: 3)
            )
            .foregroundColor(.white)
            .accentColor(.orange)
            .alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Wrong name!"),
                    message: Text("Name should have more than 5 symbols")
                )
            }
        }
    }
}

//struct RegisterTF_Previews: PreviewProvider {
//    static var previews: some View {
//        RegisterTF(name: "amogus", showAlert: false)
//    }
//}
