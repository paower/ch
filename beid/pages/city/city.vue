<template>
	<view class="page" >
		<cu-custom bgColor="bg-black" :isBack="false">
			<block slot="backText">返回</block>
			<block slot="content">同城</block>
		</cu-custom>
		
		<view @click="cityelection()" class="cu-item arrow bg-black padding soild-top">
			<view class="content">
				<text class="cuIcon-locationfill text-grey padding-right"></text>
				<text class="text-grey">自动定位: {{addresscity}}</text>
				<text class="cuIcon-right text-grey" style="float: right;"></text>
			</view>
		</view>
		
		<video-list :dataList="videoList"></video-list>
		
		<tabsmodal :reciveUserInfo="openmodal"></tabsmodal>
	</view>
</template>

<script>
import videoList from '@/components/list/list.vue';
import tabsmodal from '@/components/modal/modal.vue';
var api = require('../../components/js/api.js'); 
export default {
	components: {
		videoList,
		tabsmodal
	},
	data() {
		return {
			videoList: [],
			addresscity:'获取中...',
			longitude:'',
			latitude:'',
			openmodal:''
		};
	},
	onTabItemTap(e){
		console.log(e)
		if(e.index==2){
			this.openmodal='Noauthority'
		}
	},
	onLoad() {
		this.getaddress();
	},
	onHide() {
		uni.hideLoading();
	},
	onShow() {
		this.getaddress();
		if(uni.getStorageSync('useraddress')){
			this.addresscity = uni.getStorageSync('useraddress').city;
			this.getVideoList();
			return;
		}
	},
	onPullDownRefresh() {
		this.getVideoList(true);
		uni.stopPullDownRefresh();
	},
	onTabBarMidButtonTap(e){
		console.log(e)
	},
	methods: {
		
		getaddress(){
			if(uni.getStorageSync('useraddress')){
				this.addresscity = uni.getStorageSync('useraddress').city;
				this.getVideoList();
				return;
			}
			var _that = this;
			uni.showLoading({
				title:'获取定位'
			})
			uni.getLocation({
			    type: 'wgs84',
			    success: function (res) {
					_that.longitude =  res.longitude
					_that.latitude = res.latitude;
					api.get({
						url:'Api/IndexApi/GetAddress',
						data:{lon:res.longitude,lat:res.latitude},
						success:res=>{
							if(res.status==1){
								
								var result = res.regeocode.addressComponent;
								_that.addresscity = result.city;
								uni.setStorageSync('useraddress',{
									'city':result.city,
									'district':result.district,
									'province':result.province,
									'township':result.township,
									'longitude':_that.longitude,
									'latitude':_that.latitude
								})
								_that.getVideoList();
							}
						}
					})
			}});
			
		},
		getVideoList() {
			this.videoList = [];
			api.get({
				url:'Api/VideoApi/GetVideoList',
				data:{city:this.addresscity},
				success: res => {
					for (let item of res.result) {
						this.videoList.push({
							video_id: item.video_id,
							nickname: item.user.nick_name,
							video_describe: item.video_describe,
							cover_url: item.cover_url,
							video_url: item.video_url,
							dianzan: 1,
							pinglun: 2,
							zhuanfa: 3,
							flag: false,
							check: false
						});
					}
					uni.hideLoading()
				}
			})
		},
		onPullDownRefresh() {
			this.getVideoList();
			setTimeout(function () {
				uni.stopPullDownRefresh();  //停止下拉刷新动画
			}, 1000);
		},
		cityelection() {
			uni.navigateTo({
				url: '/pages/city/cityelection'
			});
		}
		
	}
};
</script>
<style>
.page {
	background-color: #18191d;
}
.soild-top{
	border-top: 1px solid #555555;
}
</style>
