<template>
	<view>
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">发布订单</block>
			<view  slot="right" @click="allorder()" class="action"><text class="cuIcon-order"></text></view>
		</cu-custom>
		<form>
			<view class="cu-form-group margin-top">
				<view class="title text-white">订单类型</view>
				<picker @change="PickerChange" :value="index" :range="picker">
					<view class="picker">
						{{index>-1?picker[index]:'点击选择'}}
					</view>
				</picker>
			</view>
			<view class="cu-form-group">
				<view class="title text-white">当前价格</view>
				<input placeholder="0.00 CNY" disabled="disabled" name="input" v-model="new_price"></input>
			</view>
			<view class="cu-form-group">
				<view class="title text-white">数量</view>
				<input placeholder="请输入数量" name="input" v-model="num"></input>
			</view>
			<view class="cu-form-group" v-if="index==1">
				<view class="title text-white">流转中心</view>
				<input :placeholder="CurrentPrice.user_fee*num/100" disabled="disabled" name="input"></input>
			</view>
			<button class="submit" @click="submit">提交</button>
		</form>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				index: 0,
				picker: ['购买订单'],
				new_price:'0.00 CNY',
				CurrentPrice:[],
				num:0,
				fee:0
			};
		},
		onLoad() {
			this.GetCurrentPrice();
		},
		methods: {
			PickerChange(e) {
				this.index = e.detail.value
				if(e.detail.value==0){
					this.new_price = this.CurrentPrice.buy_new_price + ' CNY'
				}else if(e.detail.value==1){
					this.new_price = this.CurrentPrice.sell_new_price + ' CNY'
				}
			},
			allorder() {
				uni.navigateTo({
					url: '/pages/jyorder/allorder'
				});
			},
			//获取当前价格
			GetCurrentPrice:function(){
				api.get({
					url:'Api/TurntableApi/GetCurrentPrice',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						this.CurrentPrice = res
						this.new_price = this.CurrentPrice.buy_new_price + ' CNY';
					}
				})
			},
			submit:function(){
				if(this.index==-1){
					uni.showToast({
					    icon: 'none',
						position: 'bottom',
					    title: '请选择订单类型'
					});
					return;
				}
				if(this.num<0){
					uni.showToast({
					    icon: 'none',
						position: 'bottom',
					    title: '请输入数量'
					});
					return;
				}
				api.post({
					url:'Api/TurntableApi/Salebuys',
					data:{openid:uni.getStorageSync('userinfo').openid,num:this.num,ordertype:this.index},
					success:res=>{
						this.num = '';
						uni.showToast({
						    icon: 'none',
							position: 'bottom',
						    title: res.message
						});
						
					}
				})
			},
			
		}
	}
</script>

<style>
	.cu-form-group{
		border: none;
	}
	.cu-form-group .title {
		min-width: calc(4em + 15px);
	}
	input{
		color: #0081ff;
	}
	.picker{
		color:#e2e2e2;
	}
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
