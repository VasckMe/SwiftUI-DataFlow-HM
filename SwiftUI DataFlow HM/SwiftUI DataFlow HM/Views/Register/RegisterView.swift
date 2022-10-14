//
//  ContentView.swift
//  SwiftUI DataFlow HM
//
//  Created by Apple Macbook Pro 13 on 14.10.22.
//

import SwiftUI

struct RegisterView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @AppStorage("registered") var registered: Bool = false
    
    @State private var name = ""
    @State private var showAlert = false
    
    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                RegisterTF(name: $name, showAlert: $showAlert)
                Button(action: checkName) {
                    Text("Enter")
                }
                .foregroundColor(.orange)
            }
            .padding()
        }
        .ignoresSafeArea()
    }
    
    private func checkName() {
        if name.count <= 5 {
            showAlert.toggle()
        } else {
            userInfo.isLogged.toggle()
            userInfo.name = name
            registered.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
