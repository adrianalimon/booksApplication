//
//  CatalogoViewController.swift
//  MyLibraryProject
//
//  Created by Adriana Limon on 2/7/22.
//

import Foundation
import UIKit

class CatalogoTableViewCell : UITableViewCell{
    
    var ownContent : UIView?
    var nameProduct : UILabel?
    var descriptionProduct : UILabel?
    var authorProduct : UILabel?
    var categoryProduct : UILabel?
    
    var addButton : UIButton?
    var shareButton : UIButton?
    var favoriteButton : UIButton?
    var imageProduct : UIImageView?
    
    
    var producto : Producto?
    
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    
    init(producto : Producto){
        super.init(style: .default, reuseIdentifier: nil)
        self.producto = producto
        self.backgroundColor = .clear
        
        initUI()
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 20, height: height/4 - 10))
        ownContent?.backgroundColor = .white
        ownContent?.layer.cornerRadius = 10
        self.addSubview(ownContent!)
        
        
        nameProduct = UILabel(frame: CGRect(x: width / 3.4, y: 30, width: width / 1.6, height: 20))
        nameProduct?.text = producto?.nombre
        nameProduct?.textAlignment = .left
        nameProduct?.font = .boldSystemFont(ofSize: 12)
        //nameProduct?.adjustsFontSizeToFitWidth = true
        nameProduct?.backgroundColor = .clear
        ownContent?.addSubview(nameProduct!)
        
        descriptionProduct = UILabel(frame: CGRect(x: width / 3.4, y: 30, width: width / 1.6, height: 50))
        descriptionProduct?.text = producto?.descripcion
        descriptionProduct?.numberOfLines = 0
        descriptionProduct?.textAlignment = .left
        descriptionProduct?.adjustsFontSizeToFitWidth = true
        descriptionProduct?.backgroundColor = .blue
        //ownContent?.addSubview(descriptionProduct!)
        
        authorProduct = UILabel(frame: CGRect(x: width / 3.4, y: 55, width: width / 1.6, height: 20))
        authorProduct?.text = "by \(producto!.autor!)"
        authorProduct?.font = .systemFont(ofSize: 11)
        authorProduct?.textAlignment = .left
        authorProduct?.backgroundColor = .clear
        
        ownContent?.addSubview(authorProduct!)
        
        
        categoryProduct = UILabel(frame: CGRect(x: width / 3.4, y: 75, width: width / 1.6, height: 20))
        categoryProduct?.text = producto?.categoria
        categoryProduct?.font = .systemFont(ofSize: 10)
        categoryProduct?.textAlignment = .left
        categoryProduct?.backgroundColor = .clear
        
        ownContent?.addSubview(categoryProduct!)
        
        
        addButton = UIButton(frame: CGRect(x: width/1.2 - 12, y: (height/4 - 28) - 40, width: 30, height: 30))
        addButton?.backgroundColor = .clear
        addButton?.setImage(UIImage(named: "irAdelante"), for: .normal)
        //addButton?.setTitle("Agregar", for: .normal)
        //addButton?.setTitleColor(.orange, for: .normal) // Modificamos el color del titulo del boton
        //addButton?.layer.borderColor = UIColor.orange.cgColor
        //addButton?.layer.borderWidth = 1 // Aqui definimos el ancho del borde
        //addButton?.layer.cornerRadius = 10
        
        ownContent?.addSubview(addButton!)
        
        
        shareButton = UIButton(frame: CGRect(x: width/1.2 - 14, y: (height/4 + 5) - 40, width: 12, height: 12))
        shareButton?.backgroundColor = .clear
        shareButton?.setImage(UIImage(named: "shareButton"), for: .normal)
        
        ownContent?.addSubview(shareButton!)
        
        
        favoriteButton = UIButton(frame: CGRect(x: width/1.2 + 5, y: (height/4 + 5) - 40, width: 12, height: 12))
        favoriteButton?.backgroundColor = .clear
        favoriteButton?.setImage(UIImage(named: "whiteHeart"), for: .normal)
        
        ownContent?.addSubview(favoriteButton!)
        
        
        imageProduct = UIImageView(frame: CGRect(x: 10, y: 10, width: width / 3 - 30, height: height / 4 - 30))
        imageProduct?.image = UIImage(named: producto?.imagen ?? "")
        imageProduct?.layer.cornerRadius = 2
        imageProduct?.backgroundColor = .lightGray
        //imageProduct?.contentMode = .scaleAspectFit
        imageProduct?.layer.masksToBounds = false
        imageProduct?.layer.shadowColor = UIColor.black.cgColor
        imageProduct?.layer.shadowOpacity = 0.5
        imageProduct?.layer.shadowRadius = 3
        imageProduct?.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        ownContent?.addSubview(imageProduct!)

        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

