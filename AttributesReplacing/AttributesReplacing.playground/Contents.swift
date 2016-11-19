import UIKit
import PlaygroundSupport

extension UILabel {
    func addAttributes(_ attributes: [String : Any], to strings: [String]) {
        guard let text = text else {
            return
        }

        let attributedString = NSMutableAttributedString(string: text)
        for string in strings {
            let range = NSString(string: text).range(of: string)
            attributedString.addAttributes(attributes, range: range)
        }

        attributedText = attributedString
    }
}

let recipe = "フライパンにオリーブオイル大さじ1と玉ねぎを入れて炒め、透き通ってきたらにんにくとオリーブオイル小さじ1を加えてさらに炒める。にんじんを加えてさっと炒めたら米を入れ、全体をよく混ぜながら炒める。"
let ingredients = ["オリーブオイル", "玉ねぎ", "にんにく", "にんじん", "米"]

var label = UILabel(frame: .zero)
label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
label.text = recipe
label.numberOfLines = 0
label.addAttributes([NSFontAttributeName : UIFont.boldSystemFont(ofSize: 23)], to: ingredients)
label.preferredMaxLayoutWidth = 200
label.frame = CGRect(origin: .zero, size: label.intrinsicContentSize)

PlaygroundPage.current.liveView = label
