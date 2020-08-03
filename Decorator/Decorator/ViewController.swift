//
//  ViewController.swift
//  Decorator
//
//  Created by Bathi Babu on 03/08/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tagButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagButton.decorate(with: [CornerRadiusDecorator(radius: 6),TagViewDecorator(tag: 3)])
    }
}


protocol ButtonDecorator {
    
    func decorate(view: UIView)
}

extension UIView {
    
    func decorate(with decorator: ButtonDecorator) {
        decorator.decorate(view: self)
    }
    
    func decorate(with decorators: [ButtonDecorator]) {
        decorators.forEach { $0.decorate(view: self) }
    }
}

struct CornerRadiusDecorator: ButtonDecorator {
    
    let radius: CGFloat
    func decorate(view: UIView) {
        
        view.layer.cornerRadius = radius
    }
}

struct TagViewDecorator: ButtonDecorator {
    
    let tag: CGFloat
    func decorate(view: UIView) {

        let tagRect = CGRect(x: view.frame.size.width - 15, y: -15, width: 30, height: 30)
        let v = UILabel(frame: tagRect)
        v.backgroundColor = UIColor.red
        v.layer.cornerRadius = 15
        v.layer.masksToBounds = true
        v.textColor = UIColor.white
        v.textAlignment = .center
        v.text = String(describing: tag)
        v.layer.borderWidth = 2
        v.layer.borderColor = UIColor.white.cgColor
        v.font = UIFont.systemFont(ofSize: 12)
        view.addSubview(v)
    }
}


