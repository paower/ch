<template>
	<view>
		<view class="list">
			<block v-for="(item, index) in dataList" :key="index">
				<view class="video" @click="detail(item.video_id)"><image :src="item.cover_url"></image></view>
				<!-- <navigator class="video" src="/pages/index/video_detail"><image :src="item.cover_url"></image></navigator> -->
			</block>
		</view>
	</view>
</template>

<script>
export default {
	props: {
		dataList: {}
	},
	data() {
		return {};
	},
	methods:{
		detail(video_id){
			uni.navigateTo({
				url:'/pages/index/video_detail?video_id=' + video_id
			})
		}
	}
};
</script>

<style>
.list {
	display: flex;
	justify-content:space-between;
	flex-wrap: wrap;
	padding-bottom: 100rpx;
	padding: 5px;
	background: #18191d;
	box-sizing: border-box;
}
.video {
	width: 50%;
	height: 45vw;
	padding: 5px;
	box-sizing: border-box;
	overflow: hidden;
}
.video image{
	width: 100%;
	height: 100%;
	min-height: 390upx;
	border-radius: 10rpx;
}
</style>
