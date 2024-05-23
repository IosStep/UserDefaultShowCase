//
//  ViewController3.swift
//  UserDefaultsShowCase
//
//  Created by Aldiyar Aitpayev on 18.05.2024.
//

import UIKit
import SnapKit

class ViewController3: UIViewController {
    
    private lazy var avatarButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "person.circle"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)

//        button.imageView?.contentMode = .scaleToFill
        button.tintColor = .darkGray
        return button
    }()
    
    var services: [ServiceModel] = [
        ServiceModel(name: "Чистка зубов", iconName: "bell"),
        ServiceModel(name: "Пломбирование зубов", iconName: "bell"),
        ServiceModel(name: "Чистка зубов", iconName: "bell"),
        ServiceModel(name: "Пломбирование зубов", iconName: "bell"),
        ServiceModel(name: "Чистка зубов", iconName: "bell"),
        ServiceModel(name: "Пломбирование зубов", iconName: "bell"),
        ServiceModel(name: "Чистка зубов", iconName: "bell"),
        ServiceModel(name: "Пломбирование зубов", iconName: "bell")
    ]
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.dataSource = self
        collection.delegate = self
        collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        view.addSubview(avatarButton)
        
        avatarButton.snp.makeConstraints { make in
            make.leading.top.equalToSuperview().inset(16)
            make.width.height.equalTo(80)
        }
        
//        collectionView.snp.makeConstraints { make in
//            
//            make.edges.equalToSuperview()
//        }
    }
}

extension ViewController3: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return services.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configure(services[indexPath.row])
        return cell
    }
}


struct ServiceModel {
    var name: String
    var iconName: String
}
