<template>
    <div id="dj">
        <div class="one">
            <div class="left">
                <img :src="require('../../assets/images/icon/dj_image/gerenshouye/portrait.png')" >
                <a href="javascript:;">点击登录</a>
            </div>
            <div class="right">
                <a href="javascript:;">></a>
            </div>
        </div>
        <div class="lastone">
            <ul >
                <li>
                    <p>0</p>
                    <b>动态</b>
                </li>
                <li>
                    <p>0</p>
                    <b>关注</b>
                </li>
                <li>
                    <p>0</p>
                    <b>粉丝</b>
                </li>
            </ul>
            <router-link to="">
                <img src="../../assets/images/icon/dj_image/gerenshouye/sign.png" >
            </router-link>
        </div>
        <div class="two">
            <div>
                <img src="../../assets/images/icon/dj_image/gerenshouye/collect.png">
                <p>我的收藏</p>
            </div>
            <div>
                <img src="../../assets/images/icon/dj_image/gerenshouye/comment.png">
                <p>我的评论</p>
            </div>
            <div>
                <img src="../../assets/images/icon/dj_image/gerenshouye/Like.png">
                <p>我的点赞</p>
            </div>
            <div>
                <img src="../../assets/images/icon/dj_image/gerenshouye/history.png">
                <p>浏览历史</p>
            </div>
        </div>
        <div class="three"></div>
        <div class="four"></div>
        <div class="five"></div>
    </div>
</template>
<style lang="scss" scoped>
img{
    max-width: 100%;
}
#dj{
    min-height: 100vh;
    box-sizing: border-box;
    &>div:not(:first-child){
        border-bottom: 3px solid #e8e8e8;
    }
    .one{
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        align-items: center;
        height: 80px;
        .left{
            font-size: 1.2rem;
            a{
            display: inline-block;
            flex: 0 0 60%;
            color: #000;
            margin-bottom: 14px;
            margin-left: 5px;
            overflow: hidden;
         
            }
               
        }
        .right{
            flex: 0 0 10%;
            margin-left: -100px;
            a{
                color: #000;
            }
        }
    }
    .lastone{
        ul{
            display: flex;
            font-weight: 900;
            li{
                margin-right: 20px;
            }
            &>li:nth-child(1){
                border-right: 1px solid #666;
                padding-right: 15px;
            }
            &>li:nth-child(2){
                border-right: 1px solid #666;
                padding-right: 15px;
            }
        }
        a{
            position: relative;
            right: -178px;
            top: -31px;
        }
    }
    .two{
        display: flex;
        flex-direction: row;
        justify-content: space-around;
        align-items: center;
        &>div{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            img{
                margin-bottom: 10px;
            }
        }
    }
}

</style>

<script>
export default {
    
}
</script>