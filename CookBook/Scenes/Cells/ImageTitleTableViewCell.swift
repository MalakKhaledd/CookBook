//
//  ImageTitleTableViewCell.swift
//  CookBook
//
//  Created by Malak Badawy on 17/01/2022.
//

import UIKit

class ImageTitleTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView! {
        didSet {
            loadingIndicator.hidesWhenStopped = true
        }
    }
    
    // MARK: - Public Functions
    
    func configure(imageURL: URL?, title: String?) {
        if let imageURL = imageURL {
            loadingIndicator.startAnimating()
            thumbnailImageView.load(url: imageURL) { [weak self] in
                self?.loadingIndicator.stopAnimating()
            }
        }
        titleLabel.text = title
    }
}

extension UIImageView {
    func load(url: URL, completion: @escaping () -> Void) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                        completion()
                    }
                }
            }
        }
    }
}
