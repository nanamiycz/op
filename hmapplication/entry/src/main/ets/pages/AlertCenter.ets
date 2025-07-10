// src/main/ets/MainAbility/pages/AlertCenter.ets
import router from '@ohos.router';

interface AlertItem {
  id: number;
  title: string;
  description: string;
  time: string;
  status: '未处理' | '处理中' | '已完成';
  level: '紧急' | '重要' | '普通';
}

@Entry
@Component
struct AlertCenter {
  @State currentTab: string = '全部';
  @State alerts: AlertItem[] = [
    {
      id: 1,
      title: '水质异常告警',
      description: 'PH值超过安全阈值（8.5）',
      time: '10:30',
      status: '未处理',
      level: '紧急'
    },
    {
      id: 2,
      title: '设备离线',
      description: '溶解氧传感器失去连接',
      time: '09:45',
      status: '处理中',
      level: '重要'
    },
    {
      id: 3,
      title: '存储空间不足',
      description: '剩余存储空间低于10%',
      time: '昨天 15:10',
      status: '已完成',
      level: '普通'
    }
  ];

  build() {
    Column() {
      // 顶部导航栏（带返回按钮）
      Row() {
        Button('< 返回')
          .fontSize(16)
          .fontColor('#007DFF')
          .backgroundColor(Color.Transparent)
          .onClick(() => router.back())
          .margin({ right: 10 })

        Text('9:41')
          .fontSize(16)
          .fontColor('#000000')

        Blank()

        Text('告警中心')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Blank()

        Image($r("app.media.setings"))
          .width(24)
          .height(24)
      }
      .width('100%')
      .padding(10)
      .margin({ bottom: 10 })

      // 选项卡导航
      Row() {
        ForEach(['全部', '未处理', '处理中', '已完成'], (tab: string) => {
          Button(tab)
            .fontSize(14)
            .fontColor(this.currentTab === tab ? '#FFFFFF' : '#007DFF')
            .backgroundColor(this.currentTab === tab ? '#007DFF' : '#F5F5F5')
            .borderRadius(20)
            .onClick(() => { this.currentTab = tab })
            .margin({ right: 10 })
        })
      }
      .width('100%')
      .padding({ left: 15, right: 15, bottom: 15 })

      // 告警列表
      List({ space: 15 }) {
        ForEach(this.getFilteredAlerts(), (item: AlertItem) => {
          ListItem() {
            Column() {
              Row() {
                Text(item.title)
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor(this.getLevelColor(item.level))

                Blank()

                Text(item.time)
                  .fontSize(12)
                  .fontColor('#888888')
              }
              .width('100%')

              Text(item.description)
                .fontSize(14)
                .fontColor('#666666')
                .margin({ top: 5 })

              Row() {
                Text(item.status)
                  .fontSize(12)
                  .fontColor(this.getStatusColor(item.status))
                  .padding({ left: 8, right: 8, top: 2, bottom: 2 })
                  .backgroundColor(this.getStatusBgColor(item.status))
                  .borderRadius(10)
              }
              .margin({ top: 10 })
              .alignSelf(ItemAlign.Start)
            }
            .padding(15)
          }
          .borderRadius(10)
          .backgroundColor('#FFFFFF')
          .shadow({ radius: 2, color: '#10000000', offsetX: 0, offsetY: 1 })
        })
      }
      .width('100%')
      .flexGrow(1)
      .padding({ left: 15, right: 15 })

      // 底部统计栏
      Row() {
        Text(`共${this.alerts.length}条告警`)
          .fontSize(14)
          .fontColor('#666666')

        Text(`紧急: ${this.getAlertCount('紧急')}`)
          .fontSize(14)
          .fontColor('#FF4D4F')
          .margin({ left: 15 })

        Text(`重要: ${this.getAlertCount('重要')}`)
          .fontSize(14)
          .fontColor('#FFA500')
          .margin({ left: 10 })

        Text(`普通: ${this.getAlertCount('普通')}`)
          .fontSize(14)
          .fontColor('#888888')
          .margin({ left: 10 })
      }
      .width('100%')
      .padding(15)
      .backgroundColor('#FFFFFF')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }

  // 辅助方法（显式类型定义）
  private getFilteredAlerts(): AlertItem[] {
    return this.currentTab === '全部'
      ? this.alerts
      : this.alerts.filter(item => item.status === this.currentTab);
  }

  private getAlertCount(level: '紧急' | '重要' | '普通'): number {
    return this.alerts.filter(item => item.level === level).length;
  }

  private getLevelColor(level: '紧急' | '重要' | '普通'): ResourceColor {
    switch(level) {
      case '紧急':
        return '#FF4D4F';
      case '重要':
        return '#FFA500';
      case '普通':
        return '#666666';
      default:
        return '#666666';
    }
  }

  private getStatusColor(status: '未处理' | '处理中' | '已完成'): ResourceColor {
    switch(status) {
      case '未处理':
        return '#FF4D4F';
      case '处理中':
        return '#1890FF';
      case '已完成':
        return '#52C41A';
      default:
        return '#666666';
    }
  }

  private getStatusBgColor(status: '未处理' | '处理中' | '已完成'): ResourceColor {
    switch(status) {
      case '未处理':
        return '#FFF1F0';
      case '处理中':
        return '#E6F7FF';
      case '已完成':
        return '#F6FFED';
      default:
        return '#F5F5F5';
    }
  }
}