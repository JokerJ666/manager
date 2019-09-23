
import {localStorage} from '../storage'
export default new class UserUtil {
  constructor() {
  }

  getLoginInfo(){
    var loginInfo = localStorage.get("loginInfo");
    return loginInfo;
  }
}
