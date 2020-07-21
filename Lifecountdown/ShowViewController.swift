//
//  ShowViewController.swift
//  HW3
//
//  Created by guowei on 2020/7/12.
//  Copyright © 2020 guowei. All rights reserved.
//

import UIKit

class ShowViewController: UIViewController {

    
    @IBOutlet weak var label: UILabel!
    
    var Deadday=0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text="\(Deadday)"

        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
