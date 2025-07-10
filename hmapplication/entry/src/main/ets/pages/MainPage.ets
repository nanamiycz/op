// src/main/ets/MainAbility/pages/MainPage.ets
import { StatusBar } from '../pages/StatusBar';
import { WaterQualityDashboard } from '../pages/WaterQualityDashboard';
import { MissionProgress } from '../pages/MissionProgress';
import { BottomNavBar } from '../pages/BottomNavBar';

@Entry
@Component
struct MainPage {
  build() {
    Column() {
      // 顶部状态栏
      StatusBar()

      // 主体内容
      Scroll() {
        Column() {
          // 监测船状态卡片
          // 实时数据仪表盘
          WaterQualityDashboard()

          // 任务进度条
          MissionProgress()
        }
        .padding(10)
      }
      .flexGrow(1)

      // 底部导航栏
      BottomNavBar()
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}