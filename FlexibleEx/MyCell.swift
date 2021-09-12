//
//  MyCell.swift
//  FlexibleEx
//
//  Created by 김종권 on 2021/09/12.
//

import UIKit

class MyCell: UITableViewCell {

    static let reuseIdentifier = String(describing: self)

    let labelContainerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical

        return view
    }()

    let firstLabel: UILabel = {
        let l = UILabel()
        l.text = "first label"
        l.textColor = .black

        return l
    }()

    let secondLabel: UILabel = {
        let l = UILabel()
        l.text = "second label"
        l.textColor = .black

        return l
    }()

    let imageContainerView: UIView = {
        let view = UIView()

        return view
    }()

    let hiddenImageView: UIImageView = {
        let view = UIImageView(image: #imageLiteral(resourceName: "btnStarRateOn"))

        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init?(coder: NSCoder) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        updateSelectedCell(selected)
    }

    private func configure() {
        setupViews()
        addSubiews()
        makeConstraints()
    }

    private func setupViews() {
        selectionStyle = .none
        imageContainerView.isHidden = true
    }

    private func addSubiews() {
        contentView.addSubview(labelContainerStackView)
        imageContainerView.addSubview(hiddenImageView)
        [firstLabel, secondLabel, imageContainerView].forEach { label in
            labelContainerStackView.addArrangedSubview(label)
        }
    }

    private func makeConstraints() {
        labelContainerStackView.translatesAutoresizingMaskIntoConstraints = false
        hiddenImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            labelContainerStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            labelContainerStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            labelContainerStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            labelContainerStackView.topAnchor.constraint(equalTo: contentView.topAnchor),

            imageContainerView.heightAnchor.constraint(equalToConstant: hiddenImageView.intrinsicContentSize.height),

            hiddenImageView.centerYAnchor.constraint(equalTo: imageContainerView.centerYAnchor),
            hiddenImageView.centerXAnchor.constraint(equalTo: imageContainerView.centerXAnchor),
        ])

        firstLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
        secondLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
    }

    private func updateSelectedCell(_ selected: Bool) {
        imageContainerView.isHidden = !selected
    }
}
