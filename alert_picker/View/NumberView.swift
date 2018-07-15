//
//  NumberView.swift
//  alert_picker
//
//  Created by *** on 2018/07/06.
//  Copyright © 2018年 ***. All rights reserved.
//

import UIKit

class NumberView: UIView {

    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var fat    : UILabel!
    @IBOutlet weak var carbo  : UILabel!
    @IBOutlet weak var total  : UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var segment: UISegmentedControl!
    
    var delegate:CustomAlertDelegate?
    var dataSource = DataSource()
    
    override func didMoveToSuperview() {
        // textField.becomeFirstResponder()
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
        loadNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        loadNib()
    }
    
    func loadNib(){
        if let view = Bundle.main.loadNibNamed("NumberView", owner: self, options: nil)?.first as? UIView {
            view.frame = self.bounds
            self.addSubview(view)
        }
    }
    
    @IBAction func selectedSegment(_ sender: UISegmentedControl) {
        guard let selectedType = DataSource.InputType(rawValue: sender.selectedSegmentIndex) else { return }
        dataSource.inputType = selectedType
    }
    
    @IBAction func tapNumber(_ sender: UIButton) {
        let text = sender.tag == 10 ? "." : String(sender.tag)
        dataSource.upDate(value: text)
        labelUpdate()
    }
    
    func labelUpdate() {
        protein.text = "P: " + dataSource.pText
        fat.text     = "F: " + dataSource.fValue
        carbo.text   = "C: " + dataSource.cValue
        total.text   = dataSource.kValue.isEmpty ? "k: " : "k: " + dataSource.kValue + "kcal"
    }
    
    @IBAction func clear(_ sender: UIButton) {
        textField.text = ""
        dataSource.clear()
        labelUpdate()
    }
    @IBAction func OK(_ sender: Any) {
        
    }
    @IBAction func cancel(_ sender: UIButton) {
        self.removeFromSuperview()
    }
}

class DataSource {
    
    enum InputType: Int {
        case p, f, c, k
    }
    
    var inputType: InputType = .p
    var pValue = ""
    var pText  = ""
    var fValue = ""
    var cValue = ""
    var kValue = ""
    
    func upDate(value: String) {
        switch inputType {
        case .p:
            guard (pValue + value).numberOfOccurrences(of: ".") < 2 else { return }
            pValue += value
            if let p = Double(pValue) {
                pText = pValue + "/\(p * 4)kcal"
            }
        case .f:
            guard (fValue + value).numberOfOccurrences(of: ".") < 2 else { return }
            fValue += value
        case .c:
            guard (cValue + value).numberOfOccurrences(of: ".") < 2 else { return }
            cValue += value
        case .k:
            guard (kValue + value).numberOfOccurrences(of: ".") < 2 else { return }
            kValue += value
        }
        
        guard inputType != .k else { return }
        
        guard let pValue = Double(pValue),
            let fValue = Double(fValue),
            let cValue = Double(cValue) else  {
            kValue = ""
            return
        }
        kValue = String((pValue * 4) + (fValue * 4) + (cValue * 4))
    }
    
    func clear() {
        switch inputType {
        case .p:
            pValue = ""
            pText  = ""
        case .f: fValue = ""
        case .c: cValue = ""
        case .k: break
        }
        kValue = ""
    }
}
