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
                usuarioTextField.leadingAssistiveLabel.text = "*Usuario invalido. Ingrese mínimo 8 caracteres alfanuméricos."
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
                correoTextField.leadingAssistiveLabel.text = "*Ingrese un correo electrónico válido."
            }else{
                correoTextField.leadingAssistiveLabel.text = ""
            }
        
        }
        

        let contraseñaTextField = MDCOutlinedTextField(frame: CGRect(x: 0, y: 285, width: 310, height: 10))
        contraseñaTextField.center.x = self.view.center.x
        contraseñaTextField.label.text = "Contraseña"
        contraseñaTextField.placeholder = "1AX123-cw@"
        contraseñaTextField.font = UIFont.systemFont(ofSize: 11)
        contraseñaTextField.textAlignment = NSTextAlignment.left
        contraseñaTextField.keyboardType = UIKeyboardType.default
        contraseñaTextField.autocorrectionType = UITextAutocorrectionType.no
        contraseñaTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        contraseñaTextField.isSecureTextEntry = true
        contraseñaTextField.leadingAssistiveLabel.font = UIFont.systemFont(ofSize: 10)
        contraseñaTextField.leadingAssistiveLabel.text = "*Campo obligatorio"
        contraseñaTextField.sizeToFit()
        self.view.addSubview(contraseñaTextField)
        contraseñaTextField.validationRules = [
            StringRegexRule(regex: "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)(?=.*[$@$!%*?&#])[A-Za-z\\d$@$!%*?&#]{8,15}")
        ]
        
        contraseñaTextField.validateOnInputChange(true)
        
        contraseñaTextField.validationHandler = { result in
            print(result.status, result.errors)
            
            if result.status == .failure{
                contraseñaTextField.leadingAssistiveLabel.text = "*Contraseña inválida. Ingrese mínimo 8 caracteres, debe contener al menos 1 mayúscula, 1 minúscula, 1 caracter especial y 1 número."
            }else{
                contraseñaTextField.leadingAssistiveLabel.text = ""
            }
            
        }
        
        
        let confirmarTextField = MDCOutlinedTextField(frame: CGRect(x: 0, y: 365, width: 310, height: 10))
        confirmarTextField.center.x = self.view.center.x
        confirmarTextField.label.text = "Confirmar Contraseña"
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
            StringValueMatchRule(base: contraseñaTextField)
        ]
        
        confirmarTextField.validateOnInputChange(true)
        
        confirmarTextField.validationHandler = { result in
            print(result.status, result.errors)
            
            if result.status == .failure{
                confirmarTextField.leadingAssistiveLabel.text = "*Las contraseñas no coinciden"
            }else{
                confirmarTextField.leadingAssistiveLabel.text = "Las contraseñas coinciden"
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
