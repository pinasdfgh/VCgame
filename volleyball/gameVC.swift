//
//  gameVC.swift
//  volleyball
//
//  Created by pinasd chen on 2017/7/4.
//  Copyright © 2017年 pinasd chen. All rights reserved.
//

import UIKit
import SpriteKit

class gameVC: UIViewController {
    
    var anim:UIDynamicAnimator?
    
    @IBOutlet weak var gameUIV: gameUIV!
    @IBOutlet weak var vball: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        anim = UIDynamicAnimator(referenceView: view)
        let beh = UIGravityBehavior(items: [vball])
        beh.gravityDirection = CGVector(dx: 0, dy: 1)
        
        let beh2 = UICollisionBehavior(items: [vball])
        beh2.translatesReferenceBoundsIntoBoundary = true
        anim!.addBehavior(beh)
        anim!.addBehavior(beh2)
        
        let moveNodeUp = SKAction.moveBy(x: 0.0,
                                         y: 100.0,
                                         duration: 1.0)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    

}


