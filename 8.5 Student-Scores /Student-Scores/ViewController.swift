//
//  ViewController.swift
//  Student-Scores
//
//  Created by hy on 14-7-29.
//  Copyright (c) 2014年 hy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    
    var userid = NSString()
    var student = NSDictionary()
    var passwd = NSString()
    var judgepasswd = false
    var judgeid = false
    
    @IBOutlet weak var userinput: UITextField!
    
    @IBOutlet var passwdinput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func LoginNext(sender: AnyObject) {
        
        userid = userinput.text
        passwd = passwdinput.text
        judgement(userid,passInput:passwd)
        
        if judgeid == false{
            var alert = UIAlertController(title: "提示", message: "学号输入错误！", preferredStyle: .Alert)
            var actionback = UIAlertAction(title: "重新输入", style: .Default, handler: nil)
            alert.addAction(actionback)
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else if judgepasswd == false{
            judgeid = false
            var alert = UIAlertController(title: "提示", message: "密码输入错误！", preferredStyle: .Alert)
            var actionback = UIAlertAction(title: "重新输入", style: .Default, handler: nil)
            alert.addAction(actionback)
            self.presentViewController(alert, animated: true, completion: nil)

        }else{
            loadData(userid,passInput:passwd)
            
        }
    }
  
    //验证学号以及密码
    func judgement(userid:String, passInput passwd:String) {
        
        var geturl0 = "http://192.168.0.12/student/openapi3.php"
        var url0 = NSURL(string: geturl0)
        var data0 = NSData.dataWithContentsOfURL(url0, options: NSDataReadingOptions.DataReadingUncached, error:nil)
        var json0: AnyObject = NSJSONSerialization.JSONObjectWithData(data0, options: NSJSONReadingOptions.AllowFragments, error: nil)
        var idpasswd = json0.objectForKey("idpassword") as NSArray
        println(idpasswd)
        for i in 0..<idpasswd.count{
            for (key,value) in idpasswd[i] as NSDictionary{
               if userid == key as NSString{
                   judgeid = true
                   if passwd == value as NSString {
                      judgepasswd = true
                   }
               }
            }
        }
    }
    
    //获取数据
    func loadData(userid:String,passInput passwd:String){
        var geturl = "http://192.168.0.12/student/openapi.php?id=" + "\(userid)" + "&password=" + "\(passwd)"
        var url = NSURL(string: geturl)
        var data = NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingUncached, error:nil)
        var json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
        var studentInfo: AnyObject! = json.objectForKey("student")
        student = studentInfo as NSDictionary
        var DisView = DisViewController()
        DisView.studentInfo = self.student       
        self.presentViewController(DisView , animated: true, completion: nil)

        
        
    }
   
   
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    //点击空白处，返回键盘
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder()
        return true
    }

}

