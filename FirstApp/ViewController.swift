//
//  ViewController.swift
//  FirstApp
//
//  Created by PointerFLY on 3/18/16.
//  Copyright © 2016 sunnytech. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var guessNumber: UITextField!
    
    var number = Int(arc4random_uniform(100))
    var times = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func ShowAlert(sender: AnyObject) {
        
        //1.获得textFiled里面的内容
        let resultText = guessNumber.text!
        
        //2.将textfiled里面北荣转换成Int
        if let result = Int(resultText){
            times += 1
            var message = ""
            if(result > number){
                //3.字符串中插入变量，使用\(variable)
                message = "你输入的数字\(result)太大了"
            }
            else if(result < number){
                message = "你输入的数字\(result)太小了"
            }else{
                message = "猜中了，结果是\(result),猜了\(times)次"
            }
            
            //4.对话框显示内容
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .Alert)
            let action = UIAlertAction(title: "确定", style: .Default, handler:nil)
            alert.addAction(action)
            presentViewController(alert
                , animated: true, completion: nil)
        }
        else{
            let alert = UIAlertController(title: nil, message: "请输入0-99之间的数字", preferredStyle: .Alert)
            let action = UIAlertAction(title: "确定", style: .Default, handler:nil)
            alert.addAction(action)
            presentViewController(alert
                , animated: true, completion: nil)
        }
        
        
        /*
        //1.create a dialog box
        let alert = UIAlertController(title: "Greeting", message: "Hello world!", preferredStyle: .Alert)
        
        //2.create UIAlertAction object, and add this to the former dialog box
        let action = UIAlertAction(title: "OK", style: .Default, handler:nil)
        alert.addAction(action)
        
        //3.use presentViewController to show the dialog box
        presentViewController(alert, animated: true, completion:nil)
        */
        
    }

    @IBAction func StartNewGame(sender: AnyObject) {
        times = 0
        number = Int(arc4random_uniform(100))
    }
}

