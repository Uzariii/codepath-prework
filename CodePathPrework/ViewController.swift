//
//  ViewController.swift
//  CodePathPrework
//
//  Created by Daniela Raudales on 1/5/23.
//

import UIKit

class ViewController: UIViewController {
    
    //OUTLET
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    
    @IBOutlet weak var yearSegmentControl: UISegmentedControl!
    
    
    //CREATING AN INTRODUCTION
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
        let year = yearSegmentControl.titleForSegment(at: yearSegmentControl.selectedSegmentIndex)
        
        //holds the introduction
        let introduction = "Hello, my name is \(firstNameTextField.text!) \(lastNameTextField.text!). I'm currently a \(year!) at \(schoolNameTextField.text!) studying a \(majorTextField.text!) major. I own \(numberOfPetsLabel.text!) pet(s) & it is \(morePetsSwitch.isOn) that I want to get more pets."
        
        //ALERT
        let alertController = UIAlertController (title: "Get to know me!", message: introduction, preferredStyle: .alert)
        
        //DISMISS ALERT
        let action = UIAlertAction (title: "Hope to see you around!", style: .default, handler: nil)
        
        alertController.addAction(action)
        
        present(alertController, animated: true, completion: nil)
        
    }
    
    //ADJUSTING THE NUMBER OF PETS
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    //OUTLET
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    
    
    
    @IBOutlet weak var majorTextField: UITextField!
    
    let majors = ["Arts & Humanities", "Business", "Health & Medicine", "Multi-Interdisciplinary Studies", "Public & Social Services", "STEM", "Social Sciences"]
    
    var pickerView = UIPickerView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //major view
        pickerView.delegate = self
        pickerView.dataSource = self
        
        majorTextField.inputView = pickerView
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
    }
        
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return majors.count
    }
    
    func pickerView(_ pickerView: UIPickerView,titleForRow row: Int, forComponent component: Int) -> String? {
        return majors[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        majorTextField.text = majors[row]
        majorTextField.resignFirstResponder()
    }
    
}


