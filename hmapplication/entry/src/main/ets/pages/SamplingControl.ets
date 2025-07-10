// src/main/ets/pages/SamplingControl.ets
import { prompt } from '@kit.ArkUI';
import router from '@ohos.router';
import { borderStyles } from '@kit.ArkUI';

interface DeviceOption {
  value: string;
  name: string;
}

@Entry
@Component
struct SamplingControl {
  @State isCollecting: boolean = false;
  @State currentTime: string = '09:41';
  @State devices: DeviceOption[] = [
    { value: 'device-01', name: '数据采集器-01' },
    { value: 'device-02', name: '数据采集器-02' },
    { value: 'device-03', name: '数据采集器-03' }
  ];
  @State selectedDevice: string = 'device-01';

  build() {
    Column() {
      // 顶部状态栏（带返回按钮）
      Button('< 返回')
        .fontSize(16)
        .fontColor('#007DFF')
        .backgroundColor(Color.Transparent)
        .onClick(() => router.back())
        .margin({ left : -270})




      Row() {
        // 返回按钮

        Text(this.currentTime)
          .fontSize(16)
          .fontColor('#000000')
        Blank()

        Text('采集控制')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)

        Blank()

        Image($r("app.media.refresh"))
          .width(24)
          .height(24)
          .margin({ right: 15 })

        Image($r("app.media.setings"))
          .width(24)
          .height(24)
      }
      .width('100%')
      .margin({ bottom: 20 })

      // 设备状态卡片
      Column() {
        Row() {
          Text(this.devices.find(d => d.value === this.selectedDevice)?.name || '')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)

          Text('正常运行中')
            .fontSize(14)
            .fontColor('#52C41A')
            .margin({ left: 10 })
        }
        .alignSelf(ItemAlign.Start)

        // 数据指标网格
        Grid() {
          GridItem() {
            Column() {
              Text('168小时')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('运行时长')
                .fontSize(12)
                .fontColor('#666666')
            }
          }

          GridItem() {
            Column() {
              Text('100Hz')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('采样频率')
                .fontSize(12)
                .fontColor('#666666')
            }
          }

          GridItem() {
            Column() {
              Text('1.2GB')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('数据量')
                .fontSize(12)
                .fontColor('#666666')
            }
          }

          GridItem() {
            Column() {
              Text('-75dBm')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('信号强度')
                .fontSize(12)
                .fontColor('#666666')
            }
          }

          GridItem() {
            Column() {
              Text('85%')
                .fontSize(16)
                .fontWeight(FontWeight.Medium)
              Text('电池电量')
                .fontSize(12)
                .fontColor('#666666')
            }
          }
        }
        .columnsTemplate('1fr 1fr 1fr')
        .rowsGap(15)
        .columnsGap(10)
        .margin({ top: 15 })
      }
      .width('100%')
      .height('280px')
      .padding(15)
      .borderRadius(12)
      .backgroundColor('#F7F8FA')

      // 控制按钮
      Row() {
        Button('开始采集', { type: ButtonType.Capsule })
          .width(140)
          .height(40)
          .backgroundColor('#007DFF')
          .fontColor('#FFFFFF')
          .onClick(() => {
            this.isCollecting = true;
            prompt.showToast({ message: '采集已启动' });
          })
          .margin({ right: 20 })

        Button('停止采集', { type: ButtonType.Capsule })
          .width(140)
          .height(40)
          .backgroundColor('#FF4D4F')
          .fontColor('#FFFFFF')
          .onClick(() => {
            this.isCollecting = false;
            prompt.showToast({ message: '采集已停止' });
          })
      }
      .margin({ top: 20, bottom: 30 })

      // 设备选择下拉框
      Select(this.devices)
        .value(this.selectedDevice)
        .onSelect((index: number) => {
          this.selectedDevice = this.devices[index].value;
        })
        .width('90%')
        .margin({ bottom: 20 })

      // 设置项
      Column() {
        this.buildSettingItem('采样频率设置', '100Hz')
        this.buildSettingItem('采集时长设置', '无限')
        this.buildSettingItem('触发条件设置', '自动')
        this.buildSettingItem('存储位置选择', '本地存储')
      }
      .width('90%')

      // 最近记录
      Text('最近记录')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 30, bottom: 15 })
        .alignSelf(ItemAlign.Start)
        .width('90%')

      // 记录列表
      Column() {
        this.buildRecordItem('2024-01-20 14:30', '2.5GB', '已完成')
        this.buildRecordItem('2024-01-20 12:15', '1.8GB', '已完成')

      }
      .width('90%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF')
    .padding(15)
  }

  // 构建设置项组件
  @Builder
  buildSettingItem(title: string, value: string) {
    Row() {
      Text(title)
        .fontSize(16)
        .fontColor('#333333')

      Blank()

      Text(value)
        .fontSize(16)
        .fontColor('#666666')
        .margin({ right: 10 })

      Image($r("app.media.c"))
        .width(16)
        .height(16)
    }
    .width('100%')
    .height(50)
    .border({
      width: { bottom: 1 },
      color: { bottom: '#EEEEEE' },
      style: BorderStyle.Solid
    })
  }

  // 构建记录项组件
  @Builder
  buildRecordItem(date: string, size: string, status: string) {
    Column() {
      Row() {
        Text(date)
          .fontSize(14)
          .fontColor('#333333')

        Blank()

        Text(`数据大小：${size}`)
          .fontSize(14)
          .fontColor('#666666')
      }
      .width('100%')

      Row() {
        Blank()

        Text(status)
          .fontSize(14)
          .fontColor('#52C41A')
      }
      .width('100%')
      .margin({ top: 5 })
    }
    .width('100%')
    .padding(10)
    .border({
      width: { bottom: 1 },
      color: { bottom: '#EEEEEE' },
      style: BorderStyle.Solid
    })
  }
}