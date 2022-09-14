//
//  BulkControlsView.swift
//  BookPlayer
//
//  Created by Gianni Carlo on 1/18/19.
//  Copyright © 2019 Tortuga Power. All rights reserved.
//

import UIKit

class BulkControlsView: NibLoadableView {
    @IBOutlet weak var sortButton: UIButton!
    @IBOutlet weak var moveButton: UIButton!
    @IBOutlet weak var trashButton: UIButton!
    @IBOutlet weak var moreButton: UIButton!

    var onSortTap: (() -> Void)?
    var onMoveTap: (() -> Void)?
    var onDeleteTap: (() -> Void)?
    var onMoreTap: (() -> Void)?

  override func awakeFromNib() {
    super.awakeFromNib()

    self.sortButton.accessibilityLabel = Loc.SortTitle.string
    self.moveButton.accessibilityLabel = Loc.MoveTitle.string
    self.trashButton.accessibilityLabel = Loc.DeleteButton.string
    self.moreButton.accessibilityLabel = Loc.OptionsButton.string
  }

    @IBAction func didPressSort(_ sender: UIButton) {
        self.onSortTap?()
    }

    @IBAction func didPressMove(_ sender: UIButton) {
        self.onMoveTap?()
    }

    @IBAction func didPressDelete(_ sender: UIButton) {
        self.onDeleteTap?()
    }

    @IBAction func didPressMore(_ sender: UIButton) {
        self.onMoreTap?()
    }
}
