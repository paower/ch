<template>
	<view>
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">行业</block>
		</cu-custom>
		
		<scroll-view scroll-x class="bg-bluebl nav" scroll-with-animation :scroll-left="scrollLeft">
			<view class="cu-item" :class="index==TabCur?'text-blue cur':''" v-for="(item,index) in category" :key="index" @tap="tabSelect" :data-id="index">
				{{item.name}}
			</view>
		</scroll-view>
		<video-list :dataList="videoList"></video-list>
	</view>
</template>

<script>
	import videoList from '@/components/list/list.vue';
	var api = require('../../components/js/api.js'); 
	export default {
		components: {
			videoList
		},
		data() {
			return {
				TabCur: 0,
				scrollLeft: 0,
				videoList: [],
				category: []
			};
		},
		onLoad() {
			this.getCategoryVideo(1);
			this.getCategory();
		},
		onShow() {
			// var category = getCategory();
			// this.category = category;
		},
		
		onPullDownRefresh() {
			console.log('refresh');
			this.getVideoList(true);
			uni.stopPullDownRefresh();
		},
		methods: {
			getCategoryVideo(id){
				api.get({
					url: 'Api/VideoApi/getCategoryVideo/category_id/'+id,
					dataType: 'json',
					success:res=>{
						console.log(res);
						this.videoList = res;
					},
					fail: (err) => {
						console.log(err);
					}
				})
			},
			getCategory(){
				api.get({
					url: 'Api/VideoApi/getCategory',
					dataType: 'json',
					success:res =>{
						this.category = res;
					},
				})
			},
			// getVideoList() {
			// 	uni.request({
			// 		url: 'http://api.52170.xin/video?page_size=20',
			// 		dataType: 'json',
			// 		success: res => {
			// 			console.log(res);
			// 			for (let item of res.data.data.list) {
			// 				this.videoList.push({
			// 					video_id: item.video_id,
			// 					nickname: item.nickname,
			// 					video_describe: item.video_describe,
			// 					cover_url: item.cover_url,
			// 					video_url: item.video_url,
			// 					dianzan: item.dianzan,
			// 					pinglun: item.pinglun,
			// 					zhuanfa: item.zhuanfa,
			// 					flag: false,
			// 					check: false
			// 				});
			// 			}
			// 		}
			// 	});
			// },
			tabSelect(e) {
				this.TabCur = e.currentTarget.dataset.id;
				this.scrollLeft = (e.currentTarget.dataset.id - 1) * 60;
				let tabid = e.currentTarget.dataset.id;
				let category_id = this.category[tabid].id;
				this.videoList = [];
				this.getCategoryVideo(category_id);
			}
		}
	}
</script>

<style>

</style>
