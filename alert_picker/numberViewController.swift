//
//  numberViewController.swift
//  alert_picker
//
//  Created by *** on 2018/07/06.
//  Copyright © 2018年 ***. All rights reserved.
//

import UIKit

class numberViewController: UIView {
    

    @IBOutlet var myView: UIView!
    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var carbo: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var ptxt: UITextField!
    @IBOutlet weak var ftxt: UITextField!
    @IBOutlet weak var ctxt: UITextField!
    @IBOutlet weak var ktxt: UITextField!
    
    @IBOutlet weak var oneOutlet: UIButton!
    @IBOutlet weak var twoOutlet: UIButton!
    @IBOutlet weak var threeOutlet: UIButton!
    @IBOutlet weak var fourOutlet: UIButton!
    @IBOutlet weak var fiveOutlet: UIButton!
    @IBOutlet weak var sixOutlet: UIButton!
    @IBOutlet weak var sevenOutlet: UIButton!
    @IBOutlet weak var eightOutlet: UIButton!
    @IBOutlet weak var nineOutlet: UIButton!
    @IBOutlet weak var zeroOutlet: UIButton!
    @IBOutlet weak var pointOutlet: UIButton!
    @IBOutlet weak var clear: UIButton!
    
    @IBOutlet weak var cancelOutlet: UIButton!
    @IBOutlet weak var okOutlet: UIButton!
    
    
    var delegate:CustomAlertDelegate?
    
    override func didMoveToSuperview() {
        ptxt.becomeFirstResponder()
    }
    
    @objc func proteinX(_ sender: UITextField) {
        if let text = sender.text {
            protein.text = "P: " + ptxt.text!
            print(text)
        }
    }
    
    @objc func fatX(_ sender: UITextField) {
        if let text = sender.text {
            fat.text = "F: " + ftxt.text!
            print(text)
        }
    }
    
    @objc func carboX(_ sender: UITextField) {
        if let text = sender.text {
            carbo.text = "C: " + ctxt.text!
            print(text)
        }
    }
    
    @objc func kcalX(_ sender: UITextField) {
        if let text = sender.text {
            let textA = ktxt.text!
            let doubleA = Double(textA)! * 2
            total.text = "\(doubleA)"
            print(text)
        }
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
        let view = Bundle.main.loadNibNamed("numberViewController", owner: self, options: nil)?.first as! UIView
        
        self.myView.layer.cornerRadius = 30
        self.oneOutlet.layer.cornerRadius = 10
        self.twoOutlet.layer.cornerRadius = 10
        self.threeOutlet.layer.cornerRadius = 10
        self.fourOutlet.layer.cornerRadius = 10
        self.fiveOutlet.layer.cornerRadius = 10
        self.sixOutlet.layer.cornerRadius = 10
        self.sevenOutlet.layer.cornerRadius = 10
        self.eightOutlet.layer.cornerRadius = 10
        self.nineOutlet.layer.cornerRadius = 10
        self.zeroOutlet.layer.cornerRadius = 10
        self.pointOutlet.layer.cornerRadius = 10
         self.clear.layer.cornerRadius = 10
        
        self.cancelOutlet.layer.cornerRadius = 10
        self.okOutlet.layer.cornerRadius = 10
        
        let topColor = UIColor.lightGray
        let bottomColor = UIColor.white
        
        //グラデーションの色を配列で管理
        let gradientColors: [CGColor] = [topColor.cgColor, bottomColor.cgColor]
        //グラデーションレイヤーを作成
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        
        //グラデーションの色をレイヤーに割り当てる
        gradientLayer.colors = gradientColors
        
        gradientLayer.frame = self.zeroOutlet.bounds
        gradientLayer.startPoint = CGPoint(x:1,y:0.5)
        gradientLayer.endPoint = CGPoint(x:0.0,y:0.5)
        //グラデーションレイヤーをビューの一番下に配置
        self.zeroOutlet.layer.insertSublayer(gradientLayer, at: 0)
        
        ptxt.addTarget(self, action: #selector(self.proteinX(_:)), for: .editingChanged)
        ftxt.addTarget(self, action: #selector(self.fatX(_:)), for: .editingChanged)
        ctxt.addTarget(self, action: #selector(self.carboX(_:)), for: .editingChanged)
        ktxt.addTarget(self, action: #selector(self.kcalX(_:)), for: .editingChanged)
        
        ptxt.isHidden = false
        ftxt.isHidden = true
        ctxt.isHidden = true
        ktxt.isHidden = true
        
        
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBAction func choice(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            ptxt.isHidden = false
            ftxt.isHidden = true
            ctxt.isHidden = true
            ktxt.isHidden = true
            
            
            print("1")
        case 1:
            ptxt.isHidden = true
            ftxt.isHidden = false
            ctxt.isHidden = true
            ktxt.isHidden = true
            ftxt.becomeFirstResponder()
            
            print("2")
        case 2:
            ptxt.isHidden = true
            ftxt.isHidden = true
            ctxt.isHidden = false
            ktxt.isHidden = true
            ctxt.becomeFirstResponder()
            
            print("3")
        case 3:
            ptxt.isHidden = true
            ftxt.isHidden = true
            ctxt.isHidden = true
            ktxt.isHidden = false
            ktxt.becomeFirstResponder()
            
            print("3")
        default:
            print("nil")
        }
    }
    
    func addnumber(number: String) {
        var textnumber = ptxt.text!
        textnumber = textnumber + number
        ptxt.text = textnumber
        let textA = ptxt.text!
        let doubleA = Float(textA)! * 4
        protein.text = "P:" + textnumber + "g /" + "\(doubleA)" + "kcal"
        //protein.text = "P: " + textnumber
    }
    
    func addnumber2(number2: String) {
        var textnumber2 = ftxt.text!
        textnumber2 = textnumber2 + number2
        ftxt.text = textnumber2
        /*let textB = ftxt.text!
        let doubleB = Float(textB)! * 9*/
        fat.text = "F: " + textnumber2
    }
    
    func addnumber3(number3: String) {
        var textnumber3 = ctxt.text!
        textnumber3 = textnumber3 + number3
        ctxt.text = textnumber3
       /* let textC = ctxt.text!
        let doubleC = Float(textC)! * 4*/
        carbo.text = "C" + textnumber3
    }
    func addnumber4(number4: String) {
        var textnumber4 = ktxt.text!
        textnumber4 = textnumber4 + number4
        ktxt.text = textnumber4
        total.text = textnumber4 + "kcal"
    }
    
    
    @IBAction func one(_ sender: Any) {
        addnumber(number: "1")
        addnumber2(number2: "1")
        addnumber3(number3: "1")
        addnumber4(number4: "1")
       
    }
    
    @IBAction func two(_ sender: Any) {
        addnumber(number: "2")
       
    }
    
    @IBAction func three(_ sender: Any) {
        addnumber(number: "3")
        
    }
    
    @IBAction func four(_ sender: Any) {
        addnumber(number: "4")
        
    }
    
    @IBAction func five(_ sender: Any) {
        addnumber(number: "5")
       
    }
    
    @IBAction func six(_ sender: Any) {
        addnumber(number: "6")

    }
    
    @IBAction func seven(_ sender: Any) {
        addnumber(number: "7")

    }
    
    @IBAction func eight(_ sender: Any) {
        addnumber(number: "8")
        
    }
    
    @IBAction func nine(_ sender: Any) {
        addnumber(number: "9")
        
    }
    
    @IBAction func zero(_ sender: Any) {
        addnumber(number: "0")
        
    }
    
    @IBAction func point(_ sender: Any) {
       
        addnumber(number: ".")
       
    }
    
    @IBAction func clear(_ sender: Any) {
        ptxt.text! = ""
    }
    @IBAction func OK(_ sender: Any) {
    }
    
    @IBAction func Cancel(_ sender: Any) {
        self.removeFromSuperview()
    }
}
