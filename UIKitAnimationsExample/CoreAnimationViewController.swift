//
    // Project: UIKitAnimationsExample
    //  File: CoreAnimationViewController.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@NoahDoesCoding97
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    


import UIKit

class CoreAnimationViewController: UIViewController {
    let glowingView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        startPulsingAnimation()
    }

    func setupView() {
        glowingView.frame = CGRect(x: 100, y: 300, width: 100, height: 100)
        glowingView.layer.cornerRadius = 50
        glowingView.backgroundColor = .systemBlue
        view.addSubview(glowingView)
    }

    func startPulsingAnimation() {
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.toValue = 1.2
        pulseAnimation.duration = 0.8
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = .infinity
        glowingView.layer.add(pulseAnimation, forKey: "pulse")
    }
}