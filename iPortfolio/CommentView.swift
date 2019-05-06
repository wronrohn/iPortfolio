//
//  commentView.swift
//  iPortfolio
//
//  Created by Rohnit Shetty on 5/6/19.
//  Copyright © 2019 Rohnit Shetty. All rights reserved.
//
import UIKit
import Foundation



class CommentView: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        
        rightSwipe.direction = .right
        view.addGestureRecognizer(rightSwipe)
    }
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer)
    {
        
        
        if (sender.direction == .right)
        {
            print("Swipe Right")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "formMaker") as! formMaker
            self.present(nextViewController, animated:true, completion:nil)
            
            // show the view from the left side
        }
    }

    
}
