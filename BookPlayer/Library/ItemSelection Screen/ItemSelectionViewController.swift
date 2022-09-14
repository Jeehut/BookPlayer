//
//  ItemSelectionViewController.swift
//  BookPlayer
//
//  Created by Gianni Carlo on 12/7/18.
//  Copyright © 2018 Tortuga Power. All rights reserved.
//

import BookPlayerKit
import Themeable
import UIKit

class ItemSelectionViewController: UITableViewController {
    var items: [SimpleLibraryItem]!

    var onItemSelected: ((SimpleLibraryItem) -> Void)?

    override func viewDidLoad() {
        self.title = Loc.SelectItemTitle.string
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(self.didTapCancel))

        // Remove the line after the last cell
        self.tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.size.width, height: 1))
        self.tableView.register(UINib(nibName: "BookCellView", bundle: nil), forCellReuseIdentifier: "BookCellView")
        self.edgesForExtendedLayout = .bottom

        setUpTheming()
    }

    @objc func didTapCancel() {
        self.dismiss(animated: true, completion: nil)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      // swiftlint:disable force_cast
      let cell = tableView.dequeueReusableCell(withIdentifier: "BookCellView", for: indexPath) as! BookCellView

      let item = self.items[indexPath.row]

      cell.artworkView.kf.setImage(
        with: ArtworkService.getArtworkProvider(for: item.relativePath),
        placeholder: ArtworkService.generateDefaultArtwork(from: item.themeAccent),
        options: [.targetCache(ArtworkService.cache)]
      )

      cell.title = item.title
      cell.playbackState = .stopped
      cell.subtitle = item.details

      return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = self.items[indexPath.row]

        self.dismiss(animated: true) {
            self.onItemSelected?(item)
        }
    }
}

extension ItemSelectionViewController: Themeable {
    func applyTheme(_ theme: SimpleTheme) {
        self.view.backgroundColor = theme.systemBackgroundColor
        self.tableView.backgroundColor = theme.systemBackgroundColor
        self.tableView.separatorColor = theme.separatorColor
    }
}
