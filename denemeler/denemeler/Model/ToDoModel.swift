//
//  ToDoModel.swift
//  denemeler
//
//  Created by Taylan Bostanci on 9.07.2020.
//  Copyright © 2020 Taylan Bostanci. All rights reserved.
//

import UIKit

class ToDoModel: NSObject,NSCoding {
    let title : String
       let desc : String
       let date : Date?
     
    
       
       init(title:String = "", desc: String, date:Date? = nil) {
           self.title = title
           self.desc = desc
           self.date = date
       }
    
    func encode(with coder: NSCoder) {
        coder.encode(title, forKey: "title")
        coder.encode(desc,forKey: "desc")

    }
    
    required convenience init (coder aDecoder: NSCoder){
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let desc = aDecoder.decodeObject(forKey: "desc") as! String
        let date = aDecoder.decodeObject(forKey: "date") as! Date?
        self.init(title:title,desc:desc,date:date)
    }
    
    
}
