<template>
	<view>
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">慈场园</block>
			<view  slot="right" @click="tomy()" class="action">我的</view>
		</cu-custom>
		<block v-for="(item,index) in List" :key="index">
			<view class="bg-img flex align-center">
				<view class="padding-xl text-white">
					<view class="padding-xs text-xxl text-bold">
						{{item.title}}
					</view>
					<view class="padding-xs text-lg">
						<view class="margin-tb-sm text-center">
							<block v-if="item.id!=1"><button @tap.stop="submit(item.id)"  class="cu-btn round text-white bg-yellow">兑换</button></block>
						</view>
					</view>
					
				</view>
				<view class="padding-xl text-white">
					<view class="padding-xs text-lg text_right">
						<block v-if="item.id==1">赠送兑换1次</block>
						<block v-else>可兑换数量：{{item.max_size}}</block>
						<br />
						<!-- 总收益：{{item.reward_num}}<br /> -->
						产量：{{item.reward_num}}慈点<br />
						<block v-if="item.id != 1">活跃度：+{{item.active}}<br /></block>
						周期：{{item.max_day}}天<br />
						兑换扣除：{{item.sell_num}}
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
			};
		},
		methods: {
			tomy(){
				uni.navigateTo({
					url:'inscription_linqu'
				})
			},
			GetList:function(){
				api.get({
					url:'Api/ScrollApi/GetList',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						console.log(res);
						this.List = res
					}
				})
			},
			submit:function(id){
				uni.showModal({
				    title: '兑换慈场',
				    content: '确定兑换该慈场？',
				    success: function (res) {
				        if (res.confirm) {
				            api.post({
				            	url:'Api/ScrollApi/Scroll_exchange',
				            	data:{openid:uni.getStorageSync('userinfo').openid,id:id},
				            	success:res=>{
				            		uni.showToast({
				            			title:res.msg,
										icon:'none'
				            		})
				            	}
				            })
				        }
				    }
				});
			}
		},
		onShow() {
			this.GetList();
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
