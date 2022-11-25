import UIKit

final class ProfileCollectionViewCell: UICollectionViewCell {
    // MARK: - Static properties
 static let identifier = "profileCollectionViewCell"
    // MARK: - Private properties
    private let buttonView = UIButton()
    private let profileView = UIView()
    private let profileNameLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupProfileView()
        setupButtonView()
        setupProfileLabel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(profile: Profile) {
        buttonView.backgroundColor = profile.profileColor
        profileNameLabel.text = profile.profileName

        if let profileImage = profile.profilePicture {
            buttonView.setImage(UIImage(named: profileImage), for: .normal)}
    }

    // MARK: - Private func
    private func setupProfileLabel() {
        profileView.addSubview(profileNameLabel)
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileNameLabel.topAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 0),
            profileNameLabel.leftAnchor.constraint(equalTo: buttonView.leftAnchor, constant: 8),
            profileNameLabel.heightAnchor.constraint(equalToConstant: 30),
            profileNameLabel.widthAnchor.constraint(equalToConstant: 100)
        ])

    }

    private func setupProfileView() {
        addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 0),
            profileView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            profileView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            profileView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            profileView.heightAnchor.constraint(equalToConstant: 100),
            profileView.widthAnchor.constraint(equalToConstant: 100)
        ])
        profileView.backgroundColor = .clear

    }

    private func setupButtonView() {
        profileView.addSubview(buttonView)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonView.topAnchor.constraint(equalTo: profileView.topAnchor, constant: 10),
            buttonView.leadingAnchor.constraint(equalTo: profileView.leadingAnchor, constant: 10),
            buttonView.trailingAnchor.constraint(equalTo: profileView.trailingAnchor, constant: -10),
            buttonView.bottomAnchor.constraint(equalTo: profileView.bottomAnchor, constant: -10),
            buttonView.heightAnchor.constraint(equalToConstant: 90),
            buttonView.widthAnchor.constraint(equalToConstant: 90)
        ])
        buttonView.setImage(UIImage(systemName: "person"), for: .normal)
        buttonView.imageView?.tintColor = .white
        buttonView.layer.shadowColor = UIColor.gray.cgColor
        buttonView.layer.shadowOpacity = 0.9
        buttonView.layer.shadowOffset = .zero
        buttonView.layer.shadowRadius = 2
        buttonView.layer.cornerRadius = 40
        buttonView.imageView?.contentMode = .scaleAspectFill
        buttonView.clipsToBounds = true
    }
}
