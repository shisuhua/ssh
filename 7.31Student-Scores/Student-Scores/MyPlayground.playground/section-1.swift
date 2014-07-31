// Playground - noun: a place where people can play

import UIKit

var userid = 101010100
var geturl = "http://www.weather.com.cn/data/sk/" + "\(userid)" + ".html"
var url = NSURL(string: "\(geturl)")
var data =  NSData.dataWithContentsOfURL(url, options: NSDataReadingOptions.DataReadingUncached, error: nil)
var json: AnyObject = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments, error: nil)
var weatherInfo: AnyObject! = json.objectForKey("weatherinfo")
var weatherInto: AnyObject! = weatherInfo.objectForKey("city")
//println("123")
//println(json)
//println(weatherInto)



var user = 1
var geturl1 = "http://192.168.0.12/student/openapi.php?id=" + "\(user)"
var url1 = NSURL(string: geturl1)
println(url1)
var data1 = NSData.dataWithContentsOfURL(url1, options: NSDataReadingOptions.DataReadingUncached, error:nil)
if url1 == nil{
    var str = "error url"
    println( str )
}else{
    var json1: AnyObject = NSJSONSerialization.JSONObjectWithData(data1, options: NSJSONReadingOptions.AllowFragments, error: nil)
    var studentInfo: AnyObject! = json1.objectForKey("student")
    println(json1)
    println(studentInfo)
}








