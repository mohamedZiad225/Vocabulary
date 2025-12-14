//
//  MultipleSelectionView.swift
//  Vocabulary
//
//  Created by Mohamed Ziad on 13/12/2025.
//

import UIKit

final class MultipleSelectionView: UIView {

    // MARK: - Outlets
    @IBOutlet private weak var questionLabel: UILabel!
    @IBOutlet private weak var selectionTableView: UITableView!

    // MARK: - Properties
    private var uiModel: MultipleSelectionUIModel?
    var didSelectItem: ((SelectionUIModel) -> Void)?

     var selectionData: [SelectionUIModel] = [] {
        didSet {
            if oldValue != selectionData {
                selectionTableView.reloadData()
            }
        }
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadFromNib()
        commonInit()
    }

    // MARK: - Setup
    private func commonInit() {
        setupTableView()
        questionLabel.font = UIFont.systemFont(ofSize: 32, weight: .bold)
    }

    private func loadFromNib() {
        let nib = UINib(nibName: "MultipleSelectionView", bundle: nil)
        let contentView = nib.instantiate(withOwner: self).first as! UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }

    private func setupTableView() {
        selectionTableView.delegate = self
        selectionTableView.dataSource = self

        selectionTableView.register(
            UINib(nibName: "SelectionTableViewCell", bundle: nil),
            forCellReuseIdentifier: "SelectionTableViewCell"
        )
        selectionTableView.separatorStyle = .none
    }

    // MARK: - Public API
    func configure(_ model: MultipleSelectionUIModel) {
        self.uiModel = model
        questionLabel.text = model.questionText
        selectionData = model.selectionData
    }
}
