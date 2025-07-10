// src/main/ets/MainAbility/components/QualityIndicator.ets
@Component
export struct QualityIndicator {
  @Prop name: string
  @Prop value: string
  @Prop status: string

  build() {
    Column() {
      Text(this.name)
        .fontSize(14)
        .fontColor('#666666')
      Text(this.value)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .margin({top: 5, bottom: 5})
      Text(this.status)
        .fontSize(12)
        .fontColor(this.status === '正常' ? '#07C160' : '#FF0000')
    }
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
    .height('100%')
    .width('100%')
  }
}