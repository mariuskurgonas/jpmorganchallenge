//
//  MasterTableViewCell.swift
//  MariusKurgonasAssignment
//
//  Created by Marius Kurgonas on 06/06/2019.
//  Copyright © 2019 Marius Kurgonas. All rights reserved.
//

import UIKit

class MasterTableViewCell: UITableViewCell {
    let webService = AlamofireGenericDetailService()

    @IBOutlet var homeworldLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var favSwitch: UISwitch!

    var delegate: MasterTableViewCellDelegate?

    var person: Person?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configWith(person: Person) {
        nameLabel.text = person.name
        heightLabel.text = person.height
        dobLabel.text = person.dob
        favSwitch.isOn = person.isFavourite

        webService.cancel()
        homeworldLabel?.text = "Receiving..."
        webService.getDetails(urlString: person.homeWorld) { [weak self] json, _ in
            if let json = json {
                self?.homeworldLabel?.text = json["name"] as? String
            }
            else {
                // TODO: Handle error
            }
        }
    }

    @IBAction private func favouriteChanged(_ sender: UISwitch) {
        if sender.isOn {
            delegate?.didFavourite(personName: nameLabel.text!)
        }
        else {
            delegate?.didUnfavourite(personName: nameLabel.text!)
        }

        person?.isFavourite = sender.isOn
    }
}
