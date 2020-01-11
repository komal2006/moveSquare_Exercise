//
//  ViewController.swift
//  moveSquare_Exercise
//
//  Created by komaldeep kaur on 2020-01-08.
//  Copyright © 2020 komaldeep kaur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var square: UIView!
    var timer:Timer?
    var goToTop = false
    var goToBottom = true
//    var goToLeft = false
//    var goToRight = false
    
    let w = UIScreen.main.bounds.width
    let h = UIScreen.main.bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
      
    }
    
    @objc func btnUp() {
        var xPosition = square.frame.origin.x
        var yPosition = square.frame.origin.y
        
        if goToBottom {
            yPosition += 20
        } else if goToTop {
            yPosition -= 20
        }
        
        if yPosition > h {
           // xPosition = xCordinate()
            xPosition = w - 20
            yPosition = h - 70
            goToTop = true
            goToBottom = false
        } else if yPosition < 0 {
            //xPosition = xCordinate()
            xPosition = w - 20
            yPosition +=  70
            goToTop = false
            goToBottom = true
        }
        
//        if goToLeft{
//            xPosition = w - 20
//            yPosition = h - 70
//             goToLeft = true
//            goToRight = false
//        } else {
//            goToLeft = false
//            goToRight = true
//        }

        let width = square.frame.size.width
        let height = square.frame.size.height

        UIView.animate(withDuration: 1.0, animations: {
            self.square.frame = CGRect(x: xPosition, y: yPosition, width: width, height: height)
        })
    }
    
//    func xCordinate() -> CGFloat{
//        let randomInt = Int.random(in: 1..<Int(w - 30))
//        return CGFloat(randomInt)
//    }
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.3,
        target: self,
        selector: #selector(btnUp),
        userInfo: nil,
        repeats: true)
    }
    func stopTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
    }

}

