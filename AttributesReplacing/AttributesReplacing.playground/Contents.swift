import UIKit
import PlaygroundSupport

extension UILabel {
    func addAttributes(_ attributes: [String : Any], toPattern pattern: String) {
        guard let regularExpression = try? NSRegularExpression(pattern: pattern, options: []) else {
            return
        }

        if let attributedText = attributedText {
            let attributedString = NSMutableAttributedString(attributedString: attributedText)

            let wholeRange = NSRange(location: 0, length: attributedText.length)
            let matches = regularExpression.matches(in: attributedString.string, options: [], range: wholeRange)
            for match in matches {
                attributedString.addAttributes(attributes, range: match.range)
            }

            self.attributedText = attributedString
        } else if let text = text {
            let attributedString = NSMutableAttributedString(string: text)

            let wholeRange = NSRange(location: 0, length: text.characters.count)
            let matches = regularExpression.matches(in: text, options: [], range: wholeRange)
            for match in matches {
                attributedString.addAttributes(attributes, range: match.range)
            }

            attributedText = attributedString
        }
    }
}

let recipe = "フライパンにオリーブオイル大さじ1と玉ねぎを入れて炒め、透き通ってきたらにんにくとオリーブオイル小さじ1を加えてさらに炒める。にんじんを加えてさっと炒めたら米を入れ、全体をよく混ぜながら炒める。"
let ingredients = ["オリーブオイル", "玉ねぎ", "にんにく", "にんじん", "米"]
let spoons = ["大さじ", "小さじ"]

var label = UILabel(frame: .zero)
label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
label.text = recipe
label.numberOfLines = 0

label.addAttributes([NSForegroundColorAttributeName : UIColor.red], toPattern: "(大|小)さじ\\d+")
label.addAttributes([NSFontAttributeName : UIFont.boldSystemFont(ofSize: 23)], toPattern: "(オリーブオイル|玉ねぎ|にんじん|にんにく|にんじん|米)")

label.preferredMaxLayoutWidth = 200
label.frame = CGRect(origin: .zero, size: label.intrinsicContentSize)

PlaygroundPage.current.liveView = label
