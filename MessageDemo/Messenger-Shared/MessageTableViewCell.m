//
//  MessageTableViewCell.m
//  Messenger
//
//  Created by Ignacio Romero Zurbuchen on 9/1/14.
//  Copyright (c) 2014 Slack Technologies, Inc. All rights reserved.
//

#import "MessageTableViewCell.h"
#import "SLKUIConstants.h"

@implementation MessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        
        [self configureSubviews];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
//    NSDictionary *views = @{@"thumbnailView": self.thumbnailView,
//                            @"titleLabel": self.titleLabel,
//                            @"bodyLabel": self.bodyLabel,
//                            };
//
//    NSDictionary *metrics = @{@"tumbSize": @(kMessageTableViewCellAvatarHeight),
//                              @"padding": @15,
//                              @"right": @10,
//                              @"left": @5
//                              };
//
//
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[thumbnailView(tumbSize)]-right-[titleLabel(>=0)]-left-|" options:0 metrics:metrics views:views]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-left-[thumbnailView(tumbSize)]-right-[bodyLabel(>=0)]-right-|" options:0 metrics:metrics views:views]];
//    [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-left-[thumbnailView(tumbSize)]-(>=0)-|" options:0 metrics:metrics views:views]];
//
//    if ([self.reuseIdentifier isEqualToString:MessengerCellIdentifier]) {
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-left-[titleLabel(20)]-left-[bodyLabel(>=0@999)]-left-|" options:0 metrics:metrics views:views]];
//    }
//    else {
//        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[titleLabel]|" options:0 metrics:metrics views:views]];
//    }
}

- (void)configureSubviews
{
    [self.contentView addSubview:self.thumbnailView];
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.bodyLabel];


}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    CGFloat pointSize = [MessageTableViewCell defaultFontSize];
    
    self.titleLabel.font = [UIFont boldSystemFontOfSize:pointSize];
    self.bodyLabel.font = [UIFont systemFontOfSize:pointSize];
    
    self.titleLabel.text = @"";
    self.bodyLabel.text = @"";

}

#pragma mark - Getters


+ (CGFloat)defaultFontSize
{
    CGFloat pointSize = 16.0;
    
    NSString *contentSizeCategory = [[UIApplication sharedApplication] preferredContentSizeCategory];
    pointSize += SLKPointSizeDifferenceForCategory(contentSizeCategory);
    
    return pointSize;
}

@end
