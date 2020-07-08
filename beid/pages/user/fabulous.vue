<template>
    <view>
		<cu-custom bgColor="bg-black" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">点赞</block>
		</cu-custom>
        <view class="uni-padding-wrap">
            <view class="uni-comment">
			<!-- 点赞区 start -->	
				<block v-for="(item,index) in List" :key="index">
					<view class="uni-comment-list">
						<view class="uni-comment-face">
							<image :src="item.forminfo.headimg" mode="widthFix"></image>
						</view>
						<view class="uni-comment-body">
							<view class="uni-comment-top">
								<text>{{item.forminfo.nickname}}</text>
							</view>
							<view class="uni-comment-content">赞了你的作品</view>
							<view class="uni-comment-date">
								<view>{{item.time}}</view>
							</view>
						</view>
						<view class="rightimg" @click="video_detail(item.videoinfo.video_id)">
							<image :src="item.videoinfo.cover_url"></image>
						</view>
					</view>
				</block>
				<!-- 点赞区结束 -->
            </view>
        </view>
    </view>
</template>

<script>
	var api = require('../../components/js/api.js');
    export default {
        data() {
            return {
                title: "评论",
				List:[]
            }
        },
		onShow() {
			this.getNoticeList();
		},
		methods:{
			getNoticeList(){
				api.get({
					url:'Api/CommentApi/getNoticeList',
					data:{openid:uni.getStorageSync('userinfo').openid,type:2},
					success:res=>{
						if(res.status==1){
							this.List=res.result;
							console.log(res.result[0]['id'])
						}else{
							this.List=[];
						}
					}
				})
				
			},
			video_detail(video_id){
				uni.navigateTo({
					url:'/pages/index/video_detail?video_id=' + video_id
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
		float: left;
        width: 70upx;
        height: 70upx;
        border-radius: 100%;
        margin-right: 20upx;
        flex-shrink: 0;
        overflow: hidden;
    }

    .uni-comment-face image {
        width: 100%;
        border-radius: 100%;
    }

    .uni-comment-body {
        width: 80%;
		float: left;
    }
	.fabuleft{
		width: 60%;
		float: left;
	}
	.rightimg{
		width: 210upx;
		height: 210upx;
		display: flex;
	}
	.rightimg image{
		width: 150upx;
		height: 150upx;
	}
    .uni-comment-top {
        line-height: 1.5em;
        justify-content: space-between;
    }

    .uni-comment-top text {
        color: #0A98D5;
        font-size: 24upx;
    }

    .uni-comment-date {
        line-height: 38upx;
        flex-direction: row;
        justify-content: space-between;
        display: flex !important;
        flex-grow: 1;
    }

    .uni-comment-date view {
        color: #666666;
        font-size: 24upx;
        line-height: 38upx;
    }

    .uni-comment-content {
        line-height: 1.6em;
        font-size: 28upx;
        padding: 8rpx 0;
		color: #f7f7f7;
    }

    .uni-comment-replay-btn {
        background: #f0f0f0;
        font-size: 24upx;
        line-height: 28upx;
        padding: 5rpx 20upx;
        border-radius: 30upx;
        color: #333 !important;
        margin: 0 10upx;
    }
</style>
