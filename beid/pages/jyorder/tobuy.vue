<template>
	<view>
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">购买下单</block>
		</cu-custom>
		<view class="bg-bluebl">
			<view class="cu-bar solid-bottom radius">
				<view class="action">
					<text class="cuIcon-title text-blue"></text>{{OrderInfo.username}}
				</view>
				<view class="action">
					<text class="">{{OrderInfo.create_time}}</text>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">订单金额</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>￥{{OrderInfo.tprice}}</span></text>
					</navigator>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">单价</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>{{OrderInfo.dprice}} CNY/慈点</span></text>
					</navigator>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">数量</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>{{OrderInfo.num}} 慈点</span></text>
					</navigator>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">订单号</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>{{OrderInfo.deal_sn}}</span></text>
					</navigator>
				</view>
			</view>
		</view>
		<view class="cu-bar btn-group margin-top">
			<button class="cu-btn bg-grey shadow-blur round" @click="quxiao()">取消</button>
			<button @click="buydetails()"  class="cu-btn bg-blue shadow-blur round">下单</button>
		</view>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				OrderInfo:[],
				formtype:''
			};
		},
		onLoad(options) {
			let item = JSON.parse(options.item)
			this.OrderInfo = item;
			this.formtype = item.type;
		},
		methods: {
			quxiao(){
				uni.navigateBack();
			},
			buydetails() {
				api.post({
					url: 'Api/TurntableApi/BuyOrderId',
					data: {openid:uni.getStorageSync('userinfo').openid,cid:this.OrderInfo.id,formtype:this.formtype},
					success: res => {
						if(res.status==1){
							uni.navigateTo({
								url: '/pages/jyorder/buydetails?cid='+this.OrderInfo.id +'&formtype=' + this.OrderInfo.type
							});
						}else{
							uni.showToast({
								icon: 'none',
								position: 'bottom',
								title: res.message
							});
						}
						
					}
				})
				
			},
		}
		
	}
</script>

<style>
	.submit{
		width: 91%;
		margin: 30upx auto;
		height: 84upx;
		ling-height: 84upx;
		border-radius: 84rpx;
		color: white;
		font-size: 30upx;
		align-items: center;
		justify-content: center;
		background-color: #4a8be9;
	}
</style>
