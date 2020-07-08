<template>
    <view>
		<cu-custom bgColor="bg-black" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">关注</block>
		</cu-custom>
        <view class="uni-padding-wrap">
            <view class="uni-comment">
			<!-- 粉丝区 start -->	
				<block v-for="(item,index) in userlist" :key="index">
					<view class="uni-comment-list">
						<view class="uni-comment-face">
							<image :src="item.headimg?item.headimg:'../../static/touxiang.png'" mode="widthFix"></image>
						</view>
						<view class="uni-comment-body">
							<view class="uni-comment-top">
								<text>{{item.nickname}}</text>
							</view>
							<view class="uni-comment-content">你关注了</view>
							<view class="uni-comment-date">
								<view class="uni-comment-replay-btn1" v-if="item.is_he_fans==2" @click="addfollow(item.uid,index)">关注</view>
								<view class="uni-comment-replay-btn1" v-if="item.is_he_fans==false" @click="delFollow(item.uid,index)">取消关注</view>
								<view class="uni-comment-replay-btn" v-if="item.is_he_fans==true" @click="delFollow(item.uid,index)">相互关注</view>
							</view>
						</view>
					</view>
				</block>
				<!-- 粉丝区结束 -->
            </view>
        </view>
    </view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
    export default {
        data() {
            return {
                userlist:[]
            }
        },
		onShow() {
			this.MyFansList();
		},
		methods:{
			addfollow(toid,index){
				uni.showLoading({});
				api.post({
					url:'Api/FollowApi/addFollow',
					data:{openid:uni.getStorageSync('userinfo').openid,toid:toid},
					success:res=>{
						if(res.status==1){
							uni.hideLoading();
							let is_he_fans = {
								nickname:this.userlist[index].nickname,
								headimg:this.userlist[index].headimg,
								sex:this.userlist[index].sex,
								is_he_fans:res.data,
								uid:this.userlist[index].uid,
							};
							this.$set(this.userlist,index,is_he_fans)
						}
					}
				})
			},
			delFollow(toid,index){
				
				uni.showLoading({});
				api.post({
					url:'Api/FollowApi/DelFollow',
					data:{openid:uni.getStorageSync('userinfo').openid,toid:toid},
					success:res=>{
						if(res.status==1){
							uni.hideLoading();
							let is_he_fans = {
								nickname:this.userlist[index].nickname,
								headimg:this.userlist[index].headimg,
								sex:this.userlist[index].sex,
								is_he_fans:2,
								uid:this.userlist[index].uid,
							};
							this.$set(this.userlist,index,is_he_fans)
						}
					}
				})
			},
			MyFansList(){
				api.get({
					url:'Api/FollowApi/GetMyFollowList',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						if(res.status==1){
							this.userlist = res.data
						}
					}
				})
			}
		}
    }
</script>

<style>
    /* comment */
    page {
        background-color: #18191d;
    }

    .uni-padding-wrap {
        padding: 30upx;
    }

    view {
        font-size: 28upx;
    }

    .uni-comment {
        padding: 5rpx 0;
        display: flex;
        flex-grow: 1;
        flex-direction: column;
    }

    .uni-comment-list {
        flex-wrap: nowrap;
        padding: 10rpx 0;
        margin: 10rpx 0;
        width: 100%;
        display: flex;
    }

    .uni-comment-face {
        width: 70upx;
        height: 70upx;
        border-radius: 50%;
        margin-right: 20upx;
        flex-shrink: 0;
        overflow: hidden;
    }

    .uni-comment-face image {
        width: 100%;
        /* border-radius: 50%; */
    }

    .uni-comment-body {
        width: 100%;
    }

    .uni-comment-top {
		width: 60%;
		float: left;
        line-height: 1.5em;
        justify-content: space-between;
    }

    .uni-comment-top text {
        color: #0A98D5;
        font-size: 24upx;
    }

    .uni-comment-date {
        line-height: 18upx;
        flex-direction: row;
        justify-content: space-between;
        display: flex !important;
        flex-grow: 1;
		float: right;
    }

    .uni-comment-date view {
        color: #666666;
        font-size: 24upx;
        line-height: 38upx;
    }
	.uni-comment-replay-btn,.uni-comment-replay-btn1 {
	    background: #c1c1c1;
	    font-size: 24upx;
	    line-height: 28upx;
	    padding: 5rpx 20upx;
	    border-radius: 30upx;
	    color: #fff !important;
	    margin: 0 10upx;
	}
	.uni-comment-replay-btn1{
		background: #ff5500;
	}
    .uni-comment-content {
		width: 60%;
		float: left;
        line-height: 1.6em;
        font-size: 28upx;
        padding: 8rpx 0;
		color: #f7f7f7;
    }
</style>
