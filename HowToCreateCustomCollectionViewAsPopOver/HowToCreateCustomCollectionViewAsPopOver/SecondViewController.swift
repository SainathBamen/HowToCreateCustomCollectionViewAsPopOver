//
//  SecondViewController.swift
//  HowToCreateCustomCollectionViewAsPopOver
//
//  Created by Sainath Bamen on 03/09/23.
//

import UIKit
protocol passDataBack {
    func selectedShopCategory(sImage:String, sName:String)
}

class SecondViewController: UIViewController {
    @IBOutlet weak var myView: UIView!
    var shoppingList = [ShoppingData]()
    var catogeryName:String = ""
    var catogeryImage:String = ""

    @IBOutlet weak var myCv: UICollectionView!
    var delegate:passDataBack?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillData()

        
    }
    
    func fillData(){
        let catogery1 = ShoppingData(cName: "Male", cImage: "male")
        shoppingList.append(catogery1)
        let catogery2 = ShoppingData(cName: "Female", cImage: "female")
        shoppingList.append(catogery2)
        let catogery3 = ShoppingData(cName: "Male", cImage: "male")
        shoppingList.append(catogery3)
        let catogery4 = ShoppingData(cName: "Female", cImage: "female")
        shoppingList.append(catogery4)
        let catogery5 = ShoppingData(cName: "Male", cImage: "male")
        shoppingList.append(catogery5)
        let catogery6 = ShoppingData(cName: "Female", cImage: "female")
        shoppingList.append(catogery6)
        let catogery7 = ShoppingData(cName: "Male", cImage: "male")
        shoppingList.append(catogery7)
        let catogery8 = ShoppingData(cName: "Female", cImage: "female")
        shoppingList.append(catogery8)
    }
    

    
    @IBAction func myBtn(_ sender: Any) {
        delegate?.selectedShopCategory(sImage: "notImg", sName: "Not Available")
        dismiss(animated: true, completion: nil)
        
    }
}


extension SecondViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCv.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyCollectionViewCell
        cell.myImg.image = UIImage(named: shoppingList[indexPath.row].categoryImage)
        cell.mylbl.text = shoppingList[indexPath.row].categoryName
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 155, height: 180)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        catogeryImage = shoppingList[indexPath.row].categoryImage
        catogeryName = shoppingList[indexPath.row].categoryName
        delegate?.selectedShopCategory(sImage: catogeryImage, sName: catogeryName)
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: true)
    }
    
    
}
