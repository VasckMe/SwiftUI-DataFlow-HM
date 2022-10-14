//
//  ButtonView.swift
//  SwiftUI DataFlow HM
//
//  Created by Apple Macbook Pro 13 on 14.10.22.
//

import SwiftUI

struct ButtonView: View {
    
    @EnvironmentObject var timer: TimerCounter
    
    var body: some View {
        Button {
            timer.start()
        } label: {
            Text("\(timer.title.rawValue)")
                .font(.largeTitle)
        }
        .foregroundColor(.orange)
        .frame(width: 200, height: 80)
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(Color.white, lineWidth: 3)
        )
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.black)
            ButtonView()
                .environmentObject(TimerCounter())
        }
        .ignoresSafeArea()
    }
}
