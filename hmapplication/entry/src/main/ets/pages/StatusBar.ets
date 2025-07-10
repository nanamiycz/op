// src/main/ets/MainAbility/components/StatusBar.ets
@Component
export struct StatusBar {
  build() {
    Row() {
      Text('无人监测船')
        .fontSize(18)
        .fontWeight(FontWeight.Bold)

      Row() {
        Progress({
          value: 85,
          total: 100,
          style: ProgressStyle.Ring
        })
          .width(40)
          .height(40)

        Column() {
          Text('4G信号强度: 85%')
            .fontSize(12)
          Text('GPS信号: 良好')
            .fontSize(12)
        }
        .margin({left: 10})
      }
    }
    .justifyContent(FlexAlign.SpaceBetween)
    .padding(15)
    .width('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .margin({bottom: 10})
  }
}