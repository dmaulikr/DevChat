//
//  AVCameraVCDelegate.h
//  DevChat
//
//  Created by Gary O Brien on 11/12/2016.
//  Copyright © 2016 Gary O Brien. All rights reserved.
//

#ifndef AVCameraVCDelegate_h
#define AVCameraVCDelegate_h

@protocol AVCameraVCDelegate <NSObject>

-(void) shouldEnableRecordUI:(BOOL)enable;
-(void) shouldEnableCameraUI:(BOOL)enable;
-(void) canStartRecording;
-(void) recordingHasStarted;
-(void) videoRecordingComplete:(NSURL*)videoUrl;
-(void) videoRecordingFailed;
-(void) snapshotTaken:(NSData*)snapshotData;
-(void) snapshotFailed;

@end


#endif /* AVCameraVCDelegate_h */
