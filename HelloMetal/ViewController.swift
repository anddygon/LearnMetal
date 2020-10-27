//
//  ViewController.swift
//  HelloMetal
//
//  Created by anddy on 2020/10/27.
//

import UIKit
import MetalKit

class ViewController: UIViewController {
    private var renderer: Renderer!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mtkView = view as! MTKView
        mtkView.device = MTLCreateSystemDefaultDevice()!
        renderer = .init(view: mtkView)
        renderer.mtkView(mtkView, drawableSizeWillChange: mtkView.drawableSize)
        mtkView.delegate = renderer
    }


}

