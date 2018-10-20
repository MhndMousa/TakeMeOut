////
////  CircleView.swift
////  TakeMeOut
////
////  Created by Mhnd on 10/20/18.
////  Copyright © 2018 Mhnd. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class CircleView: UIView {
//    
//    init(_ rect :CGRect){
//        let path = UIBezierPath()
//     
//        
//        let radius: Double = Double(rect.width)/2
//        
//        let center = CGPoint(x: rect.width / 2, y: rect.height/2)
//        path.move(to: CGPoint(x: center.x + CGFloat(radius), y: center.y))
//        
//        for i in stride(from: 0.0, to: 361.0, by: 10){
//            
//            let radians = i * Double.pi / 180
//            
//            let x = Double(center.x) + radius * cos(radians)
//            let y = Double(center.y) + radius * sin(radians)
//            
//            path.addLine(to: CGPoint(x: x, y: y))
//        }
//        
////        path.lineWidth = 5
////        path.stroke()
//
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
