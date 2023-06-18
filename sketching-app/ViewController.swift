//
//  ViewController.swift
//  sketching-app
//
//  Created by Sophia Liu on 6/17/23.
//

import UIKit
import PencilKit

class ViewController: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver {
    
    @IBOutlet weak var takeSaveButton: UIBarButtonItem!
    @IBOutlet weak var inputToggleButton: UIBarButtonItem!
    
    private let canvasView: PKCanvasView = {
        let canvas = PKCanvasView()
        canvas.drawingPolicy = .anyInput // Allow drawing policy to be any input
        return canvas
    }()
    
    private let toolPicker = PKToolPicker()
    let drawing = PKDrawing() // To save drawing
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(canvasView)
        // Do any additional setup after loading the view.
        canvasView.delegate = self
        canvasView.drawing = drawing // Render image once the user saves it
    }
    
    // Set frame
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        canvasView.frame = view.bounds
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        canvasView.becomeFirstResponder()
    }
    
    /* Canvas functions and breakpoints
    @objc func canvasViewDrawingDidChange(_ canvasView: PKCanvasView) {
        
    }
    @objc func canvasViewDidBeginUsingTool(_ canvasView: PKCanvasView) {
        
    }
    @objc func canvasViewDidEndUsingTool(_ canvasView: PKCanvasView) {
        
    }
    @objc func canvasViewDidFinishRendering(_ canvasView: PKCanvasView) {
        
    }*/

}

