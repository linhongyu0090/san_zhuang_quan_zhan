import UIKit

class VerifyView: UIView {

    // ======== 字符校验视图相关 ========
    let puzzleSize      = CGSize(width: 50, height: 50)
    let refreshBtn      = UIButton()
    var imageView       = UIImageView()
    let hintLabel       = UILabel()
    var charButtonArray = [UIButton]()
    var resultText      = ""
    var chooseText      = ""
    let buttonSize      = CGSize(width: 50.0, height: 50.0)
    var maxPoint        = CGPoint.zero // 记录最大X、Y

    // ======== 通用视图相关 ========
    let contentView     = UIView() // 容器视图
    let shadowView      = UIView() // 背景视图
    lazy var resultView: UIView = {
        // 失败提示视图
        let view = UIView(frame: CGRect(x: 0, y: imageHeight, width: imageWidth, height: 20))
        let icon = UIImageView(frame: CGRect(x: margin, y: 2.5, width: view.bounds.height - 5, height: view.bounds.height - 5))
        let text = UILabel(frame: CGRect(x: icon.frame.maxX + 5, y: 0, width: imageWidth - icon.frame.maxX - 20, height: view.bounds.height))
        view.addSubview(icon)
        view.addSubview(text)
        view.backgroundColor = UIColor.gray.withAlphaComponent(0.25)
        icon.image = UIImage(named: "send_error")
        let attrStr = NSMutableAttributedString(string: "验证失败: 请重新再试一次", attributes: [NSAttributedString.Key.foregroundColor:UIColor.black])
        attrStr.addAttributes([NSAttributedString.Key.foregroundColor:UIColor.red], range: NSRange(location: 0, length: 5))
        text.attributedText = attrStr
        text.font = UIFont.systemFont(ofSize: 11)
        self.imageView.insertSubview(view, at: 0)
        return view
    }()

    var completeBlock: ((Bool)->Void)?

    let margin       = CGFloat(10) // 默认边距
    /// 背景图宽度
    var imageWidth: CGFloat {
        get { return self.contentView.frame.width - margin*2 }
    }
    /// 背景图高度
    var imageHeight: CGFloat {
        get {
            let heightScale = CGFloat(0.6) // 背景图高/宽比
            return imageWidth * heightScale
        }
    }

    /// 根据类型,显示校验视图
    ///
    /// - Parameters:
    ///   - type: 校验视图类型
    ///   - block: 校验结果回调
    class func show(SuperView superView: UIView, completeBlock block: ((Bool) -> Void)?){
        let view = VerifyView(frame: UIScreen.main.bounds)
        view.completeBlock = block
        superView.addSubview(view)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        _initView()
        setVerifyType()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// 设置校验类型
    ///
    /// - Parameter type: 校验类型
    func setVerifyType() {
        contentView.subviews.forEach {$0.removeFromSuperview()}
        _initCharFrame()
        _setRandomCharContent()
    }

    func _initView() {
        addSubview(shadowView)
        addSubview(contentView)
        addSubview(refreshBtn)

        shadowView.frame            = self.bounds
        contentView.frame           = CGRect(x: 0, y: 0, width: 350, height: 310)
        contentView.center          = center
        refreshBtn.frame            = CGRect(x: contentView.frame.maxX - 45, y: contentView.frame.maxY - 45, width: 30, height: 30)
        backgroundColor             = UIColor.clear
        contentView.backgroundColor = UIColor.white
        shadowView.backgroundColor  = UIColor.black.withAlphaComponent(0.2)

        shadowView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(close))
        shadowView.addGestureRecognizer(tap)
        refreshBtn.setImage(UIImage(named: "refresh"), for: .normal)
        refreshBtn.addTarget(self, action: #selector(refresh(_:)), for: .touchUpInside)
    }


    /// 初始化选择字符校验视图
    func _initCharFrame() {
        imageView.frame = CGRect(x: margin, y: margin, width: imageWidth, height: imageHeight)
        hintLabel.frame = CGRect(x: margin, y: imageView.frame.maxY + margin, width: imageWidth, height: 50)

        contentView.addSubview(imageView)
        contentView.addSubview(hintLabel)
    }

    /// 设置字符校验(随机位置)的内容
    func _setRandomCharContent() {
        guard var image = UIImage(named: "VerifyViewBackgorund") else { return }
        image                   = image.rescaleSize(CGSize(width: imageWidth, height: imageHeight))
        imageView.image         = image
        imageView.contentMode   = .scaleAspectFill
        imageView.clipsToBounds = true
        hintLabel.textAlignment = .center
        imageView.isUserInteractionEnabled = true

        var randomCharArray  = getRandomChinese(count: 8)
        resultText      = {
            var index = 0
            var text = ""
            randomCharArray.forEach({ (char) in
                if index > 3 {
                    return
                }
                text  += char
                index += 1
            })
            return text
        }()
        chooseText      = ""
        let hintText    = String(format: "请按顺序点击 %@ 完成验证", resultText)
        let attriStr    = NSMutableAttributedString(string: hintText, attributes: [NSAttributedString.Key.foregroundColor:UIColor.black, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 13)])
        attriStr.addAttributes([NSAttributedString.Key.foregroundColor:UIColor.red, NSAttributedString.Key.font:UIFont.systemFont(ofSize: 16)], range: NSRange(location: 7, length: 4))
        hintLabel.attributedText = attriStr
        charButtonArray.forEach {$0.removeFromSuperview()}
        charButtonArray.removeAll()
        maxPoint = CGPoint.zero
        for index in 0..<randomCharArray.count {
            let char = randomCharArray.randomElement() ?? ""
            randomCharArray.remove(char)
            let normalImg   = UIImage.imageWithColor(UIColor.white, size: buttonSize, cornerRadius: buttonSize.width/2)
            let selectedImg = UIImage.imageWithColor(UIColor.orange, size: buttonSize, cornerRadius: buttonSize.width/2)
            let button      = UIButton()
            button.tag      = index
            button.frame    = CGRect(origin: getButtonRandomPoint(index), size: buttonSize)
            button.setTitle(String(char), for: .normal)
            button.setTitleColor(UIColor.black, for: .normal)
            button.setTitleColor(UIColor.white, for: .selected)
            button.setBackgroundImage(normalImg, for: .normal)
            button.setBackgroundImage(selectedImg, for: .selected)
            button.addTarget(self, action: #selector(selectedButton(button:)), for: .touchUpInside)
            button.layer.cornerRadius = buttonSize.width/2
            button.titleLabel?.font   = UIFont.systemFont(ofSize: 15)
            DispatchQueue.main.async(execute: {
                button.transform = CGAffineTransform(rotationAngle: .pi/(self.getRandomNumber(from: 0, to: 400)/100))
            })
            imageView.addSubview(button)
            imageView.sendSubviewToBack(button)
            charButtonArray.append(button)
        }
    }


    /// 选择按钮事件
    ///
    /// - Parameter button: 按钮
    @objc func selectedButton(button: UIButton) {
        if button.isSelected { return }
        button.isSelected = true
        chooseText.append(button.currentTitle ?? "")
        if chooseText.count >= 4 {
            checkResult()
        }
    }

    /// 校验结果
    func checkResult() {
        var isSuccess = false
        isSuccess = chooseText == resultText
        self.showResult(isSuccess)
    }

    func showResult(_ isSuccess: Bool) {
        if let block = completeBlock {
            block(isSuccess)
        }
        if isSuccess {
            close()
        } else {
            UIView.animate(withDuration: 0.25, animations: {
                self.resultView.transform = CGAffineTransform(translationX: 0, y: -20)
            }) { (finish) in
                UIView.animate(withDuration: 0.15, delay: 0.75, options: UIView.AnimationOptions.allowUserInteraction, animations: {
                    self.resultView.transform = .identity
                }, completion: nil)
            }
                refresh(refreshBtn)
            }
        }


    @objc func close() {
        removeFromSuperview()
    }

    @objc func refresh(_ btn: UIButton) {
        UIView.animate(withDuration: 0.25, animations: {
            btn.transform = CGAffineTransform(rotationAngle: -.pi)
        }) { (finish) in
            if finish {
                btn.transform = .identity
            }
        }
        setVerifyType()
    }


    func getRandomNumber(from:CGFloat, to:CGFloat) -> CGFloat {
        if from >= to { return from }
        let number = CGFloat(arc4random() % UInt32(to - from)) + from
        return number
    }

    func getRandomChinese(count: Int) -> Set<String> {
        var strArray = Set<String>()
        let gbkEncoding = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(bitPattern: Int32(CFStringEncodings.GB_18030_2000.rawValue)))
        for _ in 0..<count {
            let randomH = 0xA1+arc4random()%(0xFE - 0xA1+1)
            let randomL = 0xB0+arc4random()%(0xF7 - 0xB0+1)
            var number  = (randomH<<8)+randomL
            let data    = Data(bytes: &number, count: 2)
            guard let string = String(data: data, encoding: String.Encoding(rawValue: gbkEncoding)) else {
                continue
            }
            strArray.insert(string)
        }
        return strArray
    }

    func getButtonRandomPoint(_ index: Int) -> CGPoint {
        var randomPoint = CGPoint.zero
        let numberH  = 4 //水平字符数量
        let numberV  = 2 // 垂直字符数量
        let defaultW = imageWidth / CGFloat(numberH)
        let defaultH = imageHeight / CGFloat(numberV)
        if index % numberH == 0 {
            maxPoint.x = 0
        }
        if index >= numberH {
            maxPoint.y = defaultH
        }
        let offsetY = index >= numberH ? maxPoint.y : CGFloat.zero
        randomPoint.x = getRandomNumber(from: maxPoint.x, to: maxPoint.x + defaultW - buttonSize.width)
        randomPoint.y = getRandomNumber(from: offsetY, to: offsetY + defaultH - buttonSize.height)
        if (index + 1) % numberH != 0 {
            maxPoint.x = randomPoint.x + buttonSize.width
        }
        if randomPoint.y + buttonSize.height > maxPoint.y {
            maxPoint.y = randomPoint.y + buttonSize.height
        }
        return randomPoint
    }
}

extension UIImage {

    func clipImage(rect: CGRect) -> UIImage? {
        let scale = self.scale
        let realRect = CGRect(x: rect.origin.x * scale, y: rect.origin.y * scale, width: rect.size.width * scale, height: rect.size.height * scale)
        guard let imageRef = self.cgImage?.cropping(to: realRect) else { return nil }
        var partImage = UIImage(cgImage: imageRef)
        partImage     = partImage.rescaleSize(rect.size)
        return partImage
    }


    func rescaleSize(_ size: CGSize) -> UIImage {
        let rect = CGRect(origin: CGPoint.zero, size: size)
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        self.draw(in: rect)
        let resizeImg = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return resizeImg ?? self
    }

    class func imageWithColor(_ color: UIColor, size: CGSize, cornerRadius: CGFloat = 0) -> UIImage {

        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        let roundedRect: UIBezierPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius)
        roundedRect.lineWidth = 0

        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
        color.setFill()
        roundedRect.fill()
        roundedRect.stroke()
        roundedRect.addClip()
        var image: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        image = image?.resizableImage(withCapInsets: UIEdgeInsets(top: cornerRadius, left: cornerRadius, bottom: cornerRadius, right: cornerRadius))
        return image!
    }
}
