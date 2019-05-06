//
//  ViewController.swift
//  iPortfolio
//
//  Created by Rohnit Shetty on 2/23/19.
//  Copyright © 2019 Rohnit Shetty. All rights reserved.
//

import UIKit
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var seg: UISegmentedControl!
    @IBAction func seg(_ sender: Any) {
        setButtonName(value: seg.selectedSegmentIndex)
    }
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    @IBOutlet weak var btn: UIButton!
    @IBAction func btn(_ sender: Any) {
        if(seg.selectedSegmentIndex == 0){
            login()
            
        }else if seg.selectedSegmentIndex == 1{
            signup()
            
        }
            }
    
    func setButtonName(value: Int){
        if value == 0{
            btn.setTitle("Login", for: .normal)
        }
        else if value == 1{
            btn.setTitle("Sign Up", for: .normal)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    func login(){
        if self.email.text == "" || self.pass.text == "" {
            self.messageLabel.text = "Please fill all the fields"
        }
        else{
            Auth.auth().signIn(withEmail: self.email.text!, password: self.pass.text!){
                (user, error) in
                if error == nil{
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "introChoice") as! introChoice
                    self.present(nextViewController, animated:true, completion:nil)
                    print("##################You have loged in###################")
                }
                else{
                    self.messageLabel.text = "ERROR: Improper email or password"
                    
                }
            }
        }
    }
    
    func signup(){
        if email.text == "" || pass.text == "" {
            
            self.messageLabel.text = "ERROR: Please fill all the fields"
        }
        else{
            Auth.auth().createUser(withEmail: email.text!, password: pass.text!){
                (user, error) in
                
                if error == nil{
                    self.messageLabel.text = "Signed Up. Proceed to login"
                    
                } else{
                    self.messageLabel.text = "Something went wrong.Probably wrong email"
                }
            }
        }
        
        
    }

}

