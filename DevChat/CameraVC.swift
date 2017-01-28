//
//  ViewController.swift
//  DevChat
//
//  Created by Gary O Brien on 09/12/2016.
//  Copyright © 2016 Gary O Brien. All rights reserved.
//

import UIKit
import FirebaseAuth

class CameraVC: AVCamCameraViewController, AVCameraVCDelegate{
    
    @IBOutlet weak var cameraBtn: UIButton!
    @IBOutlet weak var recordBtn: UIButton!
    @IBOutlet weak var previewView: AVCamPreviewView!
    @IBOutlet weak var captureModeControl: UISegmentedControl!
    
    
    override func viewDidLoad() {
         delegate = self
        _previewView = previewView
        _captureModeControl = captureModeControl
        
        captureModeControl.selectedSegmentIndex = 1
        captureModeControl.isHidden = true
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        //performSegue(withIdentifier: "LoginVC", sender: nil)
        guard FIRAuth.auth()?.currentUser != nil else {
            performSegue(withIdentifier: "LoginVC", sender: nil)
            return
        }
    }
    
    @IBAction func recordBtnPressed(_ sender: Any) {
        toggleCaptureMode(captureModeControl)
        toggleMovieRecording()
    }
    
    @IBAction func cameraBtnPressed(_ sender: Any) {
        changeCamera()
    }
    
    
    func shouldEnableCameraUI(_ enable: Bool) {
        cameraBtn.isEnabled = enable
        print("Should enable camera UI: \(enable)")
    }
    
    func shouldEnableRecordUI(_ enable: Bool) {
        recordBtn.isEnabled = enable
        print("Should enable record UI: \(enable)")
    }
    
    func recordingHasStarted() {
        print("Recording has started")
    }
    
    func canStartRecording() {
        print("Can start recording")
    }
    
    func videoRecordingFailed() {
        
    }
    
    func videoRecordingComplete(_ videoUrl: URL!) {
        performSegue(withIdentifier: "UsersVC", sender: ["videoURL": videoUrl])
    }
    
    func snapshotFailed() {
        
    }
    
    func snapshotTaken(_ snapshotData: Data!) {
        performSegue(withIdentifier: "UsersVC", sender: ["snapshotData": snapshotData])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let usersVC = segue.destination as? UsersVC {
            if let videoDict = sender as? Dictionary<String, URL> {
                let url = videoDict["videoURL"]
                usersVC.videoURL = url
            } else {
                if let snapDict = sender as? Dictionary<String, Data> {
                    let snapData = snapDict["snapshotData"]
                    usersVC.snapData = snapData
                }
            }
        }
    }
}

