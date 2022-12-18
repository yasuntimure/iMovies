//
//  HomeTableViewCell.swift
//  iMovies
//
//  Created by Eyüp Yasuntimur on 18.12.2022.
//

import Foundation
import UIKit
import Combine

struct HomeCellViewModel {
    var question: QuestionModel?
    var index: Int
    var answerDecimal: Double?
}

class HomeCell: UITableViewCell, ViewProtocol, ReuseIdentifying {

    @Published internal var viewModel: HomeCellViewModel?

    private var subscribers = Set<AnyCancellable>()

    public var onAddButtonsOnKeyboard: (() -> Void)?
    public var onValueChange: ((_ value: Double) -> Void)?
    public var onTextFieldShouldEndEditing: ((_ value: Double) -> Void)?

    lazy var decimalTextField: UITextField = {
        let textField = UITextField()
        textField.textColor = ThemeColors.charcoalGrey
        textField.font = ThemeManager.Font.Roman.font(size: .medium)
        textField.layer.cornerRadius = 17.5
        textField.layer.borderColor = ThemeColors.veryLightPink4.cgColor
        textField.layer.borderWidth = 1
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        return textField
    }()

    lazy var minimumLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Minimum: 5", comment: "")
        label.textColor = ThemeColors.blueyGrey
        label.font = ThemeManager.Font.Roman.font(size: .smallmedium)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()

    lazy var maximumLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("Maximum: 50", comment: "")
        label.textColor = ThemeColors.blueyGrey
        label.font = ThemeManager.Font.Roman.font(size: .smallmedium)
        label.numberOfLines = 0
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.registerObservers()
        self.configureContents()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup() {
        contentView.addSubviews([decimalTextField, minimumLabel, maximumLabel])
        decimalTextField.delegate = self
        decimalTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    func setConstraints() {
        [contentView, decimalTextField, minimumLabel, maximumLabel]
            .forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

        NSLayoutConstraint.activate([
            contentView.heightAnchor.constraint(equalToConstant: 150),

            decimalTextField.heightAnchor.constraint(equalToConstant: 45),
            decimalTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            decimalTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            decimalTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -14),

            minimumLabel.leadingAnchor.constraint(equalTo: decimalTextField.leadingAnchor),
            minimumLabel.topAnchor.constraint(equalTo: decimalTextField.bottomAnchor, constant: 28),

            maximumLabel.leadingAnchor.constraint(equalTo: minimumLabel.trailingAnchor, constant: 34),
            maximumLabel.centerYAnchor.constraint(equalTo: minimumLabel.centerYAnchor)
        ])
    }

    func configureView(_ viewModel: HomeCellViewModel?) {
        guard let viewModel = viewModel,
              let questionValue = viewModel.question else { return }

        let index = viewModel.index

        if let answerDecimal = viewModel.answerDecimal {
            self.decimalTextField.text = String(answerDecimal.toInt)
        }

        let anyAnswer: Any? = questionValue.answer?.df2so()
        if anyAnswer == nil {
            self.decimalTextField.placeholder = "enter_value".localized()
        } else {
            self.decimalTextField.text = questionValue.answer
        }

        if let maxValue = questionValue.maxValue, let minValue = questionValue.minValue {
            self.minimumLabel.text = String(format: "%@:%@", "min_value".localized(), "\(minValue)")
            self.maximumLabel.text = String(format: "%@:%@", "max_value".localized(), "\(maxValue)")
        } else {
            self.minimumLabel.isHidden = true
            self.maximumLabel.isHidden = true
        }

        self.decimalTextField.tag = index

        self.onAddButtonsOnKeyboard?()
    }

    func registerObservers() {
        $viewModel.sink { model in
            self.configureView(model)
        }.store(in: &subscribers)
    }

    func adjustBorderColor(for value: Double) {
        guard let minValue = viewModel?.question?.minValue,
              let maxValue = viewModel?.question?.maxValue else { return }
        decimalTextField.layer.borderColor = (value < minValue || value > maxValue) ? UIColor.red.cgColor : ThemeColors.veryLightPink4.cgColor
    }

}

extension HomeCell: UITextFieldDelegate {
    @objc
    func textFieldDidChange(textField: UITextField) {
        if let text = textField.text,
           let value = text.toDouble() {
            self.onValueChange?(value)
            self.adjustBorderColor(for: value)
        }
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if let text = textField.text,
           let value = text.toDouble() {
            self.onTextFieldShouldEndEditing?(value)
            self.adjustBorderColor(for: value)
        }
        return true
    }
}

struct DecimalRGAnswerCellRepresentable: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = HomeCell()
        view.decimalTextField.text = "Deneme"
        return view
    }

    func updateUIView(_ view: UIView, context: Context) { }
}

struct DecimalRGAnswerCellPreview: PreviewProvider {
    static var previews: some View {
        DecimalRGAnswerCellRepresentable().previewLayout(.fixed(width: 480, height: 150))
    }
}


