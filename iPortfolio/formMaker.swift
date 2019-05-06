

import Foundation
//
//  ViewController.swift
//  iPortfolio
//
//  Created by Rohnit Shetty on 2/23/19.
//  Copyright © 2019 Rohnit Shetty. All rights reserved.
//

import UIKit

import Eureka

class formMaker: FormViewController{
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        createForm()
        print("Name is " + name)
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        
        leftSwipe.direction = .left
        rightSwipe.direction = .right
        
        view.addGestureRecognizer(leftSwipe)
        view.addGestureRecognizer(rightSwipe)
        
        
    }
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer)
    {
        if (sender.direction == .left)
        {
            print("Swipe Left")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "commentView") as! CommentView
            self.present(nextViewController, animated:true, completion:nil)
            
            // show the view from the right side
        }
        
        if (sender.direction == .right)
        {
            print("Swipe Right")
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "introChoice") as! introChoice
            self.present(nextViewController, animated:true, completion:nil)
            
            // show the view from the left side
        }
    }
    
    
    var name: String = ""
    var phone: String = ""
    var email: String = ""
    var linkedIn: URL? = nil
    var bio: String = ""
    var schoolName: String = ""
    var schoolAddress: String = ""
    var course: String = ""
    var gradDate: Date? = nil
    var GPA: Double = 0
    var Skills: Array<String> = []
    var project: String = ""
    
    let defaults = UserDefaults.standard
    
    
    func createForm(){
        form +++ Section("Basic Info")
            <<< NameRow(){ row in
                row.title = "Name"
                row.placeholder = "Enter your name"
                row.value = self.defaults.string(forKey: "Name")
                }.onChange({ (row) in
                    self.name = row.value != nil ? row.value! : "" //updating the value on change
                    self.defaults.set(self.name, forKey:"Name")
                    print("Name is " + self.name)
                })
            <<< PhoneRow(){
                $0.title = "Phone Number"
                $0.placeholder = "Enter your phone number"
                $0.add(rule: RuleMaxLength(maxLength: 10, msg: "Invalid Phone Number"))
                $0.validationOptions = .validatesOnChange
                $0.value = self.defaults.string(forKey: "phone")
                }.onChange({ (row) in
                    self.phone = row.value != nil ? row.value! : "" //updating the value on change
                    self.defaults.set(self.phone, forKey:"phone")
                    print("phone is " + self.phone)
                })
            <<< EmailRow(){
                $0.title = "Email"
                $0.placeholder = "Your primary email address"
                $0.add(rule: RuleRequired())
                $0.add(rule: RuleEmail())
                $0.validationOptions = .validatesOnChange
                $0.value = self.defaults.string(forKey: "email")
                }.onChange({ (row) in
                    self.email = row.value != nil ? row.value! : "" //updating the value on change
                    self.defaults.set(self.email, forKey:"email")
                    print("Email is " + self.email)
                })
            <<< URLRow(){ row in
                row.title = "LinkedIn URL"
                row.placeholder = "Enter your LinkedIn URL"
                row.value = self.defaults.url(forKey: "linkedIn")
                }.onChange({ (row) in
                    self.linkedIn = row.value!  //updating the value on change
                    self.defaults.set(self.linkedIn, forKey:"linkedIn")
                    print(self.linkedIn!)
                })
            
            
            +++ Section("Summary/Bio")
            <<< TextAreaRow(){ row in
                row.title = "Bio"
                row.placeholder = "Enter a short Bio"
                row.value = self.defaults.string(forKey: "bio")
                }.onChange({ (row) in
                    self.bio = row.value != nil ? row.value! : "" //updating the value on change
                    self.defaults.set(self.bio, forKey:"bio")
                    print("Bio is " + self.bio)
                })
            +++ Section("Education")
            <<< NameRow(){
                $0.title = "School Name"
                $0.placeholder = "Enter School Name"
                $0.value = self.defaults.string(forKey: "schoolName")
                }.onChange({ (row) in
                    self.schoolName = row.value != nil ? row.value! : "" //updating the value on change
                    self.defaults.set(self.schoolName, forKey:"schoolName")
                    print("School Name is " + self.schoolName)
                })
            <<< TextRow(){
                $0.title = "Address"
                $0.placeholder = "Enter school location"
                $0.value = self.defaults.string(forKey: "schoolAddress")
                }.onChange({ (row) in
                    self.schoolAddress = row.value != nil ? row.value! : "" //updating the value on change
                    self.defaults.set(self.schoolAddress, forKey:"schoolAddress")
                    print("school address is " + self.schoolAddress)
                })
            <<< TextRow(){
                $0.title = "Course"
                $0.placeholder = "Enter course"
                $0.value = self.defaults.string(forKey: "course")
                }.onChange({ (row) in
                    self.course = row.value != nil ? row.value! : "" //updating the value on change
                    self.defaults.set(self.course, forKey:"course")
                    print("Course is " + self.course)
                })
            <<< DateRow(){
                $0.title = "Graduation Date"
                
                
                
                $0.value = self.defaults.object(forKey: "gradDate") as? Date
                
                }.onChange({ (row) in
                    self.gradDate = row.value
                    self.defaults.set(self.gradDate, forKey:"gradDate")
                    print(self.defaults.object(forKey: "gradDate") as Any)
                })
            <<< DecimalRow(){
                $0.title = "GPA"
                $0.placeholder = "Enter GPA"
                $0.value = self.defaults.double(forKey: "GPA")
                }.onChange({ (row) in
                    self.GPA = row.value != nil ? row.value! : 0
                    self.defaults.set(self.GPA, forKey:"GPA")
                    print(self.GPA)
                })
            
            +++ Section("Projects/ Individual Contributions")
            <<< TextAreaRow(){ row in
                row.title = "Projects"
                row.placeholder = "Write about your projects"
                row.value = self.defaults.string(forKey: "project")
                }.onChange({ (row) in
                    self.project = row.value != nil ? row.value! : "" //updating the value on change
                    self.defaults.set(self.project, forKey:"project")
                    print("Bio is " + self.project)
                })
            
            
            
            
            
            +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
                                   header: "Technical Skills") {
                                    $0.addButtonProvider = { section in
                                        
                                        return ButtonRow(){
                                            $0.title = "Add a New Skill"
                                        }
                                    }
                                    $0.multivaluedRowToInsertAt = { index in
                                        return NameRow() {
                                            $0.placeholder = "Skill Name"
                                            }.onChange({ (row) in
                                                
                                                
                                            })
                                    }
                                    $0 <<< NameRow() {
                                        $0.placeholder = "Skill Name"
                                        }.onChange({ (row) in
                                            
                                        })
            }
            +++ MultivaluedSection(multivaluedOptions: [ .Insert, .Delete],
                                   header: "Experience") {
                                    $0.addButtonProvider = { section in
                                        return ButtonRow(){
                                            $0.title = "Add a New Experience"
                                        }
                                    }
                                    $0.multivaluedRowToInsertAt = { index in
                                        return TextAreaRow() {
                                            $0.placeholder = "Company name \n - Your Tasks"
                                            }.onChange({ (row) in
                                                self.Skills.append(row.value!)
                                                print(self.Skills)
                                            })
                                    }
                                    $0 <<< TextAreaRow() {
                                        $0.placeholder = "Company name \n - Your Tasks"
                                        }.onChange({ (row) in
                                            self.Skills.append(row.value!)
                                            print(self.Skills)
                                        })
        }
        
    }
    
    
}





