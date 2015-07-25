//
//  MyKeyBoard.swift
//  testKeyBoard
//
//  Created by wealon on 15/7/24.
//  Copyright (c) 2015年 com.8ni. All rights reserved.
//

import UIKit

protocol MyKeyBoardDelegate : NSObjectProtocol{
    
    // 代理方法 传出去输入的内容
    func keyBoardSendClicked(#contnet: String?)
    
}

class MyKeyBoard: UIView {
    
    
    // 键盘输入文字的地方
    @IBOutlet weak var keyBoardLabel: UITextField!
    
    // 键盘发送按钮
    @IBOutlet weak var keyBoardSendBtn: UIButton!
    
    
    weak var delegate: MyKeyBoardDelegate?
    
    // 加载的时候设置
    override func awakeFromNib() {
        super.awakeFromNib()
        keyBoardSendBtn.addTarget(self, action: "send", forControlEvents: UIControlEvents.TouchUpInside)
        
    }
    // 点击发送的时候的调用方法
    func send() {
        let content = keyBoardLabel.text
        self.delegate?.keyBoardSendClicked(contnet: content)
        keyBoardLabel.text = ""
    }
    
    // 成为第一响应者
    func keyBoardBecomeFirstResponder() {
        if !keyBoardLabel.isFirstResponder() {
            keyBoardLabel.becomeFirstResponder()
        }
    }
    
}
