//
//  XHSelectFontViewController.swift
//  XHFontPicker
//
//  Created by 李小华 on 2021/2/3.
//

import UIKit

@objc public protocol XHFontPickerDelegate {
    func getFontName(fontPickerController: XHFontPickerViewController, fontName: String)
}

public class XHFontPickerViewController: UITableViewController {

    public weak var delegate: XHFontPickerDelegate?
    
    let cellID = "fontCell"
    
    var fontArray: [String] = []
    
    public override func viewDidLoad() {
        super.viewDidLoad()

        fontArray = Array.init()
        let fys = UIFont.familyNames
        for fy in fys {
            let fts = UIFont.fontNames(forFamilyName: fy)
            for ft in fts {
                fontArray.append(ft)
            }
        }
    }

}


extension XHFontPickerViewController {
    // MARK: UITableViewDataSource
    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fontArray.count
    }
    
    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell.init(style: .value1, reuseIdentifier: cellID)
        }
        
        let fontName = fontArray[indexPath.row]
        cell!.textLabel?.text = fontName
        cell!.textLabel?.font = UIFont.init(name: fontName , size: 16)
        
        return cell!
    }
    
    // MARK: UITableViewDelegate
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.getFontName(fontPickerController: self, fontName: fontArray[indexPath.row])
        self.dismiss(animated: true, completion: nil)
    }
}

