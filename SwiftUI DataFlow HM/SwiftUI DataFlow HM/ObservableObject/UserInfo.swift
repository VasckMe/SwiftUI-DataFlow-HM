//
//  UserInfo.swift
//  SwiftUI DataFlow HM
//
//  Created by Apple Macbook Pro 13 on 14.10.22.
//

import Combine

final class UserInfo: ObservableObject {
    @Published var isLogged = false
    var name = ""
}
