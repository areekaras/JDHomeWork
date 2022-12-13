//
//  JDTextField.swift
//  JetDevsHomeWork
//
//  Created by Shibili Areekara on 12/12/22.
//

import UIKit

class JDTextField: UIView {
    
    @IBOutlet private(set) weak var mainView: UIView!
    @IBOutlet private(set) weak var textFieldLabel: UILabel!
    @IBOutlet private(set) weak var textField: UITextField!
    
    var textFieldDidChange: ((String) -> Void)?
    var textFieldShouldReturn: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        commonInit()
    }
    
    private func commonInit() {
        let nibName = String(describing: JDTextField.self)
        Bundle.main.loadNibNamed(nibName, owner: self)
        addSubview(mainView)
        
        mainView.frame = bounds
        mainView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    func setTextFieldLabel(with text: String) {
        textFieldLabel.text = text
    }
    
    func setTextField(placeholder: String,
                      keyboardType: UIKeyboardType = .default,
                      secureEntry: Bool = false) {
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.isSecureTextEntry = secureEntry
    }
}

extension JDTextField: UITextFieldDelegate {
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        textFieldDidChange?(textField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textFieldShouldReturn?()
        return true
    }
}
