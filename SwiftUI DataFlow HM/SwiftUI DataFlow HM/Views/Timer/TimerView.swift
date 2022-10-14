//
//  TimerView.swift
//  SwiftUI DataFlow HM
//
//  Created by Apple Macbook Pro 13 on 14.10.22.
//

import SwiftUI

struct TimerView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    @StateObject var timer = TimerCounter(counter: 5)
    
    @AppStorage("registered") var registered: Bool = false

    var body: some View {
        ZStack {
            Color(.black)
            VStack(spacing: 100) {
                Text("Hello, \(userInfo.name)")
                    .foregroundColor(.white)
                    .font(.title)
                Text("\(timer.counter)")
                    .foregroundColor(.white)
                    .font(.system(size: 100, weight: .bold))
                ButtonView()
                    .environmentObject(timer)
                Button {
                    registered.toggle()
                } label: {
                    Text("Logout")
                        .font(.largeTitle)
                }
                .foregroundColor(.red)
                .frame(width: 200, height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .stroke(Color.white, lineWidth: 3)
                )
                
            }
        }
        .ignoresSafeArea()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
            .environmentObject(UserInfo())
    }
}
