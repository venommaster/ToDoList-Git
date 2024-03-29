//
//  ToDoDetailsViewController.swift
//  ToDoList
//
//

import UIKit

class ToDoDetailsViewController: UIViewController {
    
    @IBOutlet weak var taskTitleLabel: UILabel!
    
    @IBOutlet weak var taskDetailsTextView: UITextView!
    
    @IBOutlet weak var taskCompletionButton: UIButton!
    
    @IBOutlet weak var taskCompletionDate: UILabel!
    
    weak var delegate: ToDoListDelegate?
    
    var toDoItem: ToDoItem!
    
    var toDoIndex: Int!

    let message = "World"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print(message)
        
        taskTitleLabel.text = toDoItem.name
        
        taskDetailsTextView.text = toDoItem.details
        
        if toDoItem.isComplete {
            
            disableButton()
            
        }
        
        let formatter = DateFormatter()
        
        formatter.dateFormat = "dd MMM, yyyy hh:mm"
        
        let taskDate = formatter.string(from: toDoItem.completionDate)
        
        taskCompletionDate.text = taskDate
        
    }
    
    func disableButton() {
        
        taskCompletionButton.backgroundColor = UIColor.gray
        
        taskCompletionButton.isEnabled = false
        
    }
    
    @IBAction func taskDidComplete(_ sender: Any) {
        
        let alert = UIAlertController(title: <#T##String?#>, message: "Are you sure you like to complete this task", preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Cancek", style: .cancel) { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }
        
        let okAction = UIAlertAction(title: "Ok", style: .default) { (action) in
            
            self.completeTask(alert: alert)
            
            
        }
        
        alert.addAction(cancelAction)
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
        
        
       
        
    }
    
    
    func completeTask(alert: UIAlertController) -> Void {
        
        
        toDoItem.isComplete = true
        
        delegate?.update(task: toDoItem, index: toDoIndex)
        
        disableButton()
            
    }
    

}
