//
//  Renderer.swift
//  HelloMetal
//
//  Created by anddy on 2020/10/27.
//

import Foundation
import MetalKit

class Renderer: NSObject {
    let commandQueue: MTLCommandQueue
    
    
    init(view: MTKView) {
        let device = view.device!
        commandQueue = device.makeCommandQueue()!
        super.init()
    }
}

extension Renderer: MTKViewDelegate {
    func mtkView(_ view: MTKView, drawableSizeWillChange size: CGSize) {
        
    }
    
    func draw(in view: MTKView) {
        let buffer = commandQueue.makeCommandBuffer()!
        let passDescriptor = view.currentRenderPassDescriptor!
        let encoder = buffer.makeRenderCommandEncoder(descriptor: passDescriptor)!
        view.clearColor = MTLClearColor.random
        buffer.present(view.currentDrawable!)
        buffer.commit()
    }
}

extension MTLClearColor {
    static var random: MTLClearColor {
        let r = Double.random(in: 0...1)
        let g = Double.random(in: 0...1)
        let b = Double.random(in: 0...1)
        return .init(red: r, green: g, blue: b, alpha: 1)
    }
}
