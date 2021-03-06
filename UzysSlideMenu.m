//
//  UzysSlideMenu.m
//  UzysSlideMenu
//
//  Created by Jaehoon Jung on 13. 2. 21..
//  Copyright (c) 2013년 Uzys. All rights reserved.
//

#import "UzysSlideMenu.h"
@interface UzysSlideMenu()
@property (nonatomic,strong) UIScrollView *scrollView;
@property (nonatomic,strong) NSMutableArray *itemViews;
@property (nonatomic,assign) UzysSMState state;

-(void)setupLayout;
@end
@implementation UzysSlideMenu

- (id)initWithItems:(NSArray *)items
{
    self = [super init];
    if (self) {
        // Initialization code
        self.userInteractionEnabled = YES;
        self.pItems = items;
        self.itemViews = [NSMutableArray array];
        self.state = STATE_ICON_MENU;
        [self setupLayout];
        [self showIconMenu:NO];
    }
    return self;
}

- (void)dealloc
{
    [_scrollView release];
    [_itemViews release];
    [_pItems release];
    [super ah_dealloc];
}
-(void)setupLayout
{

    UzysSMMenuItemView *itemView = [[[NSBundle mainBundle] loadNibNamed:@"UzysSMMenuItemView" owner:self options:nil] lastObject];
    CGFloat menuHeight =itemView.bounds.size.height * [_pItems count];
    CGFloat menuWidth = itemView.bounds.size.width;
    [self setFrame:CGRectMake(0, 60, menuWidth, [UIScreen mainScreen].applicationFrame.size.height-50)];
    
    
    _scrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
    _scrollView.backgroundColor = [UIColor clearColor];
    _scrollView.bounces = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.contentSize = CGSizeMake(menuWidth, menuHeight);
    [self addSubview:_scrollView];
    

    [self.pItems enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        
        UzysSMMenuItemView *itemView = [[[NSBundle mainBundle] loadNibNamed:@"UzysSMMenuItemView" owner:self options:nil] lastObject];
        itemView.frame = CGRectMake(0, 0, itemView.bounds.size.width, itemView.bounds.size.height);
        itemView.item = obj;
        itemView.targetFrame = CGRectMake(0, itemView.bounds.size.height*idx, itemView.bounds.size.width, itemView.bounds.size.height);
        
        itemView.backgroundView.alpha = 0;
        itemView.label.alpha = 0;
        itemView.alpha = 0;
        itemView.userInteractionEnabled = YES;
        itemView.tag = itemView.item.tag;
        itemView.delegate = self;

        [self.scrollView addSubview:itemView];
        [self.scrollView sendSubviewToBack:itemView];
        [self.itemViews addObject:itemView];
        
    }];
}


- (void)openIconMenu
{
    if(self.state !=STATE_ICON_MENU)
       [self showIconMenu:YES];
}

-(void)toggleMenu
{
    switch (self.state)
    {
        case STATE_ICON_MENU:
            [self showFullMenu:YES];
            break;
        case STATE_MAIN_MENU:
            [self showFullMenu:YES];
            break;
        case STATE_FULL_MENU:
            [self showMainMenu:YES];
            break;
        default:
            break;
    }
}

- (void)toggleMenuWithCompletion:(void(^)(UzysSMState state))block
{
    [self toggleMenu];
    if (block) block(self.menuState);
}

-(void)openMenu:(UzysSMState)state animated:(BOOL)animated
{
    self.state = state;
    switch (state)
    {
        case STATE_ICON_MENU:
            [self showIconMenu:animated];
            break;
        case STATE_MAIN_MENU:
            [self showMainMenu:animated];
            break;
        case STATE_FULL_MENU:
            [self showFullMenu:animated];
            break;
        default:
            break;
    }
}

#pragma mark - MenuState

-(void)showIconMenu:(BOOL)animation
{
    ah__block typeof(self) blockSelf = self;
    void(^itemViewsSettingBlock)(void) = ^{
        [blockSelf.itemViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            UzysSMMenuItemView *itemView = obj;
            itemView.frame = CGRectMake(0, 0, itemView.bounds.size.width, itemView.bounds.size.height);
            
            if(idx ==0)
            {
                itemView.alpha = 1;
                itemView.label.alpha = 0;
                itemView.backgroundView.alpha = 0;
                itemView.seperatorView.alpha = 0;
                itemView.imageView.alpha = 1;
            }
            else
            {
                itemView.backgroundView.alpha = 0.7;
                itemView.label.alpha = 0;
                itemView.seperatorView.alpha = 1;
                itemView.alpha = 0;
            }
            blockSelf.scrollView.contentOffset = CGPointZero;
        }];
    };

    
    if(animation)
    {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionAllowAnimatedContent animations:^{
            
            itemViewsSettingBlock();
            
        } completion:^(BOOL finished) {
            self.state = STATE_ICON_MENU;
        }];
        

    }
    else
    {
        itemViewsSettingBlock();
        self.state = STATE_ICON_MENU;

    }
}
-(void)showMainMenu:(BOOL)animation
{
    ah__block typeof(self) blockSelf = self;
    void(^itemViewsSettingBlock)(void) = ^{
        blockSelf.scrollView.contentOffset = CGPointZero;
        [blockSelf.itemViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            
            UzysSMMenuItemView *itemView = obj;
            itemView.frame = CGRectMake(0, 0, itemView.bounds.size.width, itemView.bounds.size.height);
            
            if(idx ==0)
            {
                itemView.alpha = 1;
                itemView.label.alpha =1;
                itemView.seperatorView.alpha = 0;
                itemView.imageView.alpha = 1;
                itemView.backgroundView.alpha = 0.3;
            }
            else
            {
                itemView.alpha = 0;
                itemView.label.alpha =1;
                itemView.seperatorView.alpha = 0;
                itemView.imageView.alpha = 1;
                itemView.backgroundView.alpha = 0.3;
                
            }
        }];

    };
    
    if(animation)
    {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionAllowAnimatedContent animations:^{
            itemViewsSettingBlock();
        } completion:^(BOOL finished) {
            self.state = STATE_MAIN_MENU;
        }];
    }
    else
    {
        itemViewsSettingBlock();        
        self.state = STATE_MAIN_MENU;
    }
}
-(void)showFullMenu:(BOOL)animation
{
    if (selectedItem) {
        [self.itemViews removeObject:selectedItem];
        [self.itemViews insertObject:selectedItem atIndex:selectedItem.tag];
    }
    
    self.textView.text = @"";
    if(animation)
    {
        
        [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseIn animations:^{
            self.scrollView.contentOffset = CGPointZero;
            [self.itemViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                UzysSMMenuItemView *itemView = obj;
                itemView.targetFrame = CGRectMake(0, itemView.bounds.size.height*idx, itemView.bounds.size.width, itemView.bounds.size.height);
                itemView.alpha = 0.1;
            }];
        } completion:^(BOOL finished) {
            
            [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState|UIViewAnimationOptionTransitionCrossDissolve|UIViewAnimationOptionCurveEaseOut animations:^{
                
                [self.itemViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    UzysSMMenuItemView *itemView = obj;
                    itemView.alpha = 1;
                    itemView.frame = itemView.targetFrame;
                    itemView.backgroundView.alpha = 0.7;
                    itemView.label.alpha = 1;
                    itemView.seperatorView.alpha = 1;
                    
                    
                }];
                
                
            } completion:^(BOOL finished) {
                 self.state = STATE_FULL_MENU;
            }];
            
        }];
    }
    else
    {
        self.scrollView.contentOffset = CGPointZero;
        [self.itemViews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            UzysSMMenuItemView *itemView = obj;
            itemView.targetFrame = CGRectMake(0, itemView.bounds.size.height*idx, itemView.bounds.size.width, itemView.bounds.size.height);
            itemView.alpha = 1;
            itemView.frame = itemView.targetFrame;
            itemView.backgroundView.alpha = 0.7;
            itemView.label.alpha = 1;
            itemView.seperatorView.alpha = 1;
            
            
        }];
        self.state = STATE_FULL_MENU;
    }
}

#pragma mark - Delegate
- (void)UzysSMMenuItemDidAction:(UzysSMMenuItemView *)itemView
{
    selectedItem = itemView;
    [self.itemViews removeObject:itemView];
    [self.itemViews insertObject:itemView atIndex:0];
    [self toggleMenu];
}
#pragma mark - help method
- (CGRect)getMainIconFrame:(UIView *)view
{
    UzysSMMenuItemView *itemView = [self.itemViews objectAtIndex:0];
    return [self convertRect:itemView.imageView.frame toView:view];
}
#pragma mark - Property
-(UzysSMState)menuState
{
    return _state;
}

-(UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event
{
    if(self.state == STATE_FULL_MENU)
    {
        if(CGRectContainsPoint(CGRectMake(self.scrollView.frame.origin.x,
                                          self.scrollView.frame.origin.y,
                                          self.scrollView.contentSize.width,
                                          self.scrollView.contentSize.height), point))
        {
            return [super hitTest:point withEvent:event];
        }
        else
        {
            return nil;
        }
    }
    else if(self.state == STATE_ICON_MENU)
    {
        UzysSMMenuItemView *view = [self.itemViews objectAtIndex:0];
        
        if(CGRectContainsPoint(view.imageView.frame, point))
        {
            return [super hitTest:point withEvent:event];
        }
        else
        {
            return nil;
        }
    }
    else if(self.state == STATE_MAIN_MENU)
    {
        UzysSMMenuItemView *view = [self.itemViews objectAtIndex:0];
        if(CGRectContainsPoint(view.frame, point))
        {
            return [super hitTest:point withEvent:event];
        }
        else
        {
            return nil;
        }
    }
       
    return nil;
}

@end
