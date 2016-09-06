//
//  BackOffice.swift
//  aomaiBackOffice
//
//  Created by li qiang on 8/6/2559 BE.
//  Copyright © 2559 aomai. All rights reserved.
//

import UIKit
import Firebase
import SnapKit

class BackOffice: UIViewController, UITextFieldDelegate {
    //DB ref
    let ofbRef = FIRDatabase.database().reference().child("OfficeBuildings")
    let ofbTextField = UITextField()
    let saveOFBButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Return", style: .Plain, target: self, action: #selector(dismissVC))
        self.view.backgroundColor = UIColor.whiteColor()
        setUpOFBTextfield()
        setUpSaveOFBButton()
        
    }
    func dismissVC() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func setUpOFBTextfield() {
        self.ofbTextField.delegate = self
        self.ofbTextField.returnKeyType = .Done
        self.ofbTextField.placeholder = "Input Office Building at Here"
        self.view.addSubview(ofbTextField)
        self.ofbTextField.snp_remakeConstraints { (make) in
            make.top.equalTo(self.view).offset(80)
            make.left.equalTo(self.view).offset(24)
            make.right.equalTo(self.view).offset(-24)
            make.height.equalTo(36)
        }
    }
    func setUpSaveOFBButton() {
        self.view.addSubview(saveOFBButton)
        self.saveOFBButton.snp_remakeConstraints { (make) in
            make.top.equalTo(self.ofbTextField.snp_bottom).offset(10)
            make.left.equalTo(self.view).offset(24)
            make.right.equalTo(self.view).offset(-24)
            make.height.equalTo(36)
        }
        self.saveOFBButton.setTitle("Save to Database", forState: .Normal)
        self.saveOFBButton.addTarget(self, action: #selector(saveToFirebaseDB), forControlEvents: .TouchUpInside)
        self.saveOFBButton.backgroundColor = UIColor.cyanColor()
        self.saveOFBButton.layer.cornerRadius = 6
        
    }
    
    func saveToFirebaseDB() {
        self.ofbTextField.resignFirstResponder()
        guard let ofb = self.ofbTextField.text else {return}
        //let val = ["building": ofb]
        let ofbID = self.ofbRef.childByAutoId().key
        let newOfb = self.ofbRef.child(ofbID)
        newOfb.setValue(ofb, withCompletionBlock: {(error, ref) in
            if error != nil {
                let errAlert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .Alert)
                let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (_) in })
                errAlert.addAction(okAction)
                self.presentViewController(errAlert, animated: true, completion: nil)
                return
            }
            let doneAlert = UIAlertController(title: "Success", message: nil, preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (_) in })
            doneAlert.addAction(okAction)
            self.presentViewController(doneAlert, animated: true, completion: nil)
        })
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        self.ofbTextField.resignFirstResponder()
        return true
    }

}
