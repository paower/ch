<template>
	<view>
		<cu-custom bgColor="bg-black" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">星级达人</block>
		</cu-custom>
		
		<view class="margin-top-xxl" v-for="(item,i) in List" :key="i">
			<view class="flex align-center margin radius bg-gradual-red">
				<view class="padding-xl text-white">
					<view class="padding-xs text-xxl text-bold">
						{{item.title}}
					</view>
					<view class="padding-xs text-center" v-if="item.id==userstar">--当前星级--</view>
				</view>
				<view class="padding-xl text-white">
					<view class="padding-xs text-df">
						奖励慈场：{{item.scroll_title}}<br />
						团队活跃度：{{item.team_active}}<br />
						本人活跃度：{{item.push_num}}<br />
						分红比例：{{item.get_fee}}%
					</view>
				</view>
			</view>
			
			
		</view>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				userinfo:[],
				List:[],
				userstar:''
			};
		},
		onShow(){
			if(!uni.getStorageSync('userinfo')){
				uni.navigateTo({
					url:'/pages/login/login'
				})
			}
			var userinfo = uni.getStorageSync('userinfo');
			this.userinfo = userinfo;
			this.getstarList();
			this.getuserStar();
		},
		methods: {
			getstarList(){
				api.get({
					url:'api/IndexApi/getstarList',
					success:res=>{
						console.log(res);
						this.List = res.message;
					}
				})
			},
			getuserStar(){
				api.get({
					url:'api/IndexApi/getuserStar',
					data: {openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						console.log(res);
						this.userstar = res.message;
					}
				})
			}
		}
	}
</script>

<style>
	
</style>
