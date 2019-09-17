package com.manager.sign;

public class CommonSign {

    public enum UserPermission{
        NORMAL("正常"),FREEZE("冻结");

        public String text;
        private UserPermission(String text){
            this.text=text;
        }
    }

    public enum UserState{
        LOGOUT("离线","0"),LOGIN("在线","1");

        public String text,index;
        private UserState(String text,String index){
            this.text=text;this.index=index;
        }
    }

    public enum LoginType{
        LOGOUT("登出","1"),LOGIN("登入","2");

        public String text,index;
        private LoginType(String text,String index){
            this.text=text;this.index=index;
        }
    }

    public enum UserCharacter{
        STAFF("员工","0"),ADMIN("管理员","1");
        public String text;
        public String code;

        private UserCharacter(String text,String code){
            this.text=text;this.code=code;
        }
    }

    public enum SearchType{
        NAME("公司名称","0"),CODE("统一社会信用代码","1");
        public String text,index;

        private SearchType(String text,String index){
            this.text=text;this.index=index;
        }
    }

}
