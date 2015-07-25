//
//  ViewController.swift
//  testKeyBoard
//
//  Created by wealon on 15/7/24.
//  Copyright (c) 2015年 com.8ni. All rights reserved.
//  使用按钮来唤起键盘 

import UIKit

class ViewController: UIViewController {
    

    @IBAction func show(sender: AnyObject) {
        println("button clicked .. ")
        println("hideTextField = \(hideTextField)")
        hideTextField.becomeFirstResponder()
        
    }
    
    // 一个隐藏的成为第一响应者有textField
    lazy var hideTextField: UITextField = {
        println("first load UITextField")
        let field = UITextField(frame: CGRectZero)
        field.userInteractionEnabled = true
        field.returnKeyType = UIReturnKeyType.Send
        field.inputAccessoryView = self.myKeyboard
        return field
    }()
    
    
    lazy var myKeyboard: MyKeyBoard = {
        let myKeyBoard = NSBundle.mainBundle().loadNibNamed("MyKeyBoard", owner: nil, options: nil).last as! MyKeyBoard
        myKeyBoard.delegate = self
        return myKeyBoard
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.hideTextField)
        self.hideTextField.inputAccessoryView = self.myKeyboard
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

// 工具条代理
extension ViewController: MyKeyBoardDelegate {
    func keyBoardSendClicked(#contnet: String?) {
        println("输入的内容是:\(contnet)")
    }
}



