//
//  RegisterViewController.swift
//  MyLibraryProject
//
//  Created by Adriana Limon on 1/28/22.
//

import UIKit
import MaterialComponents.MaterialTextControls_OutlinedTextFields
import MaterialComponents
import ATGValidator

class RegisterViewController: UIViewController {

    var returnButton : UIButton?
    var returnLabel : UILabel?
    var pasosLabel : UILabel?
    var createButton : UIButton?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        initUI()
    }
    
    func initUI(){
        
        let usuarioTextField = MDCOutlinedTextField(frame: CGRect(x: 0, y: 125, width: 310, height: 10))
        //usuarioTextField.applyTheme(withScheme: self.)
        usuarioTextField.center.x = self.view.center.x
        usuarioTextField.label.text = "Usuario"
        usuarioTextField.placeholder = "FerLima"
        usuarioTextField.font = UIFont.systemFont(ofSize: 11)
        usuarioTextField.textAlignment = NSTextAlignment.left
        usuarioTextField.keyboardType = UIKeyboardType.default
        usuarioTextField.autocorrectionType = UITextAutocorrectionType.no
        usuarioTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        usuarioTextField.leadingAssistiveLabel.text = "*Campo obligatorio"
        usuarioTextField.leadingAssistiveLabel.font = UIFont.systemFont(ofSize: 10)
        usuarioTextField.sizeToFit()
        self.view.addSubview(usuarioTextField)
        usuarioTextField.validationRules = [
            CharacterSetRule.containsUpperCase(),
            CharacterSetRule.containsLowerCase(),
            //CharacterSetRule.containsNumber(),
            StringLengthRule.min(8)
        ]
        
        usuarioTextField.validateOnInputChange(true)
        
        usuarioTextField.validationHandler = { result in
            print(result.status, result.errors)
            
            if result.status == .failure{
                usuarioTextField.leadingAssistiveLabel.text = "*Usuario invalido. Ingrese m??nimo 8 caracteres alfanum??ricos."
            }else{
                usuarioTextField.leadingAssistiveLabel.text = ""
            }
        }
            
    
        let correoTextField = MDCOutlinedTextField(frame: CGRect(x: 0, y: 205, width: 310, height: 10))
        correoTextField.center.x = self.view.center.x
        correoTextField.label.text = "Correo"
        correoTextField.placeholder = "example@example.com"
        correoTextField.font = UIFont.systemFont(ofSize: 11)
        correoTextField.textAlignment = NSTextAlignment.left
        correoTextField.keyboardType = UIKeyboardType.default
        correoTextField.autocorrectionType = UITextAutocorrectionType.no
        correoTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        correoTextField.leadingAssistiveLabel.text = "*Campo obligatorio"
        correoTextField.leadingAssistiveLabel.font = UIFont.systemFont(ofSize: 10)
        correoTextField.sizeToFit()
        self.view.addSubview(correoTextField)
        correoTextField.validationRules = [
            StringRegexRule(regex: "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        ]
        
        correoTextField.validateOnInputChange(true)
        
        correoTextField.validationHandler = { result in
            print(result.status, result.errors)
        
            if result.status == .failure{
                correoTextField.leadingAssistiveLabel.text = "*Ingrese un correo electr??nico v??lido."
            }else{
                correoTextField.leadingAssistiveLabel.text = ""
            }
        
        }
        

        let contrase??aTextField = MDCOutlinedTextField(frame: CGRect(x: 0, y: 285, width: 310, height: 10))
        contrase??aTextField.center.x = self.view.center.x
        contrase??aTextField.label.text = "Contrase??a"
        contrase??aTextField.placeholder = "1AX123-cw@"
        contrase??aTextField.font = UIFont.systemFont(ofSize: 11)
        contrase??aTextField.textAlignment = NSTextAlignment.left
        contrase??aTextField.keyboardType = UIKeyboardType.default
        contrase??aTextField.autocorrectionType = UITextAutocorrectionType.no
        contrase??aTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        contrase??aTextField.isSecureTextEntry = true
        contrase??aTextField.leadingAssistiveLabel.font = UIFont.systemFont(ofSize: 10)
        contrase??aTextField.leadingAssistiveLabel.text = "*Campo obligatorio"
        contrase??aTextField.sizeToFit()
        self.view.addSubview(contrase??aTextField)
        contrase??aTextField.validationRules = [
            StringRegexRule(regex: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,15}")
        ]
        
        contrase??aTextField.validateOnInputChange(true)
        
        contrase??aTextField.validationHandler = { result in
            print(result.status, result.errors)
            
            if result.status == .failure{
                contrase??aTextField.leadingAssistiveLabel.text = "*Contrase??a inv??lida. Ingrese m??nimo 8 caracteres, debe contener al menos 1 may??scula, 1 min??scula, 1 caracter especial y 1 n??mero."
            }else{
                contrase??aTextField.leadingAssistiveLabel.text = ""
            }
            
        }
        
        
        let confirmarTextField = MDCOutlinedTextField(frame: CGRect(x: 0, y: 365, width: 310, height: 10))
        confirmarTextField.center.x = self.view.center.x
        confirmarTextField.label.text = "Confirmar Contrase??a"
        confirmarTextField.placeholder = "1AX123-cw@"
        confirmarTextField.font = UIFont.systemFont(ofSize: 11)
        confirmarTextField.textAlignment = NSTextAlignment.left
        confirmarTextField.keyboardType = UIKeyboardType.default
        confirmarTextField.autocorrectionType = UITextAutocorrectionType.no
        confirmarTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        confirmarTextField.leadingAssistiveLabel.font = UIFont.systemFont(ofSize: 10)
        confirmarTextField.isSecureTextEntry = true
        confirmarTextField.leadingAssistiveLabel.text = "*Campo obligatorio"
        confirmarTextField.sizeToFit()
        self.view.addSubview(confirmarTextField)
        confirmarTextField.validationRules = [
            StringValueMatchRule(base: contrase??aTextField)
        ]
        
        confirmarTextField.validateOnInputChange(true)
        
        confirmarTextField.validationHandler = { result in
            print(result.status, result.errors)
            
            if result.status == .failure{
                confirmarTextField.leadingAssistiveLabel.text = "*Las contrase??as no coinciden"
            }else{
                confirmarTextField.leadingAssistiveLabel.text = "Las contrase??as coinciden"
            }
            
        }
        
        
        returnButton = UIButton(frame: CGRect(x: 10, y: 50, width: 25, height: 25))
        returnButton?.setImage(UIImage(named: "backButton"), for: .normal)
        returnButton?.addTarget(self, action: #selector(irAtras), for: .touchUpInside)
        
        view.addSubview(returnButton!)
        
        
        returnLabel = UILabel(frame: CGRect(x: 45, y: 45, width: width, height: 35))
        returnLabel?.text = "Regresar"
        returnLabel?.font = UIFont.systemFont(ofSize: 18)
        returnLabel?.textColor = .black
        returnLabel?.backgroundColor = .clear
        
        view.addSubview(returnLabel!)
        
        
        pasosLabel = UILabel(frame: CGRect(x: 15, y: 80, width: width, height: 35))
        pasosLabel?.text = "Estas a unos cuantos pasos de vivir la mejor experiencia"
        pasosLabel?.numberOfLines = 0
        pasosLabel?.sizeToFit()
        pasosLabel?.lineBreakMode = .byWordWrapping
        pasosLabel?.textAlignment = .left
        pasosLabel?.font = UIFont.systemFont(ofSize: 12)
        pasosLabel?.textColor = .black
        pasosLabel?.backgroundColor = .clear
        
        view.addSubview(pasosLabel!)
        
        
        createButton = UIButton(frame: CGRect(x: 0, y: 510, width: 280, height: 50))
        createButton?.backgroundColor = UIColor.black
        createButton?.setTitle("Crear Cuenta", for: .normal)
        createButton?.setTitleColor(UIColor.white, for: .normal)
        createButton?.titleLabel!.font = UIFont.systemFont(ofSize: 18)
        createButton?.center.x = self.view.center.x
        createButton?.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        createButton?.layer.cornerRadius = 10
        
        view.addSubview(createButton!)
}
    
    
    @objc func irAtras()
        {
            print("back action")
            dismiss(animated:true)
        }
    
    @objc func goToLogin()
            {
                print("Boton Create presionado")
                let accesoOption = ViewController()
                accesoOption.modalPresentationStyle = .fullScreen
                present(accesoOption, animated: true,completion:
                            {
                            print("Cuenta creada")
                            }   )
            }
}
