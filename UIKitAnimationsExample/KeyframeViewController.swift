//
    // Project: UIKitAnimationsExample
    //  File: KeyframeViewController.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    


import UIKit

class KeyframeViewController: UIViewController {
    let animatedButton = UIButton(type: .system)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButton()
    }

    func setupButton() {
        animatedButton.setTitle("Tap Me!", for: .normal)
        animatedButton.frame = CGRect(x: 100, y: 300, width: 120, height: 50)
        animatedButton.addTarget(self, action: #selector(startAnimation), for: .touchUpInside)
        view.addSubview(animatedButton)
    }

    @objc func startAnimation() {
        UIView.animateKeyframes(withDuration: 1.5, delay: 0, options: [], animations: {
            // ✅ Move button slightly up
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                self.animatedButton.transform = CGAffineTransform(translationX: 0, y: -50)
            }
            // ✅ Move button back down
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.4) {
                self.animatedButton.transform = CGAffineTransform.identity
            }
            // ✅ Small bounce effect
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.3) {
                self.animatedButton.transform = CGAffineTransform(translationX: 0, y: -10)
            }
        }, completion: nil)
    }
}