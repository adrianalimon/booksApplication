//
//  DetailBooksViewController.swift
//  MyLibraryProject
//
//  Created by Adriana Limon on 2/7/22.
//

import UIKit

class DetailBooksViewController: UIViewController, UIScrollViewDelegate {
    

    var product : Producto?
    

    var topImageView : UIImageView?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 219/255, green: 219/255, blue: 219/255, alpha: 1)
    
    var backButton : UIButton?
    
    var topLineView : UIView?
    var shareButton : UIButton?
    var favoriteButton : UIButton?
    
    //MARK: - Definicion del primer elemento
    var productContentView : UIView?
    var productImage : UIImageView?
    var productCard : UIView?
    var productName : UILabel?
    var authorProduct : UILabel?
    var categoryProduct : UILabel?
    
    //MARK: - Definicion de descripcion
    var descripcionView : UIView?
    var labelTitleDescription : UILabel?
    var descriptionTextView : UITextView?
    var lineView : UIView?
    
    //MARK: - Defininicion de autor
    var authorView: UIView?
    var authorImage: UIImageView?
    var aboutAuthor: UILabel?
    var authorName: UILabel?
    var authorDescription: UITextView?
   
    
    override func viewDidLoad() {
        super.viewDidLoad()


        view.backgroundColor = backgroundColor
        
        initUI()
    }
    
    func initUI(){
        
        topLineView = UIView(frame: CGRect(x: 0, y: 7, width: 30, height: 4))
        topLineView?.backgroundColor = .gray
        topLineView?.layer.cornerRadius = 4
        topLineView?.center.x = self.view.center.x
        view.addSubview(topLineView!)
        
        
        shareButton = UIButton(frame: CGRect(x: width - 75, y: 20, width: 20, height: 20))
        shareButton?.backgroundColor = .clear
        shareButton?.setImage(UIImage(named: "shareButton"), for: .normal)
        view.addSubview(shareButton!)
        
        
        favoriteButton = UIButton(frame: CGRect(x: width - 45, y: 20, width: 20, height: 20))
        favoriteButton?.backgroundColor = .clear
        favoriteButton?.setImage(UIImage(named: "whiteHeart"), for: .normal)
        view.addSubview(favoriteButton!)
        
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/5))
        topImageView?.image = UIImage(named: "topimage")
        //view.addSubview(topImageView!)
        
        backButton = UIButton(frame: CGRect(x: 10, y: 50, width: 40, height: 40))
        backButton?.setImage(UIImage(named: "back"), for: .normal)
        backButton?.addTarget(self, action:#selector(backAction) , for: .touchUpInside)
        //view.addSubview(backButton!)
        
        createProductView()
        createDescription()
        createAuthor()
    }
    
    func createProductView(){
        productContentView = UIView(frame: CGRect(x: 20, y: height/10 - 45, width: width - 40, height: height/4))
        productContentView?.backgroundColor = .clear
        view.addSubview(productContentView!)
        
        productCard = UIView(frame: CGRect(x: 0, y: height/12, width: width - 40, height: height/5.7))
        productCard?.backgroundColor = .white
        productCard?.layer.cornerRadius = 8
        
        productContentView?.addSubview(productCard!)
        
        productImage = UIImageView(frame: CGRect(x: 20, y: 5, width: (width - 40)/3, height: height/4 - 20))
        productImage?.backgroundColor = .clear
        productImage?.image = UIImage(named: product?.imagen ?? "")
        productImage?.contentMode = .scaleAspectFit
        productImage?.layer.masksToBounds = false
        productImage?.layer.shadowColor = UIColor.black.cgColor
        productImage?.layer.shadowOpacity = 0.5
        productImage?.layer.shadowRadius = 3
        productImage?.layer.shadowOffset = CGSize(width: 0, height: 4)
        productContentView?.addSubview(productImage!)
        
        productName = UILabel(frame: CGRect(x: ((width - 40)/3) + 25, y: 10 , width: (width - 40) - (((width - 40)/3) + 40), height: 30))
        productName?.text = product?.nombre ?? ""
        productName?.backgroundColor = .clear
        productName?.textAlignment = .center
        productName?.font = .boldSystemFont(ofSize: 12)
        productName?.numberOfLines = 2
        //productName?.translatesAutoresizingMaskIntoConstraints = false
        productName?.lineBreakMode = .byWordWrapping
        productCard?.addSubview(productName!)
        
        authorProduct = UILabel(frame: CGRect(x: ((width - 40)/3) + 25, y: 42, width: (width - 40) - (((width - 40)/3) + 40), height: 20))
        authorProduct?.text = "by \(product!.autor!)"
        authorProduct?.font = .systemFont(ofSize: 11)
        authorProduct?.textAlignment = .center
        authorProduct?.backgroundColor = .clear
        productCard?.addSubview(authorProduct!)
        
        categoryProduct = UILabel(frame: CGRect(x: ((width - 40)/3) + 25, y: 62 , width: (width - 40) - (((width - 40)/3) + 40), height: 20))
        categoryProduct?.text = product?.categoria ?? ""
        categoryProduct?.backgroundColor = .clear
        categoryProduct?.textAlignment = .center
        categoryProduct?.font = .systemFont(ofSize: 11)
        productCard?.addSubview(categoryProduct!)
        
    }
    
    func createDescription(){
        descripcionView = UIView() // Paso 1 inicializar objeto
        descripcionView?.backgroundColor = .white
        descripcionView?.layer.cornerRadius = 8
        
        view.addSubview(descripcionView!) // Paso 2 agregar el objeto a un view
        
      //  descripcionView?.addAnchors(left: 20, top: 10, right: 20, bottom: 100,withAnchor: .top, relativeToView: productContentView) // Paso 3 darle constrains
        
        descripcionView?.addAnchorsAndSize(width: nil, height: height/4, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: productContentView)
        
        
        lineView = UIView(frame: CGRect(x: 0, y: 44, width: width - 40, height: 2.5))
        lineView?.backgroundColor = .black
        
        descripcionView?.addSubview(lineView!)
        
        
        labelTitleDescription = UILabel()
        labelTitleDescription?.text = "Descripción"
        labelTitleDescription?.font = .boldSystemFont(ofSize: 12)
        labelTitleDescription?.backgroundColor = .clear
        labelTitleDescription?.textAlignment = .center
        
        descripcionView?.addSubview(labelTitleDescription!)
        
        labelTitleDescription?.addAnchorsAndSize(width: nil, height: 30, left: 10, top: 10, right: 10, bottom: nil)
        
        
        descriptionTextView = UITextView()
        descriptionTextView?.backgroundColor = .clear
        descriptionTextView?.text = product?.descripcion ?? ""
        descriptionTextView?.textAlignment = .justified
        
        descripcionView?.addSubview(descriptionTextView!)
        
        descriptionTextView?.addAnchorsAndSize(width: nil, height: 80, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: labelTitleDescription)
      
    }
    
    func createAuthor(){
        authorView = UIView() // Paso 1 inicializar objeto
        authorView?.backgroundColor = .white
        authorView?.layer.cornerRadius = 8
        
        view.addSubview(authorView!)
        
        authorView?.addAnchorsAndSize(width: nil, height: height/2.9, left: 20, top: 10, right: 20, bottom: nil, withAnchor: .top, relativeToView: descripcionView)
        
        
        authorImage = UIImageView(frame: CGRect(x: 20, y: 5, width: (width - 40)/3, height: height/4 - 45))
        authorImage?.backgroundColor = .clear
        authorImage?.image = UIImage(named: "authorImage")
        authorImage?.contentMode = .scaleAspectFit
        authorView?.addSubview(authorImage!)
        
        
        aboutAuthor = UILabel(frame: CGRect(x: ((width - 40)/3) + 25, y: 33, width: (width - 40) - (((width - 40)/3) + 40), height: 20))
        aboutAuthor?.backgroundColor = .clear
        aboutAuthor?.text = "Sobre el autor"
        aboutAuthor?.font = .systemFont(ofSize: 11)
        aboutAuthor?.textAlignment = .left
        authorView?.addSubview(aboutAuthor!)
        
        authorName = UILabel(frame: CGRect(x: ((width - 40)/3) + 25, y: 57, width: (width - 40) - (((width - 40)/3) + 40), height: 20))
        authorName?.backgroundColor = .clear
        authorName?.text = product?.autor ?? ""
        authorName?.font = .boldSystemFont(ofSize: 14)
        authorName?.textAlignment = .left
        authorView?.addSubview(authorName!)
        
        
        authorDescription = UITextView()
        authorDescription?.backgroundColor = .clear
        authorDescription?.font = .systemFont(ofSize: 11)
        authorDescription?.text = product?.biografia ?? ""
        authorDescription?.textAlignment = .justified
        authorView?.addSubview(authorDescription!)
        
        authorDescription?.addAnchorsAndSize(width: nil, height: 85, left: 10, top: 0, right: 10, bottom: nil, withAnchor: .top, relativeToView: authorImage)
        
        
    }
    
    @objc func backAction(){
        print("Back")
        dismiss(animated: true)
    }
    

}
