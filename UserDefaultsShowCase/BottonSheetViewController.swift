import UIKit

class BottonSheetViewController: UIViewController {
    
    var height: Int?
    var saveAction: ((String) -> ())?
    
    lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        return view
    }()
    
    lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "some text"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    lazy var textField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "insert text"
        textfield.borderStyle = .roundedRect
        textfield.addTarget(self, action: #selector(textEntered), for: .allEditingEvents)
        return textfield
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func saveTapped() {
        saveAction?(textField.text ?? "")
        dismiss(animated: true)
    }
    
    @objc func textEntered() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(whiteView)
        whiteView.addSubview(textLabel)
        whiteView.addSubview(textField)
        whiteView.addSubview(saveButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        whiteView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(height ?? 300)
        }
        
        textField.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview().inset(16)
            make.height.equalTo(40)
        }
        
        saveButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(textField.snp.bottom).offset(4)
            make.height.equalTo(40)
        }
    }
}
