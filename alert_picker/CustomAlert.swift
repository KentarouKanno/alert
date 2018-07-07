//
//  CustomAlert.swift
//  alert_picker
//
//  Created by 西川継延 on 2018/02/16.
//  Copyright © 2018年 西川継延. All rights reserved.
//

import UIKit

//プロトコル
protocol CustomAlertDelegate {
   func appendData(str:String,color:UIColor)
  //func appendData(str:String)
}

class CustomAlert: UIView ,UIPickerViewDataSource,UIPickerViewDelegate {
  
  //lepsに関して
  let item = ["-5","-4","-3","-2","-1","0","1","2","3","4","5",]
  var lepsSelectedIndex = 0
  
  let kgLbsArr = ["kg","lbs"]
  var kgLbsSelectedIndex = 0
  
  let difficulityArr = ["easy","normal","hard"]
  var difficulitySelectedIndex = 0
  
   var delegate:CustomAlertDelegate?
  
  
  
  @IBOutlet var myview: UIView!
  @IBOutlet weak var titlelbl: UILabel!
  @IBOutlet weak var exlbl: UILabel!
  @IBOutlet weak var lepstxt: UITextField!
  @IBOutlet weak var kgtxt: UITextField!
  @IBOutlet weak var lepslbl: UILabel!
  @IBOutlet weak var lepspicker: UIPickerView!
  
  @IBAction func kglbs(_ sender: Any)
  {
    switch (sender as AnyObject).selectedSegmentIndex {
    case 0:
      print("kg")
    default:
      print("lbs")
   }
    
    kgLbsSelectedIndex = (sender as! UISegmentedControl).selectedSegmentIndex
  }
  
   
  @IBAction func difficulty(_ sender: Any)
  {
    switch (sender as AnyObject).selectedSegmentIndex {
    case 0:
      kgtxt.textColor = UIColor.black
      lepstxt.textColor = UIColor.black
    case 1:
      kgtxt.textColor = UIColor.red
      lepstxt.textColor = UIColor.red
    default:
      kgtxt.textColor = UIColor.blue
      lepstxt.textColor = UIColor.blue
   }
    difficulitySelectedIndex = (sender as! UISegmentedControl).selectedSegmentIndex
  }
  
  //コードから
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.commonInit()
  }
  
  //ストボーから
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    self.commonInit()
  }
  
  fileprivate func commonInit() {
    
    guard let view = UINib(nibName: "CustomAlert", bundle: nil).instantiate(withOwner: self, options: nil).first as? UIView else {
      return
    }
    
    //textfieldに関して
    lepstxt.placeholder = "レップ数を入力してください。"
    kgtxt.placeholder = "重量を入力してください。"
    lepstxt.font = UIFont(name: "Hiragino Sans", size: 11)
    kgtxt.font = UIFont(name: "Hiragino Sans", size: 11)
    
    //デリゲート設定
    lepspicker.delegate = self
    lepspicker.dataSource = self
    //lepspicker.selectedRow(inComponent: 6)
    //lepspicker.backgroundColor = .gray
    
    view.frame = self.bounds
    
    self.addSubview(view)
    
  }
  
  @IBAction func cancel(_ sender: Any) {
    self.removeFromSuperview()
  }
    
  @IBAction func ok(_ sender: Any) {
    let lepsVal = lepstxt.text
    //let name2 = lepspicker.textInputMode
    let lepsLbl = "leps"
    //let name4 = "×"
    let kgVal = kgtxt.text
    //let num = item[lepsSelectedIndex]
    
    let cellString = lepsVal! + lepsLbl + "×" + kgVal! + kgLbsArr[kgLbsSelectedIndex]
    /*let cellString = lepsVal! + lepsLbl + "×" + kgVal! + kgLbsArr[kgLbsSelectedIndex] + difficulityArr[difficulitySelectedIndex]*/
    
    // ViewControllerのメソッドを実行
      //テキストと色を渡す
    delegate?.appendData(str: cellString,color: kgtxt.textColor!)
    //delegate?.appendData(str: cellString,)
    self.removeFromSuperview()
  }
  
  
  // PickerViewの列数
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
  }
  
  // PickerViewの行数
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return item.count
  }
  
  // PickerViewの項目
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return item[row]
  }
  
  // PickerViewの項目選択時
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
  }
  
}
