

import UIKit
struct AnimationManager {
    
    static func buttonPressAnimation(sender: UIView) {
        UIView.animate(withDuration: 0.1,
                       animations: {
            sender.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        },
                       completion: { _ in
            UIView.animate(withDuration: 0.1) {
                sender.transform = CGAffineTransform.identity
            }
        })
    }
    
    static func textChangeAnimation(sender: UILabel, newValue: Int) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.type = CATransitionType.fade
        animation.subtype = CATransitionSubtype.fromTop
        sender.text = String(newValue)
        animation.duration = 0.25
        sender.layer.add(animation, forKey: CATransitionType.fade.rawValue)
    }
}

struct DynamicConstraintsManager {
    
    private let screenWidth = UIScreen.main.bounds.width
    private let screenHeight = UIScreen.main.bounds.height
    private let designScreenWidth = 414
    private let designScreenHeight = 896
    
    func constraintPortrait(_ designConstraint: Int) -> CGFloat {
        CGFloat((designConstraint * Int(screenWidth)) / designScreenWidth)
    }
    
    func constraintLandscape(_ designConstraint: Int) -> CGFloat {
        CGFloat((designConstraint * Int(screenHeight)) / designScreenHeight)
    }
}
