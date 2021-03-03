
#ifndef RtspPlayer_h
#define RtspPlayer_h

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

@interface FFPlayer : NSObject

- (void)play;
- (void)pause;
- (void)destroy;
- (void)seekToTimeByValue:(NSTimeInterval)time;
- (void)seekToTimeByRatio:(float)ratio;
- (void)setLogEnable:(BOOL)isEnable;
- (void) setSocketTimeout: (UInt32) value;
-(UIView *)setVideoView : (UIView *) view;
-(void)setSeekState:(int)value;
- (BOOL)isEndOfFile;
-(void)setPlayerUri:(NSString *)uri;
-(Float64)getDecoderFrameCount;
-(CGSize)getFrameBuffferSize;

@end


#endif /* RtspPlayer_h */
