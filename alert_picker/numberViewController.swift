//
//  numberViewController.swift
//  alert_picker
//
//  Created by *** on 2018/07/06.
//  Copyright © 2018年 ***. All rights reserved.
//

import UIKit

class numberViewController: UIView {
    

    @IBOutlet weak var protein: UILabel!
    @IBOutlet weak var fat: UILabel!
    @IBOutlet weak var carbo: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var ptxt: UITextField!
    @IBOutlet weak var ftxt: UITextField!
    @IBOutlet weak var ctxt: UITextField!
    
    var delegate:CustomAlertDelegate?
    
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
        
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    @IBAction func choice(_ sender: Any) {
        
        switch (sender as AnyObject).selectedSegmentIndex {
        case 0:
            ptxt.isHidden = true
            ftxt.isHidden = false
            ctxt.isHidden = false
            
            //ここで値を取得
            let inputtxt = ptxt.text
            //ここでラベルに反映
            protein.text = inputtxt
            
            print("1")
        case 1:
            ptxt.isHidden = false
            ftxt.isHidden = true
            ctxt.isHidden = false
            
            let inputtxt2 = ftxt.text
            fat.text = inputtxt2
            
            print("2")
        case 2:
            ptxt.isHidden = false
            ftxt.isHidden = false
            ctxt.isHidden = true
            let inputtxt3 = ctxt.text
            carbo.text = inputtxt3
            
            print("3")
        default:
            print("nil")
        }
    }
    
    
    @IBAction func one(_ sender: Any) {
       
    }
    
    @IBAction func two(_ sender: Any) {
    }
    
    @IBAction func three(_ sender: Any) {
    }
    
    @IBAction func four(_ sender: Any) {
    }
    
    @IBAction func five(_ sender: Any) {
    }
    
    @IBAction func six(_ sender: Any) {
    }
    
    @IBAction func seven(_ sender: Any) {
    }
    
    @IBAction func eight(_ sender: Any) {
    }
    
    @IBAction func nine(_ sender: Any) {
    }
    
    @IBAction func zero(_ sender: Any) {
    }
    
    @IBAction func point(_ sender: Any) {
    }
    
    @IBAction func OK(_ sender: Any) {
    }
    
    @IBAction func Cancel(_ sender: Any) {
        self.removeFromSuperview()
    }
}
