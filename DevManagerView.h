//
//  DevManagerView.h
//  GG-IOS-DEVMGT
//
//  Created by 谢鑫 on 2020/4/1.
//  Copyright © 2020 Shae. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DevManagerView;
NS_ASSUME_NONNULL_BEGIN
@protocol DevMgrViewDelegate <NSObject>
@required
-(void)DevMgrViewBtnTag:(NSInteger)tag;

@end
@interface DevManagerView : UIView
@property(nonatomic,weak) id<DevMgrViewDelegate> mdelegate;
/*@property(nonatomic,strong)UIButton *changeStampButn;
@property(nonatomic,strong)UIButton *addOilButn;
@property(nonatomic,strong)UIButton *unlockButn;
@property(nonatomic,strong)UIButton *devInfoButn;

@property(nonatomic,strong)UILabel *changeStampLbl;
@property(nonatomic,strong)UILabel *addOilLbl;
@property(nonatomic,strong)UILabel *unlockLbl;
@property(nonatomic,strong)UILabel *devInfoLbl;
 */
@end

NS_ASSUME_NONNULL_END
