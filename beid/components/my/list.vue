<template>
	<view>
		<view class="list grid col-3 align-center justify-center">
			<block v-for="(item, index) in dataList" :key="index">
				<view class="video" @click="detail(item.video_id,item.status)">
					<image :src="item.cover_url"></image>
					<view class="tips" v-if="item.status!=1">
						<text v-if="item.status==0">审核中</text>
						<text v-if="item.status==2">审核失败</text>
					</view>
				</view>
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
		detail(id,status){
			if(status!=1)return;
			uni.navigateTo({
				url:'/pages/index/video_detail?video_id=' + id
			})
		}
	}
};
</script>

<style>
.list {
	/* display: flex; */
	justify-content:space-between;
	flex-wrap: wrap;
	padding-bottom: 100rpx;
	padding: 5px;
	background: #161922;
	box-sizing: border-box;
	/* margin-bottom: 60upx; */
}
.video{
	float: left;
	min-height: 400upx;
	position: relative;
}
.tips{
	position: absolute;
	z-index: 2;
	left: 0;
	bottom: 0;
	width: 100%;
	text-align: center;
	height: 24px;
	background: rgba(0, 0, 0, 0.71);
	color: #fff;
}
</style>
