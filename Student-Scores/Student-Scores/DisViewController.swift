//
//  DisViewController.swift
//  Student-Scores
//
//  Created by hy on 14-7-29.
//  Copyright (c) 2014年 hy. All rights reserved.
//

import Foundation

import UIKit

class DisViewController: UIViewController {
   
    var array = ["Grade", "Term", "Chinese", "Math", "English"]
    var username = NSString()
    var grade = NSString()
    var term = NSString()
    var score1 = NSString()
    var score2 = NSString()
    var score3 = NSString()
    var userid = NSString()
    var studentInfo = NSDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor.greenColor()
        var nameLabel = UILabel()
        nameLabel.frame = CGRectMake(15.0, 20.0, 40.0, 20.0)
        nameLabel.text = "Name:"
        nameLabel.font = UIFont(name:nil, size:12.0)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(nameLabel)
        
        for index in 0...4 {
            var gradeLabel = UILabel()
            gradeLabel.frame = CGRectMake(CGFloat(index*60 + 15.0), 45.0, 60.0, 20.0)
            gradeLabel.text = array[index]
            gradeLabel.font = UIFont(name:nil, size:12.0)
            gradeLabel.textColor = UIColor.whiteColor()
            gradeLabel.textAlignment = NSTextAlignment.Left
            self.view.addSubview(gradeLabel)
        }
        
       // displayData()
    
        println(studentInfo)
        
  /*    username = studentInfo.objectForKey("Radar") as NSString
        grade = studentInfo.objectForKey("WSE") as NSString
        term = studentInfo.objectForKey("WS") as NSString
        score1 = studentInfo.objectForKey("SD") as NSString
        score2 = studentInfo.objectForKey("city") as NSString
        score3 = studentInfo.objectForKey("time") as NSString

        var gradeDisplayLabel = UILabel()
        gradeDisplayLabel.frame = CGRectMake(15.0, 65.0, 40.0, 20.0)
        gradeDisplayLabel.text = grade
        gradeDisplayLabel.font = UIFont(name:nil, size:12.0)
        gradeDisplayLabel.textColor = UIColor.whiteColor()
        gradeDisplayLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(gradeDisplayLabel)
        
        var termDisplayLabel = UILabel()
        termDisplayLabel.frame = CGRectMake(75.0, 65.0, 40.0, 20.0)
        termDisplayLabel.text = term
        termDisplayLabel.font = UIFont(name:nil, size:12.0)
        termDisplayLabel.textColor = UIColor.whiteColor()
        termDisplayLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(termDisplayLabel)
        
        var chineseDisplayLabel = UILabel()
        chineseDisplayLabel.frame = CGRectMake(135.0, 65.0, 40.0, 20.0)
        chineseDisplayLabel.text = self.score1
        chineseDisplayLabel.font = UIFont(name:nil, size:12.0)
        chineseDisplayLabel.textColor = UIColor.whiteColor()
        chineseDisplayLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(chineseDisplayLabel)
        
        var mathDisplayLabel = UILabel()
        mathDisplayLabel.frame = CGRectMake(195.0, 65.0, 40.0, 20.0)
        mathDisplayLabel.text = score2
        mathDisplayLabel.font = UIFont(name:nil, size:12.0)
        mathDisplayLabel.textColor = UIColor.whiteColor()
        mathDisplayLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(mathDisplayLabel)
        
        var EngDisplayLabel = UILabel()
        EngDisplayLabel.frame = CGRectMake(255.0, 65.0, 40.0, 20.0)
        EngDisplayLabel.text = score3
        EngDisplayLabel.font = UIFont(name:nil, size:12.0)
        EngDisplayLabel.textColor = UIColor.whiteColor()
        EngDisplayLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(EngDisplayLabel)

  */
        
        
        
        //显示姓名
        var nameDisplayLabel = UILabel()
        nameDisplayLabel.frame = CGRectMake(60.0, 20.0, 40.0, 20.0)
        nameDisplayLabel.text = username
        nameDisplayLabel.font = UIFont(name:nil, size:12.0)
        nameDisplayLabel.textColor = UIColor.whiteColor()
        nameDisplayLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(nameDisplayLabel)
        
        
        //设置返回按钮
        var backButton = UIButton()
        backButton.frame = CGRectMake(260,440,40,20)
        //backButton.backgroundColor = UIColor.blackColor()
        backButton.setTitle("Back", forState:.Normal)
        backButton.titleLabel.font = UIFont.systemFontOfSize(12)
        backButton.addTarget(self, action: "turnBack",forControlEvents:.TouchUpInside)
        self.view.addSubview(backButton)
   
        func turnBack() {
            self.dismissViewControllerAnimated(true, completion: nil)
        }

        
    }
    

 /*
    func displayData(){
        //var student = studentInfo as Dictionary
        var student = ["data":[{"dg"="dg"},{"dg"="ghgh"}]]
        var count = 0
        for temp in student["data"]{
            count++
        }
        for index in 1...count {
            var data = "data" + "\(index)"
            self.username = studentInfo[data].objectForKey("姓名") as NSString
            self.grade = studentInfo[data].objectForKey("grade") as NSString
            self.term  = studentInfo[data].objectForKey("term") as NSString
            if studentInfo[data].objectForKey("subject") as NSString == "语文"{
                 self.score1  = studentInfo[data].objectForKey("score") as NSString
            }
            if studentInfo[data].objectForKey("subject") as NSString == "数学"{
                 self.score2  = studentInfo[data].objectForKey("score") as NSString
            }
            if studentInfo[data].objectForKey("subject") as NSString == "英语"{
                 self.score3  = studentInfo[data].objectForKey("score") as NSString
            }
            
            var gradeDisplayLabel = UILabel()
            gradeDisplayLabel.frame = CGRectMake(CGFloat((index-1)*60 + 15.0), CGFloat(index*40+65.0), 40.0, 20.0)
            gradeDisplayLabel.text = self.grade
            gradeDisplayLabel.font = UIFont(name:nil, size:12.0)
            gradeDisplayLabel.textColor = UIColor.whiteColor()
            gradeDisplayLabel.textAlignment = NSTextAlignment.Left
            self.view.addSubview(gradeDisplayLabel)
            
            var termDisplayLabel = UILabel()
            termDisplayLabel.frame = CGRectMake(75.0, 65.0, 40.0, 20.0)
            termDisplayLabel.text = self.term
            termDisplayLabel.font = UIFont(name:nil, size:12.0)
            termDisplayLabel.textColor = UIColor.whiteColor()
            termDisplayLabel.textAlignment = NSTextAlignment.Left
            self.view.addSubview(termDisplayLabel)
            
            var chineseDisplayLabel = UILabel()
            chineseDisplayLabel.frame = CGRectMake(135.0, 65.0, 40.0, 20.0)
            chineseDisplayLabel.text = score1
            chineseDisplayLabel.font = UIFont(name:nil, size:12.0)
            chineseDisplayLabel.textColor = UIColor.whiteColor()
            chineseDisplayLabel.textAlignment = NSTextAlignment.Left
            self.view.addSubview(chineseDisplayLabel)
            
            var mathDisplayLabel = UILabel()
            mathDisplayLabel.frame = CGRectMake(195.0, 65.0, 40.0, 20.0)
            mathDisplayLabel.text = score2
            mathDisplayLabel.font = UIFont(name:nil, size:12.0)
            mathDisplayLabel.textColor = UIColor.whiteColor()
            mathDisplayLabel.textAlignment = NSTextAlignment.Left
            self.view.addSubview(mathDisplayLabel)
            
            var EngDisplayLabel = UILabel()
            EngDisplayLabel.frame = CGRectMake(255.0, 65.0, 40.0, 20.0)
            EngDisplayLabel.text = score3
            EngDisplayLabel.font = UIFont(name:nil, size:12.0)
            EngDisplayLabel.textColor = UIColor.whiteColor()
            EngDisplayLabel.textAlignment = NSTextAlignment.Left
            self.view.addSubview(EngDisplayLabel)
            
        }
    }
    
*/

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

