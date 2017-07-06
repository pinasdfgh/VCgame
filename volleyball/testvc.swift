//
//  testvc.swift
//  volleyball
//
//  Created by pinasd chen on 2017/7/6.
//  Copyright © 2017年 pinasd chen. All rights reserved.
//

import UIKit
import SpriteKit

class testvc: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view = SKView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var skView: SKView {
        return view as! SKView
    }
    let scene = SKScene(size: CGSize(width: 1024, height: 768))
    override func viewWillAppear(_ animated: Bool) {
        skView.presentScene(scene)
        let label = SKLabelNode(text: "SpriteKit")
        label.position = CGPoint(x: scene.size.width / 2,
                                 y: scene.size.height / 2)
        
        scene.addChild(label)
    }
   

}
