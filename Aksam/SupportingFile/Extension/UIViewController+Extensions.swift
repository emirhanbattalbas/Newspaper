//
//  UIViewController+Extensions.swift
//  iddaa
//
//  Created by Fikri Can Cankurtaran on 5.02.2019.
//  Copyright © 2019 Solid-ICT. All rights reserved.
//

import Foundation
import UIKit


extension UIViewController: UITextFieldDelegate {
    
    func createDefaultAlert(title:String,message:String,okCallBack: (()->())? = nil, cancelCallBack: (()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        var action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        if okCallBack != nil{
            action = UIAlertAction(title: "OK", style: .default) { (action) in
                okCallBack?()
            }
        }
        
        if cancelCallBack != nil {
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
                cancelCallBack?()
            }
            alert.addAction(cancelAction)
        }
        
        
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func addToolBar(textField: UITextField) {
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = false
        toolBar.barTintColor = .white //UIColor(red: 211.0/255.0, green: 211.0/255.0, blue: 211.0/255.0, alpha: 1.0)
        toolBar.tintColor = UIColor.black
        //toolBar.tintColor = UIColor(red: 21/255, green: 126/255, blue: 251/255, alpha: 1)
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.done, target: self, action: #selector(UIViewController.donePressed))
        let spacer1: UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let spacer2: UIBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        toolBar.setItems([spacer1, spacer2, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        toolBar.sizeToFit()
        textField.delegate = self
        textField.inputAccessoryView = toolBar
    }
    @objc func donePressed() {
        view.endEditing(true)
    }

    
}

