<template>
  <transition>
    <div class="login">
      <div class="one">
        <router-link to="/me">
          <img src="/img/aa/cha.png" />
        </router-link>
      </div>
      <div class="two">
        <ul>
          <li>
            <h1>验证码登录</h1>
          </li>
          <li>
            <input
              id="phone"
              v-model="phone"
              type="text"
              placeholder="请输入手机号"
            />
          </li>
          <li>
            <input
              id="yzm"
              type="text"
              maxlength="6"
              placeholder="请输入验证码"
              v-model="dxyzm"
            />
            <a class="yzm" @click="yzm" href="javascript:;">获取验证码</a>
          </li>
          <li>
            <mt-button size="large" v-if="dxyzmState == true">登录</mt-button>
            <mt-button size="large" @click="login" type="danger" v-else
              >登录</mt-button
            >
          </li>
        </ul>
      </div>
      <div class="three">
        <div>
          <img src="/img/aa/denglu.png" alt="" />
          <p>密码登录</p>
        </div>
        <div>
          <img src="/img/aa/vx.png" alt="" />
          <p>微信登陆</p>
        </div>
        <div>
          <img src="/img/aa/qq.png" alt="" />
          <p>QQ登录</p>
        </div>
      </div>
      <div class="four">
        <b>登录即同意</b><router-link to="#">用户协议</router-link>及
        <router-link to="#">隐私政策</router-link>
      </div>
    </div>
  </transition>
</template>
<style scoped>
* {
  box-sizing: border-box;
}
.login {
  width: 100% !important;
  min-height: 100vh;
  padding: 0 30px;
  margin-top: 10px;
}
.login .one {
  text-align: left;
  position: relative;
  left: -25px;
}
.login .two {
  margin-top: 50px;
}
.login .two ul li {
  margin-top: 20px;
}
.login .two ul li:nth-child(1) {
  text-align: left;
  font-weight: 900;
  font-size: 1.5rem;
}
.login .two ul li:nth-child(2) input,
.login .two ul li:nth-child(3) input {
  width: 100%;
  height: 30px;
  border: 0px;
  border-bottom: 1px solid #e8e8e8;
}
.login .two ul li:nth-child(2) :last-child,
.login .two ul li:nth-child(2) :first-child,
.login .two ul li:nth-child(3) :last-child,
.login .two ul li:nth-child(3) :first-child {
  font-size: 16px;
  color: #666;
}
.login .two ul li:nth-child(3) {
  position: relative;
}
.login .two ul li:nth-child(3) > input {
  width: 50%;
}
.login .two ul li:nth-child(3) a {
  position: absolute;
  right: 10px;
  top: 0px;
  color: black !important;
  font-size: 18px !important;
}
.login .two ul li:nth-child(4) {
  color: #666;
  opacity: 0.8;
}
.login .three,
.login .four {
  font-size: 14px;
  text-align: center;
  color: #666;
  margin-top: 15px;
}
.login .three p,
.login .three b,
.login .four p,
.login .four b {
  opacity: 0.8;
}
.login .three a,
.login .four a {
  color: #0051ff;
}
.login .three {
  display: flex;
  justify-content: space-around;
  margin-top: 300px;
}
.login .three p {
  margin-top: 10px;
}
.login .four {
  margin-top: 30px;
}
</style>

<script>
export default {
  data() {
    return {
      isShow: false,
      sj: "",
      phone: "",
      dxyzm: "",
      dxyzmState: true,
    };
  },
  methods: {
    yzm() {
      let my_auth = [];
      for (let i = 0; i <= 9; i++) {
        my_auth.push(i);
      }
      let phone = this.phone;
      if (!phone) {
        this.$toast({
          message: "手机号不能为空！",
          position: "middle",
          duration: 1500,
        });
        return;
      }
      let sjh = phone.search(/^1[3-9]\d{9}$/);
      if (sjh == -1) {
        this.$toast({
          message: "您输入的手机号无效！",
          position: "middle",
          duration: 1500,
        });
        return;
      } else {
        // 随机产生4位
        let sj = (this.sj = "");
        for (let i = 0; i < 6; i++) {
          let a = parseInt(Math.random() * my_auth.length);
          sj += my_auth[a];
        }
        this.$toast({
          message: `验 证 码 为 ：${sj}`,
          position: "top",
          duration: 4500,
        });
        this.sj = sj;
      }
    },
    login() {
      // 判断验证码是否正确
      if (this.dxyzm != this.sj) {
        this.$toast({
          message: "验证码错误！！",
          position: "middle",
          duration: 2000,
        });
        return;
      }
      this.$indicator.open({
        text: "正在登录",
        spinnerType: "snake",
      });
      let obj = { name: this.phone };
      this.axios.post("/ak/login", this.qs.stringify(obj)).then((res) => {
        this.$store.commit("loginMutation", res.data.info);
        localStorage.setItem("isLogined", 1);
        localStorage.setItem("info", JSON.stringify(res.data.info));
        this.$indicator.close();
        this.$router.push('/me')
      });
    },
  },
  watch: {
    dxyzm() {
      if (this.sj && this.dxyzm.length == 6) {
        this.dxyzmState = false;
      } else {
        this.dxyzmState = true;
      }
    },
  },
};
</script>