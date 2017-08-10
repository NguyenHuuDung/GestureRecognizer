//
//  ViewController.swift
//  ExtensionsExample
//
//  Created by Nguyễn Hữu Dũng on 8/9/17.
//  Copyright © 2017 Nguyễn Hữu Dũng. All rights reserved.
//

import UIKit
import EZSwiftExtensions

class ViewController: UIViewController {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tapImg: UIImageView!
    @IBOutlet weak var swipeImg: UIImageView!
    @IBOutlet weak var panImg: UIImageView!
    @IBOutlet weak var pichImg: UIImageView!
    @IBOutlet weak var footerView: UIView!
    @IBOutlet weak var rotationImg: UIImageView!
    @IBOutlet weak var tapBtn: UIButton!
    @IBOutlet weak var swipeBtn: UIButton!
    @IBOutlet weak var panBtn: UIButton!
    @IBOutlet weak var pichBtn: UIButton!
    @IBOutlet weak var rotationBtn: UIButton!
    @IBOutlet weak var tapLbl: UILabel!
    @IBOutlet weak var swipeLbl: UILabel!
    @IBOutlet weak var panLbl: UILabel!
    @IBOutlet weak var pichLbl: UILabel!
    @IBOutlet weak var rotationLbl: UILabel!
    
    
    var tapView = UIView()
    var swipeView = UIView()
    var panView = UIView()
    var pinchView = UIView()
    var rotationView = UIView()
    
    var tapChildView = UIView()
    
    var orangeSwipeChildView = UIView()
    var graySwipeChildView = UIView()
    var blueSwipeChildView = UIView()
    
    var panChildView = UIView()
    var pinchChildView = UIView()
    var rotationChildView = UIView()
    
    var widthView :CGFloat = 0.0
    var heightView :CGFloat = 0.0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setupButton()
        widthView = CGFloat(self.view.frame.size.width)
        heightView = CGFloat(self.view.frame.size.height - headerView.frame.size.height - footerView.frame.size.height)
        tap()
        
        
    }
    
    
    func setupView(viewShow: UIView, viewHideOne :UIView, viewHideTwo: UIView, viewHideThree:UIView, viewHideFour: UIView , color :UIColor)
    {
        
        viewShow.frame =  CGRect(x: 0, y: 0, w: widthView, h: heightView)
        viewShow.backgroundColor = color
        mainView.addSubview(viewShow)
        
        viewHideOne.removeSubviews()
        viewHideTwo.removeSubviews()
        viewHideThree.removeSubviews()
        viewHideFour.removeSubviews()
        
        
    }
    
    func setupButton() {
        
        tapBtn.addTarget(self, action: #selector(tap), for: .touchUpInside)
        swipeBtn.addTarget(self, action: #selector(swipe), for: .touchUpInside)
        panBtn.addTarget(self, action: #selector(pan), for: .touchUpInside)
        pichBtn.addTarget(self, action: #selector(pinch), for: .touchUpInside)
        rotationBtn.addTarget(self, action: #selector(rotation), for: .touchUpInside)
    }
    
    
    func setupShowHide(icon : UIImageView,word :UILabel, check :Bool) {
        
        if  check == true{
            
            icon.image = UIImage(named: "circularBlue")
            word.textColor = UIColor.init(colorLiteralRed: 147.0/255.0, green: 62.0/255.0, blue: 197.0/255.0, alpha: 1.0)
            
        }else {
            icon.image = UIImage(named: "circularGray")
            word.textColor = UIColor.init(colorLiteralRed: 155.0/255.0, green: 155.0/255.0, blue: 155.0/255.0, alpha: 1.0)
            
        }
        
    }
    
    func tap()  {
        
        titleLbl.text = "TAP"
        checkButton(tap: true, swipe: false, pan: false, pinch: false, rotation: false)
        setupView(viewShow: tapView, viewHideOne: swipeView, viewHideTwo: panView, viewHideThree: pinchView, viewHideFour: rotationView, color: .white)
        
        tapChildView = UIView(x: tapView.frame.size.width/2 - 50 , y: tapView.frame.size.height/2 - 50, w: 100 , h: 100)
        tapChildView.backgroundColor = .red
        tapChildView.addTapGesture(action: handleSingleTapGesture)
        self.tapView.addSubview(tapChildView)
        
        
    }
    
    func swipe()  {
        
        titleLbl.text = "SWIPE"
        checkButton(tap: false, swipe: true, pan: false, pinch: false, rotation: false)
        setupView(viewShow: swipeView, viewHideOne: tapView, viewHideTwo: panView, viewHideThree: pinchView, viewHideFour: rotationView, color: .white)
        
        
        orangeSwipeChildView = UIView(x: 0, y: swipeView.frame.size.height/2 - 50 , w: self.view.frame.size.width, h: 100)
        orangeSwipeChildView.backgroundColor = .orange
        
        graySwipeChildView = UIView(x: self.view.frame.size.width, y: swipeView.frame.size.height/2 - 50, w: self.view.frame.size.width, h: 100)
        graySwipeChildView.backgroundColor = .gray
        
        blueSwipeChildView = UIView(x: -self.view.frame.size.width , y: swipeView.frame.size.height/2 - 50, w: self.view.frame.size.width, h: 100)
        blueSwipeChildView.backgroundColor = .blue
        
        orangeSwipeChildView.addSwipeGesture(direction: UISwipeGestureRecognizerDirection.left, action: slideToLeftWithGestureRecognizer)
        orangeSwipeChildView.addSwipeGesture(direction: UISwipeGestureRecognizerDirection.right, action: slideToRightWithGestureRecognizer)
        graySwipeChildView.addSwipeGesture(direction: UISwipeGestureRecognizerDirection.right, action: slideToRightWithGestureRecognizer)
        blueSwipeChildView.addSwipeGesture(direction: UISwipeGestureRecognizerDirection.left, action: slideToLeftWithGestureRecognizer)
        
        self.swipeView.addSubview(orangeSwipeChildView)
        self.swipeView.addSubview(graySwipeChildView)
        self.swipeView.addSubview(blueSwipeChildView)
    
        
    }
    
    func pan()  {
        
        titleLbl.text = "PAN"
        checkButton(tap: false, swipe: false, pan: true, pinch: false, rotation: false)
        setupView(viewShow: panView, viewHideOne: tapView, viewHideTwo: swipeView, viewHideThree: pinchView, viewHideFour: rotationView, color: .white)
        
        panChildView = UIView(x: panView.frame.size.width/2 - 50 , y: panView.frame.size.height/2 - 50, w: 100 , h: 100)
        panChildView.backgroundColor = .red
        panChildView.addPanGesture(action: moveViewWithGestureRecognizer)
        self.panView.addSubview(panChildView)
        
    
    }
    
    func pinch()  {
        
                titleLbl.text = "PINCH"
        checkButton(tap: false, swipe: false, pan: false, pinch: true, rotation:false)
        setupView(viewShow: pinchView, viewHideOne: tapView, viewHideTwo: swipeView, viewHideThree: panView, viewHideFour: rotationView, color: .white)
        
        
        pinchChildView = UIView(x: pinchView.frame.size.width/2 - 50 , y: pinchView.frame.size.height/2 - 50, w: 100 , h: 100)
        pinchChildView.backgroundColor = .red
        pinchChildView.addPinchGesture(action: handlePinchWithGestureRecognizer)
        self.pinchView.addSubview(pinchChildView)
        
    }
    
    func  rotation()  {
                titleLbl.text = "ROTATION"
        checkButton(tap: false, swipe: false, pan: false, pinch: false, rotation:true)
        setupView(viewShow: rotationView, viewHideOne: tapView, viewHideTwo: swipeView, viewHideThree: panView, viewHideFour: pinchView, color: .white)
        
        
        rotationChildView = UIView(x: rotationView.frame.size.width/2 - 50 , y: rotationView.frame.size.height/2 - 50, w: 100 , h: 100)
        rotationChildView.backgroundColor = .red
        rotationChildView.addRotationGesture(action:handleRotationWithGestureRecognizer)
        self.rotationView.addSubview(rotationChildView)
    }
    
    
    
    func checkButton(tap : Bool, swipe :Bool , pan: Bool , pinch :Bool, rotation :Bool) {
        
        setupShowHide(icon: tapImg, word: tapLbl, check: tap)
        setupShowHide(icon: swipeImg, word: swipeLbl, check: swipe)
        setupShowHide(icon: panImg, word: panLbl, check: pan)
        setupShowHide(icon: pichImg, word: pichLbl, check: pinch)
        setupShowHide(icon: rotationImg, word: rotationLbl, check: rotation)
 
    }
    
    func handleSingleTapGesture(tapGestureRecognizer :UITapGestureRecognizer)  {
        var  newWidth : CGFloat = 100.0;
        if (tapChildView.frame.size.width == 100.0) {
            newWidth = 200.0;
        }
        
        let currentCenter : CGPoint  = tapChildView.center;
        
        tapChildView.frame = CGRect(x: tapChildView.frame.origin.x, y: tapChildView.frame.origin.y, w: newWidth, h: tapChildView.frame.size.height)
        tapChildView.center = currentCenter
    }
    
    func slideToLeftWithGestureRecognizer(gestureRecognizer : UISwipeGestureRecognizer){
        UIView.animate(withDuration: 0.5) {
            
            self.orangeSwipeChildView.frame = self.orangeSwipeChildView.frame.offsetBy(dx: -self.view.frame.width, dy: 0.0);
            self.graySwipeChildView.frame = self.graySwipeChildView.frame.offsetBy(dx: -self.view.frame.width, dy: 0.0);
            self.blueSwipeChildView.frame = self.blueSwipeChildView.frame.offsetBy(dx: -self.view.frame.width, dy: 0.0);
            
        }
    }
    
    func slideToRightWithGestureRecognizer(gestureRecognizer : UISwipeGestureRecognizer){
        UIView.animate(withDuration: 0.5) {
            
            self.orangeSwipeChildView.frame = self.orangeSwipeChildView.frame.offsetBy(dx: self.view.frame.width, dy: 0.0);
            self.graySwipeChildView.frame = self.graySwipeChildView.frame.offsetBy(dx: self.view.frame.width, dy: 0.0);
            self.blueSwipeChildView.frame = self.blueSwipeChildView.frame.offsetBy(dx: self.view.frame.width, dy: 0.0);
            
        }
    }
    
    func moveViewWithGestureRecognizer(panGestureRecognizer : UIPanGestureRecognizer)  {
        
        
        let touchLocation : CGPoint =  panGestureRecognizer.location(in: self.view)
        
        panView.center = touchLocation
        
    }
    
    
    func handlePinchWithGestureRecognizer(pinchGestureRecognizer:UIPinchGestureRecognizer)  {
        
        pinchChildView.transform = pinchChildView.transform.scaledBy(x: pinchGestureRecognizer.scale, y: pinchGestureRecognizer.scale);
        pinchGestureRecognizer.scale = 1.0;
    }
 
    
    func handleRotationWithGestureRecognizer(rotationGestureRecognizer: UIRotationGestureRecognizer) {
        rotationView.transform = rotationView.transform.rotated(by: rotationGestureRecognizer.rotation);
        
        rotationGestureRecognizer.rotation = 0.0;
    }
   
    
}

