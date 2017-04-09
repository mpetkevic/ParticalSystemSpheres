//
//  GameViewController.swift
//  Game3D
//
//  Created by MP Mac on 08/04/2017.
//  Copyright © 2017 MP Mac. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {
    
   
    var scnView: SCNView!
    var scnScene: SCNScene!
    var cameraNode: SCNNode!
    var sphere: SCNNode!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupScene()
        createSphere()
        setupCamera()
        setupLight()
 //       createTrail()
        
        
    }
    
    func setupView(){
        self.view.backgroundColor = UIColor.white
        scnView = self.view as! SCNView
        
    }
   
    func setupScene(){
        scnScene = SCNScene()
        scnView.scene = scnScene
        scnView.allowsCameraControl = true
       // scnView.autoenablesDefaultLighting = true
        
    }

    func setupCamera(){
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.usesOrthographicProjection = true
        cameraNode.camera?.orthographicScale = 8
        cameraNode.position = SCNVector3Make(20, 20, 20)
        cameraNode.eulerAngles = SCNVector3Make(-45, 45, 0)
        let constraint = SCNLookAtConstraint(target: sphere)
        constraint.isGimbalLockEnabled = true
        cameraNode.constraints = [constraint]
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func createSphere() {
        sphere = SCNNode()
        
        let sphereGeometry = SCNSphere(radius: 1.5)
        sphere.geometry = sphereGeometry
        
        let sphereMaterial = SCNMaterial()
        sphereMaterial.diffuse.contents = UIColor.blue
        sphereGeometry.materials = [sphereMaterial]
        sphere.position = SCNVector3Make(0, 0, 0)
        scnScene.rootNode.addChildNode(sphere)
    }

    func setupLight() {
        
        // Lightspot from top with shadows
        let light = SCNNode ()
        light.light = SCNLight ()
        light.light?.type = SCNLight.LightType.spot
        light.light?.color = UIColor.white
        light.position = SCNVector3(0, 20, 0)
        light.castsShadow = false
        light.light?.shadowRadius = 2
        light.light?.shadowColor = UIColor.black
        scnScene.rootNode.addChildNode(light)
        
        let light2 = SCNNode ()
        light2.light = SCNLight ()
        light2.light?.type = SCNLight.LightType.directional
        light2.light?.color = UIColor.white
        light2.position = SCNVector3Make(-45, 45, 0)
        scnScene.rootNode.addChildNode(light2)
    }
    
    //Kame problema del funkcijos createTrail, savybes color?, bei kaip panaudoti sukurta sfera is funkcijos createSphere?
    
//    func createTrail(color: UIColor: , geometry: SCNGeometry) -> SCNParticleSystem {
//        
//        let trail = SCNParticleSystem(named: "ParticalSpheres.scnp", inDirectory: nil)!
//        
//        trail.particleColor = color
//        
//        trail.emitterShape = geometry
//        
//        return trail
//    }
}
