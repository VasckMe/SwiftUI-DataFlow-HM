//
//  StarterView.swift
//  SwiftUI DataFlow HM
//
//  Created by Apple Macbook Pro 13 on 14.10.22.
//

import SwiftUI

struct StarterView: View {
    
    @EnvironmentObject var userInfo: UserInfo
    
    @AppStorage("registered") var registered: Bool = false
    
    var body: some View {
        
        Group {
            if registered {
                TimerView()
            } else {
                RegisterView()
            }
        }
    }
}

struct StarterView_Previews: PreviewProvider {
    static var previews: some View {
        StarterView()
            .environmentObject(UserInfo())
    }
}
