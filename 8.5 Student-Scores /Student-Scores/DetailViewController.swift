//
//  DetailViewController.swift
//  Student-Scores
//
//  Created by hy on 14-8-4.
//  Copyright (c) 2014年 hy. All rights reserved.
//

import Foundation
import UIKit

class DetailViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    var array = ["Grade", "Term", "Chinese", "Math", "English"]
    var studentInfo = NSDictionary()
    var username = NSString()
    var gradeInfo = NSString()
    var term = NSString()
    var score1 = NSString()
    var score2 = NSString()
    var score3 = NSString()
    var gradelevel = NSString()
    
    var grades = ["1", "2", "3", "4", "5","6"]
    var tableView: UITableView = UITableView(frame: CGRect(x: 200.0, y: 40.0, width:40.0,height: 70.0 ),style:UITableViewStyle.Plain)

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //设置背景
        self.view.backgroundColor = UIColor(red: CGFloat(93)/255.0, green: CGFloat(138)/255.0, blue: CGFloat(230)/255.0, alpha: 1.0)
        
        var nameLabel = UILabel()
        nameLabel.frame = CGRectMake(15.0, 20.0, 40.0, 20.0)
        nameLabel.text = "Name:"
        nameLabel.font = UIFont(name:nil, size:12.0)
        nameLabel.textColor = UIColor.whiteColor()
        nameLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(nameLabel)
        
        var gradeLabel = UILabel()
        gradeLabel.frame = CGRectMake(140.0, 20.0, 60.0, 20.0)
        gradeLabel.text = "SelectGrade:"
        gradeLabel.font = UIFont(name:nil, size:10.0)
        gradeLabel.textColor = UIColor.whiteColor()
        gradeLabel.textAlignment = NSTextAlignment.Left
        self.view.addSubview(gradeLabel)
        
        tableView.backgroundColor = UIColor.orangeColor()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.hidden = true
        
        var gradeButton = UIButton()
        gradeButton.frame = CGRectMake(200,22.5,40,15)
        gradeButton.backgroundColor = UIColor.whiteColor()
        gradeButton.setTitle(" ", forState:.Normal)
        gradeButton.titleLabel.font = UIFont.systemFontOfSize(10)
        gradeButton.addTarget(self, action: "dislist",forControlEvents:.TouchUpInside)
        self.view.addSubview(gradeButton)


        
        
        for index in 0...4 {
            var gradeLabel = UILabel()
            gradeLabel.frame = CGRectMake(CGFloat(index*60) + 15.0, 45.0, 60.0, 20.0)
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
        
        var backButton = UIButton()
        backButton.frame = CGRectMake(250,440,20,15)
        backButton.backgroundColor = UIColor(red: CGFloat(93)/255.0, green: CGFloat(138)/255.0, blue: CGFloat(150)/255.0, alpha: 1.0)
        backButton.setTitle("Back", forState:.Normal)
        backButton.titleLabel.font = UIFont.systemFontOfSize(8)
        backButton.addTarget(self, action: "turnback",forControlEvents:.TouchUpInside)
        self.view.addSubview(backButton)
        
        //设置退出按钮
        var exitButton = UIButton()
        exitButton.frame = CGRectMake(280,440,20,15)
        exitButton.backgroundColor = UIColor(red: CGFloat(93)/255.0, green: CGFloat(138)/255.0, blue: CGFloat(150)/255.0, alpha: 1.0)
        exitButton.setTitle("Exit", forState:.Normal)
        exitButton.titleLabel.font = UIFont.systemFontOfSize(8)
        exitButton.addTarget(self, action: "Exitsystem",forControlEvents:.TouchUpInside)
        self.view.addSubview(exitButton)
    }
    
    func dislist(){
        if tableView.hidden == false{
            tableView.hidden = true
        }else{
            tableView.hidden = false
        }
    }
    
    func turnback(){
        var DisView = DisViewController()
        DisView.studentInfo = self.studentInfo
        self.presentViewController(DisView , animated: true, completion: nil)
    }
    
    
    func Exitsystem() {
        var sb = UIStoryboard(name: "Main", bundle: nil)
        var vc = sb.instantiateViewControllerWithIdentifier("mystoryboard") as ViewController
        self.presentViewController(vc, animated: true, completion: nil)
        
        
    }
    
    
    func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return grades.count
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath!) -> CGFloat {
        return 12
    }
    
    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: nil)
        cell.textLabel.text = "\(indexPath.row + 1)"
        cell.textLabel.font = UIFont.systemFontOfSize(10)
        return cell
    }
    
    func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!){
        var DetailView = DetailViewController()
        var chooselevel = grades[indexPath.row]
        var studata = studentInfo.objectForKey("data") as NSArray
        var count = studata.count
        var flag = 0
        for index in 0..<count {
            var information = studata[index] as NSDictionary
            gradeInfo = information.objectForKey("grade") as NSString
            if gradeInfo == chooselevel{
                flag = 1
            }
            
        }
        if flag == 0{
            var alert = UIAlertController(title: "提示", message: "没有该年级成绩！", preferredStyle: .Alert)
            var actionback = UIAlertAction(title: "请重新选择", style: .Default, handler: nil)
            alert.addAction(actionback)
            self.presentViewController(alert, animated: true, completion: nil)
        }else{
            
            DetailView.gradelevel = chooselevel
            DetailView.studentInfo = self.studentInfo
            self.presentViewController(DetailView, animated: true, completion: nil)
        }
        
        tableView.hidden = true
        
    }
    
    func displayData(){
        var studata = studentInfo.objectForKey("data") as NSArray
        score1 = "0"
        score2 = "0"
        score3 = "0"
        var count = studata.count
        var grade = 0
        var flag = 0
        
        for index in 0..<count {
            var information = studata[index] as NSDictionary
            username = information.objectForKey("name") as NSString
            gradeInfo = information.objectForKey("grade") as NSString
            if gradeInfo == gradelevel{
            var termInfo  = information.objectForKey("term") as NSString
            var termnum:Int = 0
            switch termInfo{
            case "1":
                term = "上学期"
                termnum = 0
            case "2":
                term = "下学期"
                termnum = 1
            default:
                break
                }
            
            if information.objectForKey("subject") as NSString == "1"{
                score1  = information.objectForKey("score") as NSString
                var chineseDisplayLabel = UILabel()
                chineseDisplayLabel.frame = CGRectMake(135.0, CGFloat(termnum) * 20 + 65.0, 40.0, 20.0)
                chineseDisplayLabel.text = score1
                chineseDisplayLabel.font = UIFont(name:nil, size:12.0)
                chineseDisplayLabel.textColor = UIColor.whiteColor()
                chineseDisplayLabel.textAlignment = NSTextAlignment.Left
                self.view.addSubview(chineseDisplayLabel)
            }
            if information.objectForKey("subject") as NSString == "2"{
                score2  = information.objectForKey("score") as NSString
                var mathDisplayLabel = UILabel()
                mathDisplayLabel.frame = CGRectMake(195.0, CGFloat(termnum) * 20 + 65.0, 40.0, 20.0)
                mathDisplayLabel.text = score2
                mathDisplayLabel.font = UIFont(name:nil, size:12.0)
                mathDisplayLabel.textColor = UIColor.whiteColor()
                mathDisplayLabel.textAlignment = NSTextAlignment.Left
                self.view.addSubview(mathDisplayLabel)
            }
            if information.objectForKey("subject") as NSString == "3"{
                score3  = information.objectForKey("score") as NSString
                var EngDisplayLabel = UILabel()
                EngDisplayLabel.frame = CGRectMake(255.0, CGFloat(termnum) * 20 + 65.0, 40.0, 20.0)
                EngDisplayLabel.text = score3
                EngDisplayLabel.font = UIFont(name:nil, size:12.0)
                EngDisplayLabel.textColor = UIColor.whiteColor()
                EngDisplayLabel.textAlignment = NSTextAlignment.Left
                self.view.addSubview(EngDisplayLabel)
            }
            
            var gradeDisplayLabel = UILabel()
            gradeDisplayLabel.frame = CGRectMake(15.0, CGFloat(termnum) * 20 + 65.0, 40.0, 20.0)
            gradeDisplayLabel.text = gradeInfo
            gradeDisplayLabel.font = UIFont(name:nil, size:12.0)
            gradeDisplayLabel.textColor = UIColor.whiteColor()
            gradeDisplayLabel.textAlignment = NSTextAlignment.Left
            self.view.addSubview(gradeDisplayLabel)
            
            var termDisplayLabel = UILabel()
            termDisplayLabel.frame = CGRectMake(75.0, CGFloat(termnum) * 20 + 65.0, 40.0, 20.0)
            termDisplayLabel.text = term
            termDisplayLabel.font = UIFont(name:nil, size:12.0)
            termDisplayLabel.textColor = UIColor.whiteColor()
            termDisplayLabel.textAlignment = NSTextAlignment.Left
            self.view.addSubview(termDisplayLabel)
            }
        }
        
        
        
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
