//
//  ViewController.swift
//  zashaminaPW1
//
//  Created by Zosya Shamina on 23.11.2023.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var views: [UIView]!
    @IBOutlet weak var button: UIButton!
    
    let numberOfViews = 3
    let animationSeconds = 0.5
    let cornerRadRange: Range<CGFloat> = 0.0..<25
    let colorRange: Range<CGFloat> = 0..<1
    let one: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeColors()
        changeCorners()
    }

    // MARK: Starts animation when button is pressed
    @IBAction func buttonWasPressed(_ sender: Any) {
        button.isEnabled = false
        UIView.animate(
            withDuration: animationSeconds,
            animations: {
                self.changeColors()
                self.changeCorners()
            },
            completion: { [weak self] _ in
                self?.button.isEnabled = true
            }
        )
    }
    
    // MARK: Function that changes corners of all views
    func changeCorners() {
        views.forEach {
            $0.layer.cornerRadius = .random(in: cornerRadRange)
        }
    }
    
    // MARK: Function that changes colors of all views
    func changeColors() {
        var setOfColors = Set<UIColor>()
        while setOfColors.count < numberOfViews {
            setOfColors.insert(
                UIColor(
                    red: .random(in: colorRange),
                    green: .random(in: colorRange),
                    blue: .random(in: colorRange),
                    alpha: one
                )
            )
        }
        views.forEach {
            $0.backgroundColor = setOfColors.popFirst()
        }
    }
}

