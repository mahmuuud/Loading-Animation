//
//  ViewController.swift
//  LoadingAnimationDemo
//
//  Created by mahmoud mohamed on 5/14/19.
//  Copyright © 2019 mahmoud mohamed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var view5: UIView!
    @IBOutlet weak var view4: UIView!
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    var count:Int = 0


    override func viewDidLoad() {
      
        super.viewDidLoad()
        mainView.layer.cornerRadius = 7
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animate()
    }
    
     func animate() {
        count += 1
        if count == 5 {
            count = 1
        }
        
        let viewsInTurn = getViewsInTurn(count: count)
        let rightMostView:UIView = viewsInTurn["rightMost"]!
        let leftMostView:UIView = viewsInTurn["leftMost"]!
        let newRightMostView:UIView = viewsInTurn["newRightMost"]!
        let newLeftMostView:UIView = viewsInTurn["newLeftMost"]!
        
        
        UIView.animate(withDuration: 0.25, delay: 0, options: [], animations: {
            UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
                rightMostView.center.y -= 22
                leftMostView.center.y += 22
                self.view.layoutIfNeeded()
                
            }) { (didFinish) in
                UIView.animate(withDuration: 0.25, delay: 0, options: [], animations: {
                    rightMostView.center.x -= 22
                    leftMostView.center.x += 22
                    newRightMostView.center.x += 22
                    newLeftMostView.center.x -= 22
                    self.view.layoutIfNeeded()
                }){
                    (finished) in
                    if finished{
                        self.animate()
                    }
                }
            }
        },completion: nil)
    }
    
    func getViewsInTurn(count:Int) -> [String:UIView] {
        var viewsInTurn:[String:UIView] = [:]
        switch count {
        case 1:
            viewsInTurn["rightMost"] = view4
            viewsInTurn["leftMost"] = view5
            viewsInTurn["newRightMost"] = view1
            viewsInTurn["newLeftMost"] = view2
        case 2:
            viewsInTurn["rightMost"] = view1
            viewsInTurn["leftMost"] = view2
            viewsInTurn["newRightMost"] = view5
            viewsInTurn["newLeftMost"] = view4
        case 3:
            viewsInTurn["rightMost"] = view5
            viewsInTurn["leftMost"] = view4
            viewsInTurn["newRightMost"] = view2
            viewsInTurn["newLeftMost"] = view1
        case 4:
            viewsInTurn["rightMost"] = view2
            viewsInTurn["leftMost"] = view1
            viewsInTurn["newRightMost"] = view4
            viewsInTurn["newLeftMost"] = view5
        case 5:
            viewsInTurn["rightMost"] = view4
            viewsInTurn["leftMost"] = view5
            viewsInTurn["newRightMost"] = view1
            viewsInTurn["newLeftMost"] = view2
        default:
            ()
        }
        return viewsInTurn
    }
    
    

}
