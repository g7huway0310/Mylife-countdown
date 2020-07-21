//
//  ViewController.swift
//  HW3
//
//  Created by guowei on 2020/7/12.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var BirthDateTxt: UITextField!
   
    let dataPicker=UIDatePicker()
    let calendar=Calendar.current
    var Nowage=0
    var TimeLeft=0
    let rightNow=Date()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        creatDatePicker()
    }
    
    func creatDatePicker(){
        let toolbar=UIToolbar()
        toolbar.sizeToFit()
        let doneBtn=UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneBtn], animated: true)
        
        BirthDateTxt.inputAccessoryView=toolbar
        
        //asign date picker to the text field
        BirthDateTxt.inputView=dataPicker
        dataPicker.datePickerMode = .date
    }
   
    @objc func donePressed()->Int{
        
        let formatter=DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .long
        BirthDateTxt.text=formatter.string(from: dataPicker.date)
        let Rightnowtext=formatter.string(from: rightNow)
       
                
        guard let date1 = formatter.date(from: BirthDateTxt.text!),
            
        let date2 = formatter.date(from: Rightnowtext) else{
            return -1
        }
        let Components=NSCalendar.current.dateComponents([.year], from: date1, to: date2)
        
        print(Components.year!)
        
        self.view.endEditing(true)
        
        Nowage=Components.year!
        
        var Fcomponents = DateComponents()
        
        Fcomponents.setValue((80-Nowage), for: .year)
        let expirationDate = Calendar.current.date(byAdding: Fcomponents, to: rightNow)
        let furture=formatter.string(from:expirationDate!)
        
        guard let datenow = formatter.date(from: Rightnowtext),
                   
        let dateDead = formatter.date(from: furture) else{
                   return -1
               }
        let DeadComponents=NSCalendar.current.dateComponents([.day], from: datenow, to: dateDead)
               
        print(DeadComponents.day!)
        
        TimeLeft=DeadComponents.day!
        
        return Components.year!
        
       
    }
   
    @IBAction func GotoNext(_ sender: Any) {
        
       
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let destinationVC = segue.destination as! ShowViewController
         destinationVC.Deadday=TimeLeft
     }
}
//
//let compon = dataPicker.calendar.dateComponents([.day, .month, .year],from:dataPicker.date)
////        print(compon.date)
////
////
////        let very=calendar.dateComponents([.day], from: compon, to: rightNow).date
////        print(very)
////        let dayInterval=calendar.dateInterval(of: .day, for: rightNow)
////
////        let timePeriod=calendar.dateComponents([.minute], from: dayInterval!.start, to: dayInterval!.end)
//
////         let beginningOfDay=calendar.dateInterval(of: .day, for: rightNow)?.start
////        let currentDateTime=Date()

//        let compon = dataPicker.calendar.dateComponents([.day, .month, .year],from:dataPicker.date)
//        print(compon)
//        let datee=compon.date
//
//        let bettedays=calendar.dateComponents([.day], from: datee!, to: rightNow).day
//        print(bettedays)
