//
//  ViewController.swift
//  bmiCalculator
//
//  Created by Ivan Oliferovich on 1/17/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var highTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var bmiColorView: UIView!
    @IBOutlet weak var bmiResultLabel: UILabel!
    @IBOutlet weak var bmiDescriptionTextView: UITextView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       
        bmiColorView.backgroundColor = UIColor.white
    }
    
    @IBAction func actionCalculateButtonTaped (sender: Any) {
        
        view.endEditing(true) // чтобы клавиатура исчезала после ввода данных
        
        if checkHighAndWeight() == true {
            
            let high = Double(highTextField.text!)! / 100
            
            let weight = Double(weightTextField.text!)!
            
            let bmi = weight / pow(high, 2)
            
            let bmiDescription = getBmiDescription(bmi: bmi)
            let bmiColor = getBmiColor(bmi: bmi)
            
            bmiResultLabel.text = String(format: "%.2f", bmi)
            bmiDescriptionTextView.text = bmiDescription
            bmiColorView.backgroundColor = bmiColor
            
        } else {
            
            let alertController = UIAlertController.init(title: "Внимание", message: "Для вычисления ИМТ необходимо заполнить все поля ", preferredStyle: .alert)
            
            let actionOk = UIAlertAction.init(title: "OK", style: .default, handler: nil)
            alertController.addAction(actionOk)
            present(alertController, animated: true, completion: nil)
        }
        
    }
    
    private func checkHighAndWeight() -> Bool {
        
        guard let high = highTextField.text, high.count > 0 else {
            return false
        }
        
        guard let weight = weightTextField.text, weight.count > 0  else {
            return false
        }
        
        return true
    }
    
    private func getBmiDescription (bmi: Double) -> String {
        
        var bmiDescription = ""
        
        if bmi < 17.5{
            bmiDescription = "Анорексия....."
        } else if bmi >= 17.5 && bmi <= 19.4 {
            bmiDescription = "Дефицит массы тела. Риск для здоровья отсутствует"
        } else if bmi >= 19.4 && bmi <= 25.9 {
            bmiDescription = "Норма. Похудения не требуется"
        } else if bmi >= 26 && bmi <= 27.9 {
            bmiDescription = "Избыток веса. Повышенный риск для здоровья, рекомендуется похудение"
        } else if bmi >= 28 && bmi <= 30.9 {
            bmiDescription = "Ожирение 1 степени. Повышенный риск для здоровья, рекомендуется снижение массы тела"
        } else if bmi >= 31 && bmi <= 35.9 {
            bmiDescription = "Ожирение 2 степени. Высокий риск для здоровья. Настоятельно рекомендуется снижение массы тела"
        } else if bmi >= 36 && bmi <= 40.9 {
            bmiDescription = "Ожирение 3 степени. Очень высокий риск для здоровья. Настоятельно рекомендуется снижение массы тела"
        } else if bmi >= 41 {
            bmiDescription = "Ожирение 4 степени. Чрезвычайно высокий риск для здоровья. Необходимо немедленное снижение массы тела"
        }
        return bmiDescription
    }

    private func getBmiColor (bmi: Double) -> UIColor {
        
        var bmiColor = UIColor.clear
        if bmi < 17.5 {
            bmiColor = UIColor.init(red: 0, green: 162/255, blue: 255/255, alpha: 1)
        } else if bmi >= 17.5 && bmi <= 19.4 {
            bmiColor = UIColor.init(red: 86/255, green: 193/255, blue: 255/255, alpha: 1)
        } else if bmi >= 19.4 && bmi <= 25.9 {
            bmiColor = UIColor.init(red: 97/255, green: 216/255, blue: 54/255, alpha: 1)
        } else if bmi >= 26 && bmi <= 27.9 {
            bmiColor = UIColor.init(red: 246/255, green: 186/255, blue: 0, alpha: 1)
        } else if bmi >= 28 && bmi <= 30.9 {
            bmiColor = UIColor.init(red: 255/255, green: 150/255, blue: 141/255, alpha: 1)
        } else if bmi >= 31 && bmi <= 35.9 {
            bmiColor = UIColor.init(red: 255/255, green: 100/255, blue: 78/255, alpha: 1)
        } else if bmi >= 36 && bmi <= 40.9 {
            bmiColor = UIColor.init(red: 238/255, green: 34/255, blue: 12/255, alpha: 1)
        } else if bmi >= 41 {
            bmiColor = UIColor.init(red: 181/255, green: 23/255, blue: 0, alpha: 1)
        }
        return bmiColor
    }
    
}

