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
    var studentInfo = NSDictionary()
    var username = NSString()
    var gradeInfo = NSString()
    var term = NSString()
    var score1 = NSString()
    var score2 = NSString()
    var score3 = NSString()
    //var userid = NSString()
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = UIColor(red: CGFloat(93)/255.0, green: CGFloat(138)/255.0, blue: CGFloat(230)/255.0, alpha: 1.0)
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
        
        displayData()
    
        println(studentInfo)
        
        
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
        backButton.backgroundColor = UIColor(red: CGFloat(93)/255.0, green: CGFloat(138)/255.0, blue: CGFloat(150)/255.0, alpha: 1.0)
        backButton.setTitle("Back", forState:.Normal)
        backButton.titleLabel.font = UIFont.systemFontOfSize(10)
        backButton.addTarget(self, action: "turnBack",forControlEvents:.TouchUpInside)
        self.view.addSubview(backButton)
    }
    
    func turnBack() {
            self.dismissViewControllerAnimated(true, completion: nil)
    }

        
    
    

 
    func displayData(){
        var studata = studentInfo.objectForKey("data") as NSArray
        score1 = "0"
        score2 = "0"
        score3 = "0"
        var count = studata.count
        var grade = 0
        for index in 0..<count {
            var information = studata[index] as NSDictionary
            username = information.objectForKey("name") as NSString
            gradeInfo = information.objectForKey("grade") as NSString
            var grade0 = gradeInfo as String
            switch grade0{
            case "一":
                  grade = 0
            case "二":
                grade = 1
            case "三":
                grade = 2
            case "四":
                grade = 3
            case "五":
                grade = 4
            case "六":
                grade = 5
            default:break
            }
            term  = information.objectForKey("term") as NSString
            if information.objectForKey("subject") as NSString == "语文"{
                score1  = information.objectForKey("score") as NSString
                var chineseDisplayLabel = UILabel()
                chineseDisplayLabel.frame = CGRectMake(135.0, CGFloat(grade * 20.0) + 65.0, 40.0, 20.0)
                chineseDisplayLabel.text = score1
                chineseDisplayLabel.font = UIFont(name:nil, size:12.0)
                chineseDisplayLabel.textColor = UIColor.whiteColor()
                chineseDisplayLabel.textAlignment = NSTextAlignment.Left
                self.view.addSubview(chineseDisplayLabel)
            }
            if information.objectForKey("subject") as NSString == "数学"{
                score2  = information.objectForKey("score") as NSString
                var mathDisplayLabel = UILabel()
                mathDisplayLabel.frame = CGRectMake(195.0, CGFloat(grade * 20.0) + 65.0, 40.0, 20.0)
                mathDisplayLabel.text = score2
                mathDisplayLabel.font = UIFont(name:nil, size:12.0)
                mathDisplayLabel.textColor = UIColor.whiteColor()
                mathDisplayLabel.textAlignment = NSTextAlignment.Left
                self.view.addSubview(mathDisplayLabel)
            }
            if information.objectForKey("subject") as NSString == "英语"{
                score3  = information.objectForKey("score") as NSString
                var EngDisplayLabel = UILabel()
                EngDisplayLabel.frame = CGRectMake(255.0, CGFloat(grade * 20.0) + 65.0, 40.0, 20.0)
                EngDisplayLabel.text = score3
                EngDisplayLabel.font = UIFont(name:nil, size:12.0)
                EngDisplayLabel.textColor = UIColor.whiteColor()
                EngDisplayLabel.textAlignment = NSTextAlignment.Left
                self.view.addSubview(EngDisplayLabel)
            }
            
            var gradeDisplayLabel = UILabel()
            gradeDisplayLabel.frame = CGRectMake(15.0, CGFloat(grade * 20.0) + 65.0, 40.0, 20.0)
            gradeDisplayLabel.text = gradeInfo
            gradeDisplayLabel.font = UIFont(name:nil, size:12.0)
            gradeDisplayLabel.textColor = UIColor.whiteColor()
            gradeDisplayLabel.textAlignment = NSTextAlignment.Left
            self.view.addSubview(gradeDisplayLabel)
            
            var termDisplayLabel = UILabel()
            termDisplayLabel.frame = CGRectMake(75.0, CGFloat(grade * 20.0) + 65.0, 40.0, 20.0)
            termDisplayLabel.text = term
            termDisplayLabel.font = UIFont(name:nil, size:12.0)
            termDisplayLabel.textColor = UIColor.whiteColor()
            termDisplayLabel.textAlignment = NSTextAlignment.Left
            self.view.addSubview(termDisplayLabel)
            
            
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

