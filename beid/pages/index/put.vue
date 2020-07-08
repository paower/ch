<template>
    <view class="content">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">发布</block>
		</cu-custom>
        <view class="no" v-if="quanxian==0">
        	<text>未有上传权限</text>
        </view>
		<view class="yes" v-else>
			<view class="flex">
				<view class="flex-sub padding-sm margin-xs radius">
					<button type="default" @click="bendi()">本地上传</button>
				</view>
				<view class="flex-sub padding-sm margin-xs radius">
					<button type="default" @tap="test">录制上传</button>
				</view>
			</view>
		</view>
    </view>
</template>

<script>
	export default {
	    data() {
	       return {
			    quanxian: ''
		   }
	    },
		onShow() {
			this.quanxian = uni.getStorageSync('upload_verify');
		},
	    methods: {
			test: function () {
				var self = this;
				uni.chooseVideo({
					count: 1,
					sourceType: ['camera'],
					success: function (res) {
						uni.navigateTo({
							url:'record?video_url='+res.tempFilePath
						})
					}
				});
			},
			bendi(){
				uni.navigateTo({
					url:'local'
				})
			}
	    }
	}

</script>

<style>
	.content{margin-top: 200upx;}
	.no{width: 100%;height: 50upx;color: #FFFFFF;text-align: center;font-size: 40upx;}
	.no text{padding: 20upx;border: 1px dashed  #FFFFFF;border-radius: 10upx;}
</style>
