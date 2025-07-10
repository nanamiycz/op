
// src/main/ets/MainAbility/pages/Index.ets
import router from '@ohos.router';

@Entry
@Component
struct Index {
  build() {
    Column() {
      Button('进入操控平台')
        .type(ButtonType.Capsule)
        .width('50%')
        .height(50)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/MainPage'
          })
        })
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center)
  }
}