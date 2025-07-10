// src/main/ets/MainAbility/pages/MapNavigation.ets
import router from '@ohos.router';

@Entry
@Component
struct MapNavigation {
  build() {
    Column() {
      // 顶部导航栏
      Row() {
        // 返回按钮
        Button('←')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .width(40)
          .height(40)
          .backgroundColor('#000')
          .onClick(() => {
            router.back(); // 返回上一页
          })
          .margin({right: 10})

        Text('地图导航')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
      .justifyContent(FlexAlign.Start)
      .margin({top: 10, bottom: 20})

      // 地图区域
      Image($r('app.media.map'))
        .width('90%')
        .aspectRatio(1)
        .borderRadius(10)

      // 地图控制按钮
      Row() {
        Button('放大')
          .type(ButtonType.Normal)
        Button('缩小')
          .type(ButtonType.Normal)
          .margin({left: 10})
        Button('定位')
          .type(ButtonType.Normal)
          .margin({left: 10})
      }
      .margin({top: 20})
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .alignItems(HorizontalAlign.Center)
  }
}