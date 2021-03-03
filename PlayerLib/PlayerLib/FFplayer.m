
#import <Foundation/Foundation.h>
#include "FFPlayer.h"
#import "FFPlay.h"
#include "FFView.h"
#include "FFMovie.h"
#import "FFHeader.h"
#import "FFVideoDecoder.h"

@implementation FFPlayer {
    
    FFPlay *ffplay;
    FFView *ffview;
    
}


- (instancetype)init
{
    self = [super init];
    if(self)
    {
        ffplay = [[FFPlay alloc] init];
        ffview = [[FFView alloc] init];
    }
    
    return self;
}

-(UIView *) setVideoView : (UIView *) view{
    ffview.fillMode = FillModePreserveAspectRatioAndFill;
    [ffplay.ffMovie addTarget: ffview];
    ffview.frame = view.frame;
    [view addSubview:ffview];
    [ffplay play];
    return view;
}


- (void)play {
    [ffplay play];
}
- (void)pause {
    [ffplay pause];
}

- (void)destroy {
    [ffplay destroy];
}
- (void)seekToTimeByValue:(NSTimeInterval)time {
    
}
- (void)seekToTimeByRatio:(float)ratio {
    [ffplay seekToTimeByRatio:ratio];
}
- (void)setLogEnable:(BOOL)isEnable {
    [ffplay setLogEnable:isEnable];
}

- (void) setSocketTimeout: (UInt32) value {
    [ffplay setSocketTimeout:value];
}

- (BOOL)isEndOfFile
{
   return [ffplay.decoder isEndOfFile];
}

-(void)setSeekState:(int)value
{
    ffplay.state.seeking = value;
}

-(void)setPlayerUri:(NSString *)uri{
    ffplay.url = uri;
}

-(CGSize)getFrameBuffferSize{
    return [ffview framebufferSize];
}

-(Float64)getDecoderFrameCount
{
    if (ffplay.decoder.videoDecoder != nil) {
        FFDecoder *decoder = (FFDecoder *)ffplay.decoder.videoDecoder;
        FFVideoDecoder *Video = (FFVideoDecoder *)decoder;
        FFVideoDecoderModel *model = [(FFVideoDecoderModel *)Video valueForKey:@"model"];
        return model != nil && model.fps > 0 ? model.fps : 0.0;
    }
    else
    {
        return 0.0;
    }
   
}
@end
