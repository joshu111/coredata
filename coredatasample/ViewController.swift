//
//  ViewController.swift
//  coredatasample
//
//  Created by Joshu Sonawane on 8/2/17.
//  Copyright © 2017 Joshu Sonawane. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var tasks: [Names] = []
    @IBOutlet weak var textFIeld: UITextField!
    @IBAction func saveButton(_ sender: Any) {
        
        let task = Names(context:context)
        task.name = textFIeld.text!
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        
    }
    @IBOutlet weak var textArea: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textArea.text = ""
        getData()
        for item in tasks {
            textArea.text = textArea.text + "\n" + item.name!
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func getData() {
        do {
            tasks = try context.fetch(Names.fetchRequest())
        } catch {
            print("Fetching Failed")
        }
    }

}

