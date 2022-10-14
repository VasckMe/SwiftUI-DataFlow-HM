//
//  TimerCounter.swift
//  SwiftUI DataFlow HM
//
//  Created by Apple Macbook Pro 13 on 14.10.22.
//

import Foundation
import Combine

enum TimerStage: String {
    case start = "Start"
    case wait = "Wait..."
    case reset = "Reset"
}

final class TimerCounter: ObservableObject {
    
    var objectWillChange = PassthroughSubject<TimerCounter, Never>()
    
    var counter: Int
    var counterConst = 3
    var title = TimerStage.start
    var timer: Timer?
    
    func start() {
        if counter > 0, timer == nil {
            timer = Timer.scheduledTimer(
                timeInterval: 1.0,
                target: self,
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true
            )
        }
        buttonStateUpdate()
    }
    
    @objc func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
            title = .reset
        }
        objectWillChange.send(self)
    }
    
    func killTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func buttonStateUpdate() {
        if title == .reset {
            counter = counterConst
            title = .start
        } else {
            title = .wait
        }
        objectWillChange.send(self)

    }
    
    init(counter: Int = 3) {
        self.counter = counter
        self.counterConst = counter
    }
}
