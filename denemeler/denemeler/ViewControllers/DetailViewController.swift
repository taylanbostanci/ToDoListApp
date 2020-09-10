//
//  DetailViewController.swift
//  denemeler
//
//  Created by Taylan Bostanci on 27.08.2020.
//  Copyright © 2020 Taylan Bostanci. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController{
   
    
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var date: UITextField!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    public weak var delegate : ToDoAddDelegate? = nil
    public  var titleList  : [ToDoModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()

    }
  
}
