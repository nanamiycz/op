// entry/src/main/ets/pages/Index.ets
import router from '@ohos.router';
import { prompt } from "@kit.ArkUI";

interface DeviceInfo {
  id: string;
  status: string;
}

@Entry
@Component
struct Index {
  @State username: string = 'admin'
  @State password: string = '123456'
  @State rememberPwd: boolean = false
  @State secureConnection: boolean = true
  @State deviceInfo: DeviceInfo = {
    id: 'WQ-2024-0001',
    status: '待连接'
  };

  // 登录按钮点击处理
  private handleLogin() {
    // 简单验证输入
    if (!this.username || !this.password) {
      prompt.showToast({ message: '请输入用户名和密码' });
      return;
    }

    // 执行跳转到Index1页面
    router.pushUrl({
      url: 'pages/index1',
      params: {
        username: this.username,
        deviceId: this.deviceInfo.id
      }
    })// 明确定义错误类型
      .catch((err: Error) => {  // 替换原来的any类型
        console.error('跳转失败:', err.message);
        prompt.showToast({ message: '页面跳转失败' });
      });
  }

  build() {
    Column() {
      // 标题部分
      Column() {
        Image($r('app.media.logo'))
          .width(60)
          .height(60)
          .margin({ top: 20, bottom: 10 })
        Text('水质监测船远程操控系统')
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .margin({bottom: 8})
        Text('专业级水质监测解决方案')
          .fontSize(14)
          .fontColor('#666666')
      }
      .width('100%')
      .margin({top: 40, bottom: 30})
      .alignItems(HorizontalAlign.Center)

      // 用户名输入框
      Row() {
        Checkbox({name: '', group: 'username'})
          .selectedColor('#007DFF')
          .width(20)
          .height(20)
          .margin({right: 10})
        Text('请输入用户名/工号')
          .fontSize(16)
      }
      .width('80%')
      .margin({bottom: 15})

      TextInput()
        .type(InputType.Normal)
        .width('80%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .borderRadius(4)
        .margin({bottom: 20})
        .onChange((value: string) => {
          this.username = value
        })

      // 密码输入框
      Row() {
        Checkbox({name: '', group: 'password'})
          .selectedColor('#007DFF')
          .width(20)
          .height(20)
          .margin({right: 10})
        Text('请输入密码')
          .fontSize(16)
      }
      .width('80%')
      .margin({bottom: 15})

      TextInput()
        .type(InputType.Password)
        .width('80%')
        .height(40)
        .backgroundColor('#F5F5F5')
        .borderRadius(4)
        .margin({bottom: 30})
        .onChange((value: string) => {
          this.password = value
        })

      // 分割线
      Divider()
        .strokeWidth(1)
        .color('#EEEEEE')
        .width('80%')
        .margin({bottom: 20})

      // 登录选项
      Column() {
        // 记住密码
        Row() {
          Checkbox({name: '', group: 'remember'})
            .selectedColor('#007DFF')
            .width(20)
            .height(20)
            .select(this.rememberPwd)
            .onChange((checked: boolean) => {
              this.rememberPwd = checked
            })
            .margin({right: 10})
          Text('记住密码')
            .fontSize(14)
        }
        .width('80%')
        .margin({bottom: 10})

        // 忘记密码
        Row() {
          Checkbox({name: '', group: 'forget'})
            .selectedColor('#007DFF')
            .width(20)
            .height(20)
            .margin({right: 10})
          Text('忘记密码？')
            .fontSize(14)
        }
        .width('80%')
        .margin({bottom: 30})
      }

      // 设备信息
      Column() {
        Row() {
          Checkbox({name: '', group: 'device'})
            .selectedColor('#007DFF')
            .width(20)
            .height(20)
            .select(true)
            .margin({right: 10})
          Text('设备信息')
            .fontSize(14)
        }
        .width('80%')
        .margin({bottom: 10})

        Text(`设备编号：${this.deviceInfo.id}`)
          .fontSize(12)
          .width('80%')
          .textAlign(TextAlign.Start)
          .margin({bottom: 5})

        Text(`设备状态：${this.deviceInfo.status}`)
          .fontSize(12)
          .width('80%')
          .textAlign(TextAlign.Start)
          .margin({bottom: 20})
      }

      // 安全连接
      Row() {
        Checkbox({name: '', group: 'secure'})
          .selectedColor('#007DFF')
          .width(20)
          .height(20)
          .select(this.secureConnection)
          .onChange((checked: boolean) => {
            this.secureConnection = checked
          })
          .margin({right: 10})
        Text('安全加密连接')
          .fontSize(12)
      }
      .width('80%')
      .margin({bottom: 10})

      // 登录按钮（添加点击事件）
      Button('登录', {type: ButtonType.Capsule})
        .width('80%')
        .height(45)
        .backgroundColor('#007DFF')
        .fontColor('#FFFFFF')
        .onClick(() => this.handleLogin())

      // 版权信息
      Text('© 2024 水质监测系统')
        .fontSize(12)
        .fontColor('#999999')
        .margin({top: 30})
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
    .backgroundColor('#FFFFFF')
  }
}