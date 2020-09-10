//
//  File.swift
//  denemeler
//
//  Created by Taylan Bostanci on 4.07.2020.
//  Copyright © 2020 Taylan Bostanci. All rights reserved.
//

import Foundation

class DataManager
{
    static let shared = DataManager()
    
    let  toDoListKey = "todoTitles"
    let userDef = UserDefaults.standard
    func saveData(toDoModelList : [ToDoModel]){
        
        do {
            let encodedData: Data = try NSKeyedArchiver.archivedData(withRootObject: toDoModelList, requiringSecureCoding: false)
            userDef.set(encodedData,forKey: toDoListKey)
            userDef.synchronize()
        }
        catch  {
            
        }
        
    }
    
    func fetchData () -> [ToDoModel]{
    
        
        guard let modelData = userDef.data(forKey: toDoListKey)  else {
            return []
        }
        let mutableData = NSMutableData.init(data: modelData)
        
        
        let modelList = NSKeyedUnarchiver.unarchiveObject(with: modelData) as! [ToDoModel]
        
        return modelList
        
    }
}
