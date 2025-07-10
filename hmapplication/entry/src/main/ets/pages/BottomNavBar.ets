// src/main/ets/MainAbility/components/BottomNavBar.ets
import router from '@ohos.router';
import { prompt } from '@kit.ArkUI';

// 1. 统一定义导航项接口（包含跳转目标页面）
interface TabItem {
  name: string;
  icon: string;
  pageUrl: string; // 新增路由路径字段
}

interface GeneratedTypeLiteralInterface_1 {
  code?: number;
  message: string;
}

@Component
export struct BottomNavBar {
  @State currentIndex: number = 0;

  // 2. 定义导航配置（关联目标页面）
  private tabs: TabItem[] = [
    {
      name: '地图导航',
      icon: 'map',
      pageUrl: 'pages/MapNavigation' // 对应MapNavigation.ets
    },
    {
      name: '采样控制',
      icon: 'sampling',
      pageUrl: 'pages/SamplingControl' // 对应SamplingControl.ets
    },
    {
      name: '告警中心',
      icon: 'alert',
      pageUrl: 'pages/AlertCenter' // 对应AlertCenter.ets
    },
    {
      name: '设置',
      icon: 'settings',
      pageUrl: 'pages/Settings' // 对应Settings.ets
    }
  ];

  // 3. 处理路由跳转
  private navigateTo(pageUrl: string) {
    router.pushUrl({ url: pageUrl })
      .catch((err: GeneratedTypeLiteralInterface_1) => {
        console.error(`跳转到${pageUrl}失败:`, err.message);
        prompt.showToast({ message: `跳转失败: ${err.message}` });
      });
  }

  build() {
    Row() {
      ForEach(this.tabs, (item: TabItem, index: number) => {
        Column() {
          Image($r(`app.media.${item.icon}`))
            .width(24)
            .height(24)
            .objectFit(ImageFit.Contain)
          Text(item.name)
            .fontSize(12)
            .margin({ top: 5 })
        }
        .flexGrow(1)
        .justifyContent(FlexAlign.Center)
        .alignItems(HorizontalAlign.Center)
        .opacity(this.currentIndex === index ? 1 : 0.5)
        .onClick(() => {
          this.currentIndex = index;
          this.navigateTo(item.pageUrl); // 触发页面跳转
        })
      })
    }
    .height(60)
    .width('100%')
    .backgroundColor('#FFFFFF')
    .border({ width: 1, color: '#EEEEEE' })
  }
}