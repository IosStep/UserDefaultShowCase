import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name will be here"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "insert name"
        return textfield
    }()
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func saveTapped() {
////        saveName()
//        saveNameToArray()
//        textField.text = ""
////        getUserName()
//        getUserNames()
        navigationController?.pushViewController(ViewController3(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        getUserName()
        getUserNames()
        setupViews()
        
    }
    
    private func setupViews()  {
        view.backgroundColor = .white
        view.addSubview(nameLabel)
        view.addSubview(textField)
        view.addSubview(button)
        setupConstraints()
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(16)
            make.top.equalToSuperview().inset(60)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.height.equalTo(30)
        }
        
        button.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(90)
            make.height.equalTo(40)
        }
    }
    
    private func getUserName() {
        let name = UserDefaults.standard.string(forKey: "UserName")
        if let name = name, !name.isEmpty {
            nameLabel.text = name
        }
    }
    
    private func saveName() {
        if let name = textField.text, !name.isEmpty {
            UserDefaults.standard.setValue(name, forKey: "UserName")
            print("\(name) is saved to userDefaults")
        }
    }
    
    private func saveNameToArray() {
        guard let name = textField.text, !name.isEmpty else {
            print("no name")
            return
        }
        let names = UserDefaults.standard.array(forKey: "UserNames") as? [String]
        
        if var names = names {
            names.append(name)
            UserDefaults.standard.setValue(names, forKey: "UserNames")
            print("\(names) is saved to userDefaults")
        }else {
            UserDefaults.standard.setValue([name], forKey: "UserNames")
            print("\([name]) is saved to userDefaults")
        }
        
    }
    
    private func getUserNames() {
        let names = UserDefaults.standard.array(forKey: "UserNames") as? [String]
        if let names = names, !names.isEmpty {
            nameLabel.text = names.joined(separator: ", ")
        }
    }
    
    
}
