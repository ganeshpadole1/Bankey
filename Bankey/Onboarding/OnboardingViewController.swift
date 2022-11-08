//
//  OnboardingViewController.swift
//  Bankey
//
//  Created by Ganesh on 07/11/22.
//

import UIKit

class OnboardingViewController: UIViewController {

    let stackView = UIStackView()
    let imageView = UIImageView()
    let label = UILabel()
    let heroImageName: String
    let titleText: String

    override func viewDidLoad() {
        super.viewDidLoad()

        style()
        layout()
    }

    init(heroImageView: String, titleLabel: String) {
        self.heroImageName = heroImageView
        self.titleText = titleLabel

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OnboardingViewController {

    private func style() {
        view.backgroundColor = .systemBackground // ! dont forget

        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10

        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: heroImageName)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true

        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .title3)
        label.adjustsFontForContentSizeCategory = true
        label.numberOfLines = 0
        label.text = titleText
    }

    private func layout() {

        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(label)
        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1)
        ])
    }
}
