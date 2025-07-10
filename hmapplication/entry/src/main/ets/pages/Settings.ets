// src/main/ets/MainAbility/pages/Settings.ets
import router from '@ohos.router';
import prompt from '@ohos.prompt';

// 1. 明确定义SettingItemOptions接口
interface SettingItemOptions {
  toggle?: boolean;
  isOn?: boolean;
  onChange?: (isOn: boolean) => void;
  value?: string;
}

@Entry
@Component
struct Settings {
  @State darkModeEnabled: boolean = false;
  @State notificationEnabled: boolean = true;

  build() {
    Column() {
      // 顶部状态栏（保持不变）
      Row() {
        Text('9:41')
          .fontSize(16)
          .fontColor('#000000')

        Blank()

        Text('设置')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Blank()

        Row() {
          Image($r("app.media.signal"))
            .width(18)
            .height(18)
          Image($r("app.media.wifi"))
            .width(18)
            .height(18)
            .margin({ left: 5 })
          Image($r("app.media.battery"))
            .width(18)
            .height(18)
            .margin({ left: 5 })
        }
      }
      .width('100%')
      .padding(15)
      .margin({ bottom: 10 })

      // 用户信息区域（保持不变）
      Row() {
        Image($r("app.media.avatar"))
          .width(60)
          .height(60)
          .borderRadius(30)
          .margin({ right: 15 })

        Column() {
          Text('张小明')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
          Text('138****8888')
            .fontSize(14)
            .fontColor('#888888')
            .margin({ top: 5 })
        }
        .alignItems(HorizontalAlign.Start)
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#FFFFFF')

      // 设置项列表
      List({ space: 1 }) {
        // 账户与安全分组
        ListItem() {
          Text('账户与安全')
            .fontSize(16)
            .fontColor('#888888')
        }
        .padding({ left: 15, top: 10, bottom: 5 })
        .backgroundColor('#F5F5F5')

        // 2. 修复调用方式（添加类型断言）
        this.buildSettingItem('账户信息', $r("app.media.avatar"))
        this.buildSettingItem('隐私设置', $r("app.media.privacy"))
        this.buildSettingItem('安全中心', $r("app.media.ic_security"))
        this.buildSettingItem('实名认证', $r("app.media.ic_authentication"))

        // 通用设置分组
        ListItem() {
          Text('通用设置')
            .fontSize(16)
            .fontColor('#888888')
        }
        .padding({ left: 15, top: 15, bottom: 5 })
        .backgroundColor('#F5F5F5')

        this.buildSettingItem('通知提醒', $r("app.media.ic_notification"), {
          toggle: true,
          isOn: this.notificationEnabled,
          onChange: (isOn: boolean) => { this.notificationEnabled = isOn }
        } as SettingItemOptions)

        this.buildSettingItem('深色模式', $r("app.media.ic_dark_mode"), {
          toggle: true,
          isOn: this.darkModeEnabled,
          onChange: (isOn: boolean) => { this.darkModeEnabled = isOn }
        } as SettingItemOptions)

        this.buildSettingItem('清除缓存', $r("app.media.ic_clear_cache"), {
          value: '1.2GB'
        } as SettingItemOptions)

        this.buildSettingItem('关于我们', $r("app.media.ic_about"))
        this.buildSettingItem('帮助与反馈', $r("app.media.ic_help"))
      }
      .width('100%')
      .flexGrow(1)

      // 底部信息（保持不变）
      Text('当前版本 v2.0.1')
        .fontSize(12)
        .fontColor('#888888')
        .margin({ top: 10, bottom: 5 })

      Button('退出登录')
        .width('90%')
        .height(40)
        .fontColor('#FF4D4F')
        .backgroundColor('#FFFFFF')
        .margin({ bottom: 20 })
        .onClick(() => {
          prompt.showToast({ message: '已退出登录' });
        })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(this.darkModeEnabled ? '#222222' : '#F5F5F5')
  }

  // 3. 更新方法签名
  @Builder
  buildSettingItem(name: string, icon: Resource, options?: SettingItemOptions) {
    ListItem() {
      Row() {
        Image(icon)
          .width(20)
          .height(20)
          .margin({ right: 15 })

        Text(name)
          .fontSize(16)
          .flexGrow(1)

        if (options?.toggle) {
          Toggle({ type: ToggleType.Switch, isOn: options.isOn })
            .onChange((isOn: boolean) => {
              if (options.onChange) {
                options.onChange(isOn);
              }
            })
        } else if (options?.value) {
          Text(options.value)
            .fontSize(14)
            .fontColor('#888888')
            .margin({ right: 5 })
        }

        if (!options?.toggle) {
          Image($r("app.media.c"))
            .width(16)
            .height(16)
        }
      }
      .width('100%')  // 确保宽度100%
      .padding(15)
    }
    .width('100%')    // 确保宽度100%
    .backgroundColor('#FFFFFF')
  }
}