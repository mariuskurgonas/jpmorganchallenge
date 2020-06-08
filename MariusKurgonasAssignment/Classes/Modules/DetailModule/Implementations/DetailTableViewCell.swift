//
//  DetailTableViewCell.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    let webService = AlamofireGenericDetailService()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(keyPath: String, urlString: String) {
        webService.cancel()
        textLabel?.text = "Receiving..."
        webService.getDetails(urlString: urlString) { [weak self] json, _ in
            if let json = json {
                self?.textLabel?.text = json[keyPath] as? String
            }
            else {
                // TODO: Handle error
            }
        }
    }
}
