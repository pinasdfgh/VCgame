//
//  gameUIV.swift
//  volleyball
//
//  Created by pinasd chen on 2017/7/4.
//  Copyright © 2017年 pinasd chen. All rights reserved.
//

import UIKit
import SpriteKit

class gameUIV: UIView {
    
    //-------system var-----------
    private var isInit:Bool = false
    private var context:CGContext?
    private var viewW:CGFloat?
    private var viewH:CGFloat?
    private var pviewW:CGFloat?
    private var pviewH:CGFloat?
    //-------palyer var-----------
    private var p1MassPoint:CGPoint?
    private var p1movex:CGFloat?
    private var p1movey:CGFloat?
    private var p1moveendx:CGFloat?
    private var p1moveendy:CGFloat?
    private var p1Velocity:CGFloat = 5
    
    private var p2MassPoint:CGPoint?
    private var p2movex:CGFloat?
    private var p2movey:CGFloat?
    private var p2moveendx:CGFloat?
    private var p2moveendy:CGFloat?
    private var p2Velocity:CGFloat = 5
    
    private var vBall:UIImageView?
    
    private func initDraw(_ rect:CGRect){
        
        isInit = true
        context = UIGraphicsGetCurrentContext()
        
        viewW = rect.width
        viewH = rect.height
        
        pviewW = viewW!*0.06
        pviewH = viewH!*0.25
        print("init")
        
        
        //-----人物init-------
        p1MassPoint = CGPoint(x: viewW!/4, y: viewH!*0.2)
        p1moveendx = viewW!/4
        p1moveendy = viewH!*0.2
        
        
        p2MassPoint = CGPoint(x: viewW!/4*3, y: viewH!*0.2)
        p2moveendx = viewW!/4*3
        p2moveendy = viewH!*0.2
        
        if #available(iOS 10.0, *) {
            Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true, block: {(timer) in
                self.drawimg()
            })
        } else {
            Timer.scheduledTimer(timeInterval: 0.02,
                                 target: self,
                                 selector: #selector(drawimg),
                                 userInfo: nil,
                                 repeats: true)
        }
        
        
        
    
    }
    @objc private func drawimg(){
        p1move()
        setNeedsDisplay()
    }
    /*
    p1MassPoint -->質心位置
    p1moveendx  -->目標位置
    p1moveendy  -->目標位置
    p1movex     -->移動速度
    p1movey     -->移動速度
    */
    private func p1move(){
        if p1moveendx! > p1MassPoint!.x{
            p1movex = p1Velocity
        }else{
            p1movex = -p1Velocity
        }
        
        let a = abs(Int32(p1moveendx! - p1MassPoint!.x))
        let b = abs(Int32( p1movex!))
        print(a)
        print(b)
        if a > b{
            p1MassPoint!.x += p1movex!
        }
    }
    
    override func draw(_ rect: CGRect) {
        
        if !isInit{initDraw(rect)}
        context?.concatenate(.init(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: rect.height))
        
        
//-----------------draw人物----------------------------
        //------------p1point--------------------------
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)

        context?.addArc(center: p1MassPoint!, radius: 2, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        
        context?.drawPath(using: CGPathDrawingMode.stroke)
        
         //------------p1view--------------------------
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)
        let p1POS = CGPoint(x:p1MassPoint!.x-pviewW!/2,y:p1MassPoint!.y-pviewH!/2)
        let p1size = CGSize(width: pviewW!, height: pviewH!)
        
        let rectCG1 = CGRect(origin: p1POS, size: p1size)
        
        context?.addRect(rectCG1)
        
        context?.drawPath(using: CGPathDrawingMode.stroke)
        
        
//-----------------draw人物2----------------------------
        //-------------p2------------------------------
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)

        context?.addArc(center: p2MassPoint!, radius: 2, startAngle: 0, endAngle: CGFloat(2*Double.pi), clockwise: true)
        
        context?.drawPath(using: CGPathDrawingMode.stroke)
        
        //------------p2view--------------------------
        context?.setLineWidth(2)
        context?.setStrokeColor(red: 1, green: 0, blue: 0, alpha: 1)
        let p2POS = CGPoint(x:p2MassPoint!.x-pviewW!/2,y:p2MassPoint!.y-pviewH!/2)
        let p2size = CGSize(width: pviewW!, height: pviewH!)
        
        let rectCG2 = CGRect(origin: p2POS, size: p2size)
        
        context?.addRect(rectCG2)
        
        context?.drawPath(using: CGPathDrawingMode.stroke)
        
    }
    
    //-------------------紀錄點------------------------
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self)
        getpoint(point!)
        
    }
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self)
        getpoint(point!)
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        let point = touch?.location(in: self)
        getpoint(point!)
    }
    
    private func getpoint(_ point:CGPoint){
        if point.x > viewW!/2 - pviewW!/2{
            p1moveendx = viewW!/2 - pviewW!/2
        }else if point.x < pviewW!/2{
            p1moveendx = pviewW!/2
        }else{
            p1moveendx = point.x
        }
        
    }

}
