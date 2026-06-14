//
    // Project: UIKitAnimationsExample
    //  File: PropertyAnimatorViewController.swift
    //  Created by Noah Carpenter
    //  🐱 Follow me on YouTube! 🎥
    //  https://www.youtube.com/@noahdoescoding
    //  Like and Subscribe for coding tutorials and fun! 💻✨
    //  Fun Fact: Cats have five toes on their front paws, but only four on their back paws! 🐾
    //  Dream Big, Code Bigger
    


import UIKit

class PropertyAnimatorViewController: UIViewController {
    let animatedView = UIView()
    var animator: UIViewPropertyAnimator?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    func setupView() {
        animatedView.frame = CGRect(x: 100, y: 300, width: 150, height: 150)
        animatedView.backgroundColor = .red
        view.addSubview(animatedView)

        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan))
        animatedView.addGestureRecognizer(panGesture)
    }

    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let progress = gesture.translation(in: view).x / view.bounds.width

        switch gesture.state {
        case .began:
            animator = UIViewPropertyAnimator(duration: 1.0, curve: .easeInOut, animations: {
                self.animatedView.transform = CGAffineTransform(rotationAngle: .pi)
            })
            animator?.pauseAnimation() // ✅ Start paused
        case .changed:
            animator?.fractionComplete = abs(progress) // ✅ Control progress dynamically
        case .ended:
            animator?.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        default:
            break
        }
    }
}