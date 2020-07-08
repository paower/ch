<template>
	<view>
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">我的慈场</block>
		</cu-custom>
		<block v-for="(item,index) in List" :key="index">
			<view class="bg-img flex align-center">
				<view class="padding-xl text-white">
					<view class=" text-xl text-bold">
						{{item.title}}
					</view>
					<view class="padding-xs text-lg">
						<view class="margin-tb-sm text-center">
							<button @tap.stop="submit(index,item.id)"  class="cu-btn round text-white bg-green" v-if="item.status==0">领取</button>
							<button  class="cu-btn round text-black bg-grey" v-else>已领取</button>
						</view>
					</view>
				</view>
				
				<view class="padding-xl text-white">
					<view class="padding-xs text-lg text_right">
						当前产量：<text class="text-green">{{item.single_num}}</text>慈点<br />
						总产量：<text class="text-green">{{item.reward_num}}</text>慈点<br />
						周期：{{item.max_day}}天<br />
						剩余天数：{{item.shengyu}}天<br />
					</view>
				</view>
				
			</view>
		</block>		
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				List:[],
				nowTime:'',
			};
		},
		methods: {
			GetList:function(){
				api.get({
					url:'Api/ScrollApi/GetLingScroll',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						console.log(res);
						if(res.status==1){
							this.List = res.result
						}
					}
				})
			},
			submit:function(index,id){
				api.post({
					url:'Api/ScrollApi/clock',
					data:{openid:uni.getStorageSync('userinfo').openid,id:id},
					success:res=>{
						if(res.status==1){
							this.List[index].status = 1; 
						}
						uni.showToast({
							title:res.message,
							icon:'none'
						})
					}
				})
			}
		},
		onShow() {
			this.GetList();
			this.nowTime = (new Date()).getTime()/1000;
		}
	}
</script>

<style>
	page{
		background-color: #18191d;
	}
	.bg-img{
		width: 95%;
		background-image: url(../../static/big10006.png);
		height: 380upx;
		border-radius: 10upx;
		margin: 10upx auto;
	}
	.text_right{
		margin-top: 40upx;
	}
</style>
