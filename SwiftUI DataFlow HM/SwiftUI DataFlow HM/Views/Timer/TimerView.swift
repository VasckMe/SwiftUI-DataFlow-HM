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
    
    var body: some View {
        ZStack {
            Color(.black)
            VStack(spacing: 100) {
                Text("Hello, \(userInfo.name)")
                    .foregroundColor(.white)
                    .font(.title)
                Text("\(timer.counter)")
                    .foregroundColor(.white)
                    .font(.system(size: 50, weight: .bold))
                ButtonView()
                    .environmentObject(timer)
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
