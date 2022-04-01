//
//  ViewController.swift
//  MyLibraryProject
//
//  Created by Adriana Limon on 1/26/22.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents
import ATGValidator

class ViewController: UIViewController, UITextFieldDelegate {
    
    var welcomeLabel : UILabel?
    var loginButton : UIButton?
    var withoutAccount : UILabel?
    var registerButton : UIButton?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        initUI()
        
    }
    
    func initUI(){
        
        let booksImage = "booksImage.png"
        let image1 = UIImage(named: booksImage)
        let imageView1 = UIImageView(image: image1!)
        imageView1.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150)
        imageView1.center.x = self.view.center.x
        view.addSubview(imageView1)
        
        
        let logoImage = "logoImage.png"
        let image2 = UIImage(named: logoImage)
        let imageView2 = UIImageView(image: image2!)
        imageView2.frame = CGRect(x: 0, y: 40, width: 164, height: 35)
        imageView2.center.x = self.view.center.x
        view.addSubview(imageView2)
        
        
        let logoKodemia = "whiteKodemia.png"
        let image3 = UIImage(named: logoKodemia)
        let imageView3 = UIImageView(image: image3!)
        imageView3.frame = CGRect(x: 0, y: 535, width: 50, height: 30)
        imageView3.center.x = self.view.center.x
        view.addSubview(imageView3)
        
        
        let openBook = "openBook.png"
        let image = UIImage(named: openBook)
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 80, width: 100, height: 100)
        imageView.center.x = self.view.center.x
        imageView.contentMode = .scaleAspectFit
        /*imageView.layer.shadowColor = UIColor.black.cgColor
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowOffset = .zero
        imageView.layer.shadowRadius = 10*/
        view.addSubview(imageView)
        
        
        welcomeLabel = UILabel(frame: CGRect(x: 0, y: 171, width: 150, height: 40))
        welcomeLabel?.text = "¡Bienvenido!"
        welcomeLabel?.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        welcomeLabel?.center.x = self.view.center.x
        welcomeLabel?.backgroundColor = .clear
        welcomeLabel?.textAlignment = .center
        welcomeLabel?.textColor = .black
        
        view.addSubview(welcomeLabel!)
        
        
        let loginUserField = MDCOutlinedTextField(frame: CGRect(x: 0, y: 223, width: 310, height: 10))
        //usuarioTextField.applyTheme(withScheme: self.)
        loginUserField.center.x = self.view.center.x
        loginUserField.label.text = "Usuario"
        loginUserField.placeholder = "FerLima"
        loginUserField.font = UIFont.systemFont(ofSize: 11)
        loginUserField.textAlignment = NSTextAlignment.left
        loginUserField.keyboardType = UIKeyboardType.default
        loginUserField.autocorrectionType = UITextAutocorrectionType.no
        loginUserField.clearButtonMode = UITextField.ViewMode.whileEditing
        loginUserField.leadingAssistiveLabel.text = "*Introduzca su usuario"
        loginUserField.leadingAssistiveLabel.font = UIFont.systemFont(ofSize: 10)
        loginUserField.sizeToFit()
        self.view.addSubview(loginUserField)

        loginUserField.validationRules = [
            CharacterSetRule.containsUpperCase(),
            CharacterSetRule.containsLowerCase(),
            //CharacterSetRule.containsNumber(),
            StringLengthRule.min(8)
        ]
        
        loginUserField.validateOnInputChange(true)
        
        loginUserField.validationHandler = { [self] result in
            print(result.status, result.errors)
            
            if result.status == .failure{
                loginUserField.leadingAssistiveLabel.text = "*Usuario invalido. Ingrese un usuario válido."
            }else{
                loginUserField.leadingAssistiveLabel.text = "Usuario registrado. Coloque su contraseña."
            }
            
        }
        
    
        let loginPasswordField = MDCOutlinedTextField(frame: CGRect(x: 0, y: 303, width: 310, height: 10))
        loginPasswordField.center.x = self.view.center.x
        loginPasswordField.label.text = "Contraseña"
        loginPasswordField.placeholder = "Ingresa tu contraseña"
        loginPasswordField.font = UIFont.systemFont(ofSize: 11)
        loginPasswordField.textAlignment = NSTextAlignment.left
        loginPasswordField.keyboardType = UIKeyboardType.default
        loginPasswordField.autocorrectionType = UITextAutocorrectionType.no
        loginPasswordField.clearButtonMode = UITextField.ViewMode.whileEditing
        loginPasswordField.leadingAssistiveLabel.text = "*Introduzca su contraseña"
        loginPasswordField.leadingAssistiveLabel.font = UIFont.systemFont(ofSize: 10)
        loginPasswordField.sizeToFit()
        loginPasswordField.isSecureTextEntry = true
        self.view.addSubview(loginPasswordField)
        loginPasswordField.validationRules = [
            StringRegexRule(regex: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,15}")
        ]
        
        loginPasswordField.validateOnInputChange(true)
        
        loginPasswordField.validationHandler = { result in
            print(result.status, result.errors)
            
            if result.status == .failure{
                loginPasswordField.leadingAssistiveLabel.text = "*Contraseña incorrecta. ¿Olvidó su contraseña?"
            }else{
                loginPasswordField.leadingAssistiveLabel.text = "Contraseña correcta. Bienvenido."
            }
            
        }
        
       /* let eyeIcon = UIImageView(image: UIImage(named:"ic_eye"))
        eyeIcon.frame = CGRect(x: 0, y: 0, width: 25, height: 25)
            
        loginPasswordField.trailingView = eyeIcon
        loginPasswordField.trailingViewMode = .always */
        
        
        loginButton = UIButton(frame: CGRect(x: 0, y: 440, width: 280, height: 50))
        loginButton?.backgroundColor = UIColor.black
        loginButton?.center.x = self.view.center.x
        loginButton?.setTitle("Ingresar", for: .normal)
        loginButton?.layer.cornerRadius = 10
       // loginButton?.active = false
        loginButton?.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
        
        view.addSubview(loginButton!)
        
        
        withoutAccount = UILabel(frame: CGRect(x: 0, y: 495, width: 150, height: 20))
        withoutAccount?.text = "¿Todavía no tienes cuenta?"
        withoutAccount?.textAlignment = .center
        withoutAccount?.font = UIFont.systemFont(ofSize: 10)
        withoutAccount?.textColor = .black
        withoutAccount?.backgroundColor = .clear
        withoutAccount?.center.x = self.view.center.x
        
        view.addSubview(withoutAccount!)
        
        
        registerButton = UIButton(frame: CGRect(x: 100, y: 515, width: 90, height: 20))
        registerButton?.setTitle("Regístrate", for: .normal)
        registerButton?.setTitleColor(UIColor.black, for: .normal)
        registerButton?.titleLabel!.font = UIFont.systemFont(ofSize: 10)
        registerButton?.backgroundColor = .clear
        registerButton?.center.x = self.view.center.x
        registerButton?.addTarget(self, action: #selector(goToRegistro), for: .touchUpInside)
        
        view.addSubview(registerButton!)
        
       /* if loginUserField.text == "" && loginPasswordField.text == "" {
            loginButton?.isEnabled = false
            } else {
                loginButton?.isEnabled = true
            } */
        
    }
    
    @objc func goToRegistro()
            {
                print("Boton Registro presionado")
                let registroOption = RegisterViewController()
                registroOption.modalPresentationStyle = .fullScreen
                present(registroOption, animated: true,completion:
                            {
                            print("Presentando View de Registro")
                            }   )
            }
    
    @objc func goToMain(_ sender: UIButton) {

                print("Boton Acceso presionado")
                let accesoOption = CatalogoViewController()
                accesoOption.modalPresentationStyle = .fullScreen
                present(accesoOption, animated: true,completion:
                            {
                            print("Presentando View de Catalogo")
                            }   )
        
            }
    
}

