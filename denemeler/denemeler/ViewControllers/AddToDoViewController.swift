//
//  AddToDoViewController.swift
//  denemeler
//
//  Created by Taylan Bostanci on 3.07.2020.
//  Copyright © 2020 Taylan Bostanci. All rights reserved.
//
import UIKit
protocol ToDoAddDelegate:NSObjectProtocol {
    func todoList (toDoModel : ToDoModel )
    }
class AddToDoViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet var textFieldAd : UITextField!
    @IBOutlet weak var aciklamaAlani: UITextView!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var dateTimeTextField: UITextField!
    public weak var delegate : ToDoAddDelegate? = nil

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        textFieldAd.becomeFirstResponder()
    }
    
    func setupUI() {
        let datePickerView = UIDatePicker()
        datePickerView.locale = Locale(identifier: "tr_TR")
        datePickerView.addTarget(self, action: #selector(handleDatePicker), for: .valueChanged)
        datePickerView.datePickerMode = .date
        dateTimeTextField.inputView = datePickerView
    }
    @objc func handleDatePicker(sender: UIDatePicker) {
        
        dateTimeTextField.text = dateFormatter.string(from: sender.date)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
 
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
    }
    
    
    @IBAction func saveButtonTouch(_ sender: Any) {
        let model = ToDoModel(title: textFieldAd.text ?? "" , desc: aciklamaAlani.text ?? "", date: nil)
        delegate?.todoList(toDoModel: model)
        self.navigationController?.popViewController(animated: true)
        
    }
}





