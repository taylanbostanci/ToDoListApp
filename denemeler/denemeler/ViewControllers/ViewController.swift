//
//  ViewController.swift
//  denemeler
//
//  Created by Taylan Bostanci on 2.07.2020.
//  Copyright © 2020 Taylan Bostanci. All rights reserved.
//

import UIKit
class ViewController: UIViewController, ToDoAddDelegate,UITextFieldDelegate{
    func todoList(toDoModel: ToDoModel) {
        titleList.append(toDoModel)
        DataManager.shared.saveData(toDoModelList: titleList)
        self.tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    public  var titleList  : [ToDoModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        self.titleList = DataManager.shared.fetchData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as? AddToDoViewController
        dest?.delegate = self
        
    }
  
}


extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
   let vc = storyboard?.instantiateViewController(withIdentifier: "go") as! DetailViewController
        let selectedTitle = (titleList[indexPath.row].title)
        let selectedDesc = (titleList[indexPath.row].desc)
        let selectedDate = (titleList[indexPath.row].date)
       self.present(vc,animated: true,completion: nil)
        vc.titleLabel.text = selectedTitle
        vc.textField.text = selectedDesc
        vc.dateLabel.text = dateFormatter.string(from: selectedDate ?? Date())

    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return titleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell" ,for :indexPath) as!  ToDoListCell
        
        cell.titleLabel.text = titleList[indexPath.row].title
       return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
       if editingStyle ==  .delete{
            titleList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        DataManager.shared.saveData(toDoModelList: titleList)
    }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
}

