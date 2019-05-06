//
//  introChoice.swift
//  iPortfolio
//
//  Created by Rohnit Shetty on 4/13/19.
//  Copyright © 2019 Rohnit Shetty. All rights reserved.
//

import Foundation
import UIKit




class introChoice : UIViewController{
 
    
    @IBAction func toResume(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "formMaker") as! formMaker
        self.present(nextViewController, animated:true, completion:nil)
    }
    @IBAction func toContacts(_ sender: Any) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ContactsView") as! ContactsView
        self.present(nextViewController, animated:true, completion:nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
}
