//
//  ViewController.swift
//  HowToCreateCustomCollectionViewAsPopOver
//
//  Created by Sainath Bamen on 03/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabelView: UILabel!
    @IBOutlet weak var myImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? SecondViewController{
            vc.delegate = self
        }
            
    }
    
    


}

extension ViewController : passDataBack{
    func selectedShopCategory(sImage: String, sName: String) {
        myImageView.image = UIImage(named: sImage)
        myLabelView.text = sName
    }
    
    
}

