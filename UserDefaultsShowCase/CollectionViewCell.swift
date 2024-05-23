import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CollectionViewCell"
    
    lazy var whiteView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var iconImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(whiteView)
        whiteView.addSubview(iconImage)
        whiteView.addSubview(nameLabel)
        whiteView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        iconImage.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(40)
            make.height.equalTo(55)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(iconImage.snp.bottom).offset(4)
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(16)
        }
    }
    func configure(_ service: ServiceModel) {
        iconImage.image = UIImage(systemName: service.iconName)
        nameLabel.text = service.iconName
    }
    
}
