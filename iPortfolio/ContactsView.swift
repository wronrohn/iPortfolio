//
//  ContactsView.swift
//  iPortfolio
//
//  Created by Rohnit Shetty on 5/6/19.
//  Copyright © 2019 Rohnit Shetty. All rights reserved.
//

import Foundation
import UIKit
import ContactsUI

class ContactsView : UIViewController, CNContactPickerDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cnPicker = CNContactPickerViewController()
        cnPicker.delegate = self
        self.present(cnPicker, animated: true, completion: nil)
        
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
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "introChoice") as! introChoice
            self.present(nextViewController, animated:true, completion:nil)
            
            // show the view from the left side
        }
    }
    
    func contactPicker(_ picker: CNContactPickerViewController, didSelect contacts: [CNContact]) {
        contacts.forEach { contact in
            for number in contact.phoneNumbers {
                let phoneNumber = number.value
                print("number is = \(phoneNumber)")
            }
        }
    }
    func contactPickerDidCancel(_ picker: CNContactPickerViewController) {
        print("Cancel Contact Picker")
    }

    
}
