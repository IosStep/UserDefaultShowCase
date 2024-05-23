//
//  ViewController2.swift
//  UserDefaultsShowCase
//
//  Created by Aldiyar Aitpayev on 18.05.2024.
//

import UIKit

class ViewController2: UIViewController {
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Tap me", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func buttonTapped() {
        let vc = BottonSheetViewController()
        vc.height = 400
        vc.saveAction = { text in
            self.button.setTitle(text, for: .normal)
        }
        present(vc, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
