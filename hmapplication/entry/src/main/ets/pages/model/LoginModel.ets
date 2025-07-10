// entry/src/main/ets/model/LoginModel.ets
import prompt from '@ohos.prompt';
import router from '@ohos.router';
import preferences from '@ohos.data.preferences';

export default class LoginModel {
  private static prefs: preferences.Preferences | null = null;

  // 修改1：移除this引用，改为直接使用类名
  private static async initPreferences(): Promise<void> {
    try {
      LoginModel.prefs = await preferences.getPreferences(globalThis.abilityContext, 'userData');
    } catch (err) {
      prompt.showToast({ message: '存储初始化失败', duration: 2000 });
      console.error("Preferences初始化错误:", err);
    }
  }

  static async login(username: string, password: string, remember: boolean): Promise<void> {
    if (!username || !password) {
      prompt.showToast({ message: '请输入用户名和密码', duration: 2000 });
      return;
    }

    // 修改2：静态方法调用使用类名而非this
    if (!LoginModel.prefs) {
      await LoginModel.initPreferences();
    }

    // 修改3：setTimeout回调中使用类名
    setTimeout(async () => {
      prompt.showToast({ message: '登录成功', duration: 2000 });

      if (remember && LoginModel.prefs) {
        try {
          await LoginModel.prefs.put('username', username);
          await LoginModel.prefs.put('password', password);
          await LoginModel.prefs.flush();
          console.log('登录信息已保存');
        } catch (err) {
          console.error('保存登录信息失败:', err);
        }
      }

      router.replaceUrl({ url: 'pages/MainPage' });
    }, 1000);
  }
}