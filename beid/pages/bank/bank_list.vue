<template>
		<view class="center">
			<cu-custom bgColor="bg-gradual-blue" :isBack="true">
				<block slot="backText"></block>
				<block slot="content">收款方式</block>
				<view slot="right" @click="bank_set()" class="rightsub">+</view>
			</cu-custom>
			<!-- 支付宝 -->
			<block v-for="(item,index) in Banklist" :key="index">
				
				<view class="cu-list menu"  v-if="item.type==1">
					<view class="cu-item">
						<view @click="bank_edit(0,item.alipay_number,item.id)" class="content padding-tb-sm text-black">
							<view><text class="cuIcon-pay text-blue margin-right-xs"></text>支付宝</view>
							<view class="text-black">{{item.alipay_number}}</view>
						</view>
						<view class="action">
							<switch :checked="item.is_default==1?true:false" @change="switch1Change" :data-id="item.id"/>
						</view>
					</view>
				</view>
				
				<view class="cu-list menu"  v-if="item.type==2">
					<view class="cu-item">
						<view @click="bank_edit(1,item.alipay_number,item.id)" class="content padding-tb-sm text-black">
							<view><text class="cuIcon-pay text-blue margin-right-xs"></text>银行卡</view>
							<view class="text-black">{{item.alipay_number}}</view>
						</view>
						<view class="action">
							<switch :checked="item.is_default==1?true:false" @change="switch1Change" :data-id="item.id"/>
						</view>
					</view>
				</view>
				
				<view class="cu-list menu"  v-if="item.type==3">
					<view class="cu-item">
						<view @click="bank_edit(2,item.alipay_number,item.id)" class="content padding-tb-sm text-black">
							<view><text class="cuIcon-pay text-blue margin-right-xs"></text>微信</view>
							<view class="text-black">{{item.alipay_number}}</view>
						</view>
						<view class="action">
							<switch :checked="item.is_default==1?true:false" @change="switch1Change" :data-id="item.id"/>
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
				ColorList: this.ColorList,
				color: 'red',
				loading: false,
				modalName: '',
				active: false,
				switchA: false,
				Banklist:[]
			};
		},
		methods: {
			getmybank(openid){
				api.get({
					url: 'Api/UserApi/getMyBank',
					data: {openid:openid},
					success:res=>{
						if(res.status==1){
							this.Banklist = res.result;
						}
					}
				})
			},
			switch1Change: function (e) {
			    let id = e.currentTarget.dataset.id;
				let value = e.target.value;
				var openid = uni.getStorageSync('userinfo').openid;
				api.get({
					url: 'Api/UserApi/setPayType',
					data: {openid:openid,id:id,status:value},
					success:res=>{
						uni.showToast({
						    icon: 'none',
							position: 'bottom',
						    title: res.message
						});
					}
				})
			},
			bank_set() {
				uni.navigateTo({
					url: '/pages/bank/bank_set?form=add'
				});
			},
			bank_edit(type,pay_numer,id){
				uni.navigateTo({
					url: '/pages/bank/bank_set?type='+type+'&pay_number='+pay_numer+'&id='+id+'&form=edit'
				});
			}
		},
		onShow() {
			var openid = uni.getStorageSync('userinfo').openid;
			this.getmybank(openid);
		}
	}
</script>

<style>
	page{
		background-color: #18191d;
	}
	.rightsub{
		margin-right: 30upx;
		font-size: 50upx;
	}
	.cu-item{
		background-color: #DEDEDE !important;
		width: 98%;
		margin: 0 auto;
		border-radius: 20upx;
	}
</style>
