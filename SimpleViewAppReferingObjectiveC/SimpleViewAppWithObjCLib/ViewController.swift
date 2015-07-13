//
//  ViewController.swift
//  SimpleViewAppWithObjCLib
//
//  Created by Seth Jin on 15/7/13.
//  Copyright (c) 2015年 Gintong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, KKColorListViewControllerDelegate {

    var viewColor: KKColorListViewController?
    var sqliteDB: SQLiteDB?
    
    @IBOutlet weak var txtUname: UITextField!
    @IBOutlet weak var txtMobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        sqliteDB = SQLiteDB.sharedInstance()
        if let db = sqliteDB {
            if db.execute("CREATE TABLE IF NOT EXISTS t_user(uid INTEGER PRIMARY KEY, uname VARCHAR(20), mobile VARCHAR(20))") >= 0
            {
                initUser()
            }
        }
        
        viewColor = KKColorListViewController(schemeType: KKColorsSchemeType.Crayola)
        if let colorVC = viewColor {
            colorVC.delegate = self
        }
        
        let userObject = [
            "uname": "user1",
            "tel:": ["mobile": "138", "home": "010"]
        ]
        
        //NSJSONSerialization
        if NSJSONSerialization.isValidJSONObject(userObject) {
            //protocol NilLiteralConvertible conform types can be initialized with `nil`.
            //options: NSJSONWritingOptions.PrettyPrinted or nil
            let data = NSJSONSerialization.dataWithJSONObject(userObject, options: nil, error: nil)
            if let data = data {
                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                if let str = str {
                    println("NSJSONSerialization: str=\(str)")
                }
            }
        } else {
            println("is not a valid json object")
        }
        
        //JSONKit
        let jsonStr: String = (userObject as NSDictionary).JSONString()
        println("JSONKit: jsonStr=\(jsonStr)")
    }

    //viewColor
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func saveUserInfo(sender: AnyObject) {
        saveUser()
    }

    @IBAction func selColor(sender: AnyObject) {
        if let colorVC = viewColor {
            self.presentViewController(colorVC, animated: true, completion: nil)
        }
    }
    
    func colorListController(controller: KKColorListViewController?, didSelectColor color: KKColor!) {
        if let colorVC = viewColor {
            colorVC.dismissViewControllerAnimated(true, completion: nil)
            self.view.backgroundColor = color.uiColor()
        }
    }
    
    func colorListPickerDidComplete(controller: KKColorListViewController?) {
        if let colorVC = viewColor {
            colorVC.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    //sqliteDB
    func initUser() -> Void {
        if let db = sqliteDB {
            let data = db.query("SELECT * FROM t_user")
            if data.count > 0 {
                let user = data[data.count - 1] as SQLRow //获取最后一行
                txtUname.text = user["uname"]?.asString()
                txtMobile.text = user["mobile"]?.asString()
            }
        }
    }
    
    func saveUser() -> Void {
        let uname = txtUname.text
        let mobile = txtMobile.text
        let customAllowedSet =  NSCharacterSet(charactersInString:"=\"#%/<>?@\\^`{|}").invertedSet
        
        func escapeString(originalString: String!) -> String! {
            let escapedString = originalString?.stringByAddingPercentEncodingWithAllowedCharacters(customAllowedSet)
            return escapedString
        }
    
        if let db = sqliteDB {
            let sql = "insert into t_user(uname, mobile) values('\(escapeString(uname))', '\(escapeString(mobile))')"
            println("sql: \(sql)")
            let result = db.execute(sql)
        }
    }

}

