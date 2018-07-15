//
//  ViewController.swift
//  alert_picker
//
//  Created by 西川継延 on 2017/12/30.
//  Copyright © 2017年 西川継延. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITableViewDelegate,UITableViewDataSource,CustomAlertDelegate{
  
  struct AlertData {
    var str:String!
    var color:UIColor!
  }
  
  var data:[AlertData] = []
  
  @IBOutlet weak var mytableView: UITableView!
  var pickerView = UIPickerView()
  let number = ["回","lep"]
  let datalist2 = ["kg","lbs"]
  
  
  @IBAction func customalertbtr(_ sender: Any) {
   let customAlert = CustomAlert(frame: CGRect(x: 0.0, y: 0.0, width: 350 , height: 275))
    customAlert.layer.cornerRadius = 30
    customAlert.center = self.view.center
    customAlert.backgroundColor = .clear
   
    // ViewControllerの参照をセット
    customAlert.delegate = self
    self.view.addSubview(customAlert)
  }

  // データ・ソース
  //extension ViewController:UITableViewDataSource {
    
    // データ数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return data.count
    }
    
    // セクション数
    func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }
    
    // セルの高さ
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 40
    }
    
    // セル生成
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
      cell.textLabel?.text = data[indexPath.row].str
      cell.textLabel?.textColor = data[indexPath.row].color
      
      return cell
    }
  //}
  
  //extension ViewController: CustomAlertDelegate {
    func appendData(str:String,color:UIColor) {
      // CustomAlertで作成した文字列をデータに追加
      var alertData = AlertData()
      alertData.str = str
      alertData.color = color
      data.append(alertData)
      // tableViewをリロード
      mytableView.reloadData()
    }
//}
  
  @IBAction func btr(_ sender: Any) {
    let alert = UIAlertController(title: "値を入力してください", message: "\n\n\n\n\n\n\n\n", preferredStyle: .alert)
    // テキストフィールドを追加
    alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
      textField.placeholder = "回数を入力してください。"
    })
    //二個目
    alert.addTextField(configurationHandler: {(textField: UITextField!) -> Void in
      textField.placeholder = "重量を入力してください。"
    })
    
    let saveAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) -> Void in
      //self.mytableView.reloadData()
    }
    let cancelAction = UIAlertAction(title: "キャンセル", style: .default) { (action:UIAlertAction!) -> Void in
    }
    
    //PickerView
    pickerView = UIPickerView(frame:CGRect(x:0, y:50, width:view.bounds.width*0.6, height:300)) // 配置、サイズ
    pickerView.frame = CGRect(x:0, y:0, width:view.bounds.width*0.7, height:280)
    pickerView.dataSource = self
    pickerView.delegate = self
    alert.view.addSubview(pickerView)
    
    alert.addAction(saveAction)
    alert.addAction(cancelAction)

    present(alert, animated: true, completion: nil)
  }
  // PickerViewの列数
  func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 2
  }
  
  // PickerViewの行数
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    if component == 0 {
      // 1個目のピッカーの設定
      return number.count
    }
    return datalist2.count
  }
  
  // PickerViewの項目
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    if component == 0 {
      return number[row]
    }
    return datalist2[row]
  }

  
  // PickerViewの項目選択時
  func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
    @IBAction func text(_ sender: Any) {
        
        let customAlert = NumberView(frame: CGRect(x: 0.0, y: 0.0, width: 250 , height: 300))
        customAlert.layer.cornerRadius = 30
        customAlert.center = self.view.center
        customAlert.backgroundColor = .clear
        
        // ViewControllerの参照をセット
        customAlert.delegate = self
        self.view.addSubview(customAlert)
        
    }
    

}

