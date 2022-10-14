//
//  SwiftUI_DataFlow_HMApp.swift
//  SwiftUI DataFlow HM
//
//  Created by Apple Macbook Pro 13 on 14.10.22.
//

import SwiftUI

@main
struct SwiftUI_DataFlow_HMApp: App {
    
    @StateObject var userInfo = UserInfo()
    
    var body: some Scene {
        WindowGroup {
            StarterView()
                .environmentObject(userInfo)
        }
    }
}
