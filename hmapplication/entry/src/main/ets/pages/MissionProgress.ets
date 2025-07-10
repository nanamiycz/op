// src/main/ets/MainAbility/components/MissionProgress.ets
@Component
export struct MissionProgress {
  build() {
    Column() {
      Row() {
        Text('例行巡航采样')
          .fontSize(16)
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)

        Text('预计 16:30 完成')
          .fontSize(12)
          .fontColor('#888888')
      }
      .margin({bottom: 10})
      .width('100%')

      Progress({
        value: 5,
        total: 8,
        style: ProgressStyle.Linear
      })
        .height(6)

      Text('已完成 5/8 个采样点')
        .fontSize(12)
        .fontColor('#888888')
        .margin({top: 5})
        .alignSelf(ItemAlign.Start)  // 这里修改为 ItemAlign.Start
    }
    .padding(15)
    .width('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
  }
}