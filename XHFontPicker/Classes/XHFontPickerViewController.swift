//
//  XHSelectFontViewController.swift
//  XHFontPicker
//
//  Created by 李小华 on 2021/2/3.
//

import UIKit

@objc public protocol XHFontPickerDelegate {
    func getFontName(fontName: String)
}

public class XHFontPickerViewController: UITableViewController {

    public weak var delegate: XHFontPickerDelegate?
    
    let cellID = "fontCell"
    
    var fontArray: [String]?
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        fontArray = UIFont.familyNames
    }

}


extension XHFontPickerViewController {
    // MARK: UITableViewDataSource
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontArray?.count ?? 0
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: cellID)
        }
        guard (fontArray) != nil else {
            return cell!
        }
        
        let fontName = fontArray![indexPath.row]
        cell!.textLabel?.text = fontName
        cell!.textLabel?.font = UIFont.init(name: fontName , size: 16)
        
        return cell!
    }
    
    // MARK: UITableViewDelegate
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard fontArray != nil else {
            return
        }
        delegate?.getFontName(fontName: fontArray![indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
}

