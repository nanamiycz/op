// src/main/ets/MainAbility/components/WaterQualityDashboard.ets
import { QualityIndicator } from './QualityIndicator';
@Entry
@Component
export struct WaterQualityDashboard {
  build() {
    Grid() {
      GridItem() {
        QualityIndicator({ name: 'PH值', value: '7.2', status: '正常' })
      }
      GridItem() {
        QualityIndicator({ name: '溶解氧', value: '6.8mg/L', status: '正常' })
      }
      GridItem() {
        QualityIndicator({ name: '浊度', value: '28 NTU', status: '正常' })
      }
      GridItem() {
        QualityIndicator({ name: '水温', value: '22.5℃', status: '正常' })
      }
    }
    .columnsTemplate('1fr 1fr')
    .rowsTemplate('1fr 1fr')
    .height(200)
    .width('100%')
    .backgroundColor('#FFFFFF')
    .borderRadius(10)
    .margin({bottom: 10})
  }
}