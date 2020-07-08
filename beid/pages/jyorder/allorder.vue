<template>
	<view>
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">订单</block>
		</cu-custom>
		<scroll-view scroll-x class="bg-bluebl nav" scroll-with-animation :scroll-left="scrollLeft">
			<view class="cu-item" :class="index==TabCur?'text-blue cur':''" v-for="(item,index) in 6" :key="index" @tap="tabSelect" :data-id="index">
				{{tabvalue[index]}}
			</view>
		</scroll-view>
		<!-- 全部 -->
		<block v-for="(items,indexs) in orderlist" :key="indexs">
			<view @click="buydetails(items.id,items.type)" class="bg-bluebl margin-top" v-if="TabCur==0">
				<view class="cu-bar solid-bottom">
					<view class="action">
						<text class="cuIcon-title text-blue"></text>{{items.username}}
					</view>
					<view class="action">
						<text class="">{{items.create_time}}</text>
					</view>
				</view>
				<view class="cu-bar padding">
					<view class="text-left">
						<block v-if="items.type==0">
							<text class="text-blue padding">购买</text> 慈点
						</block>
						<block v-if="items.type==1">
							<text class="text-red padding">出售</text> 慈点
						</block>
					<view class="padding text-xl">
						<text>{{items.tprice}} CNY</text>
					</view>	
				   </view>
				   <view class="padding">
					   <text v-if="items.status==0">挂单中</text>
					   <text v-if="items.status==1" class="text-green">待付款</text>
					   <text v-if="items.status==2" class="text-red">待确认</text>
					   <text v-if="items.status==3">已完成</text>
					   <text v-if="items.status==5">已取消</text>
					   <text v-if="items.status==6">申诉中</text>
				   </view>
				</view>
			</view>
		</block>
		<block v-for="(item,index) in orderlist" :key="index">
			<!-- 已完成 -->
			<view @click="buydetails(item.id,item.type)" class="bg-bluebl margin-top" v-if="TabCur==5 && item.status==3">
				<view class="cu-bar solid-bottom">
					<view class="action">
						<text class="cuIcon-title text-blue"></text>{{item.username}}
					</view>
					<view class="action">
						<text class="">{{item.create_time}}</text>
					</view>
				</view>
				<view class="cu-bar padding">
					<view class="text-left">
						<block v-if="item.type==0">
							<text class="text-blue padding">购买</text> 慈点
						</block>
						<block v-if="item.type==1">
							<text class="text-red padding">出售</text> 慈点
						</block>
					<view class="padding text-xl">
						<text>{{item.tprice}} CNY</text>
					</view>	
				   </view>
				   <view class="padding">已完成</view>
				</view>
			</view>
			
			<!-- 待付款 -->
			<view @click="buydetails(item.id,item.type)" class="bg-bluebl margin-top" v-if="TabCur==1 && item.status==1">
				<view class="cu-bar solid-bottom">
					<view class="action">
						<text class="cuIcon-title text-blue"></text>{{item.username}}
					</view>
					<view class="action">
						<text class="">{{item.create_time}}</text>
					</view>
				</view>
				<view class="cu-bar padding">
					<view class="text-left">
						<block v-if="item.type==0">
							<text class="text-blue padding">购买</text> 慈点
						</block>
						<block v-if="item.type==1">
							<text class="text-red padding">出售</text> 慈点
						</block>
					<view class="padding text-xl">
						<text>{{item.tprice}} CNY</text>
					</view>	
				   </view>
				   <view class="padding text-green">待付款</view>
				</view>
			</view>
			
			<!-- 待确认 -->
			<view @click="buydetails(item.id,item.type)" class="bg-bluebl margin-top" v-if="TabCur==2 && item.status==2">
				<view class="cu-bar solid-bottom">
					<view class="action">
						<text class="cuIcon-title text-blue"></text>{{item.username}}
					</view>
					<view class="action">
						<text class="">{{item.create_time}}</text>
					</view>
				</view>
				<view class="cu-bar padding">
					<view class="text-left">
						<block v-if="item.type==0">
							<text class="text-blue padding">购买</text> 慈点
						</block>
						<block v-if="item.type==1">
							<text class="text-red padding">出售</text> 慈点
						</block>
					<view class="padding text-xl">
						<text>{{item.tprice}} CNY</text>
					</view>	
				   </view>
				   <view class="padding text-red">待确认</view>
				</view>
			</view>
			
			<!-- 已取消 -->
			<view @click="buydetails(item.id,item.type)" class="bg-bluebl margin-top" v-if="TabCur==4 && item.status==5">
				<view class="cu-bar solid-bottom">
					<view class="action">
						<text class="cuIcon-title text-blue"></text>{{item.username}}
					</view>
					<view class="action">
						<text class="">{{item.create_time}}</text>
					</view>
				</view>
				<view class="cu-bar padding">
					<view class="text-left">
						<block v-if="item.type==0">
							<text class="text-blue padding">购买</text> 慈点
						</block>
						<block v-if="item.type==1">
							<text class="text-red padding">出售</text> 慈点
						</block>
					<view class="padding text-xl">
						<text>{{item.tprice}} CNY</text>
					</view>	
				   </view>
				   <view class="padding text-gray">已取消</view>
				</view>
			</view>
			
			<!-- 申诉中 -->
			<view @click="buydetails(item.id,item.type)" class="bg-bluebl margin-top" v-if="TabCur==3 && item.status==6">
				<view class="cu-bar solid-bottom">
					<view class="action">
						<text class="cuIcon-title text-blue"></text>{{item.username}}
					</view>
					<view class="action">
						<text class="">{{item.create_time}}</text>
					</view>
				</view>
				<view class="cu-bar padding">
					<view class="text-left">
						<block v-if="item.type==0">
							<text class="text-blue padding">购买</text> 慈点
						</block>
						<block v-if="item.type==1">
							<text class="text-red padding">出售</text> 慈点
						</block>
					<view class="padding text-xl">
						<text>{{item.tprice}} CNY</text>
					</view>	
				   </view>
				   <view class="padding text-gray">申诉中</view>
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
				TabCur: 0,
				scrollLeft: 0,
				tabvalue:['全部','待付款','待确认','申诉中','已取消','已完成'],
				orderlist:[]
			};
		},
		onShow() {
			this.getMyorder();
		},
		methods: {
			getMyorder:function(){
				api.get({
					url:'Api/TurntableApi/GetMyOrderAll',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						this.orderlist = res
					}
				})
			},
			tabSelect(e) {
				this.TabCur = e.currentTarget.dataset.id;
				this.scrollLeft = (e.currentTarget.dataset.id - 1) * 60
			},
			buydetails(cid,formtype) {
				uni.navigateTo({
					url: '/pages/jyorder/buydetails?cid=' + cid + '&formtype=' + formtype
				});
			},
			selldetails() {
				uni.navigateTo({
					url: '/pages/jyorder/selldetails'
				});
			},
		}
	}
</script>

<style>

</style>
