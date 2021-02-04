//
//  ViewController.swift
//  XHFontPicker
//
//  Created by Lxh93 on 02/03/2021.
//  Copyright (c) 2021 Lxh93. All rights reserved.
//

import UIKit
import XHFontPicker

class ViewController: UIViewController {

    @IBOutlet weak var fontNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func selectFont() {
        
        let xhSelectFont = XHFontPickerViewController()
        xhSelectFont.delegate = self
        self.present(xhSelectFont, animated: true, completion: nil)
    }
    
}

extension ViewController: XHFontPickerDelegate {
    func getFontName(fontPickerController: XHFontPickerViewController, fontName: String) {
        fontNameLabel.font = UIFont.init(name: fontName, size: 16)
    }
}
