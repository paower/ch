<template>
	<view>
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">流转中心</block>
		</cu-custom>
		<scroll-view scroll-x class=" nav text-center" :style="[{top:CustomBar + 'px'}]">
			<view class="cu-item" :class="index==TabCur?'text-blue cur':''" v-for="(item,index) in tabNav" :key="index" @tap="tabSelect"
			 :data-id="index">
				{{tabNav[index]}}
			</view>
		</scroll-view>
			<!-- 订单开始 -->
			<block v-if="TabCur==0">
			<view class="bg-bluebl margin-sm padding-sm radius text-content" v-for="(item,index) in OrderList" :key="index" v-if="item.type==1">
				<view class="flex justify-between">
					<view class="text-bold" style="flex-shrink: 0;">
						<text class="text-blue">{{item.username}}</text>
					</view>
					<view>
						<text class="test-ash">订单号:{{item.deal_sn}}</text>
					</view>
				</view>
				<view class="flex padding-top-sm solids-top">
					<image style="flex-shrink: 0;border-radius: 50%;" :src="item.headimg?item.headimg:'../../static/touxiang.png'" class="shadow cover"></image>
					<view class="flex text-content padding-left justify-between" style="flex-grow: 1;">
						<view class="text-l">
							单价：{{item.dprice}} CNY<br />
							数量：{{item.num}} 慈点
						</view>
						<view style="flex-shrink: 0;">
							<view class="test-ash">成交率 100%</view>
							<view class="payment">
								<block v-for="(items,indexs) in item.pay_type" :key="indexs">
									<image src="../../static/zfb.png" v-if="items==1"></image>
									<image src="../../static/bank.png" v-if="items==2"></image>
									<image src="../../static/wx.png"  v-if="items==3"></image>
								</block>
							</view>
						</view>
					</view>
				</view>
				<view @click="tobuy(item)" class="flex justify-end">
					<view class=" round cu-btn lines-green mid shadow">购买</view>
				</view>
			</view>
			<!-- 订单结束 -->
			</block>
			
			<block v-if="TabCur==1">
				<!-- 订单开始 -->
				<view class="bg-bluebl margin-sm padding-sm radius text-content" v-for="(item,index) in OrderList" :key="index" v-if="item.type==0">
					<view class="flex justify-between">
						<view class="text-bold" style="flex-shrink: 0;">
							<text class="text-blue">{{item.username}}</text>
						</view>
						<view>
							<text class="test-ash">订单号:{{item.deal_sn}}</text>
						</view>
					</view>
					<view class="flex padding-top-sm solids-top">
						<image style="flex-shrink: 0;border-radius: 50%;" :src="item.headimg?item.headimg:'../../static/touxiang.png'" class="shadow cover"></image>
						<view class="flex text-content padding-left justify-between" style="flex-grow: 1;">
							<view class="text-l">
								单价：{{item.dprice}} CNY<br />
								数量：{{item.num}} 慈点
							</view>
							<view style="flex-shrink: 0;">
								<view class="test-ash">成交率 100%</view>
								<view class="payment">
									<block v-for="(items,indexs) in item.pay_type" :key="indexs">
										<image src="../../static/zfb.png" v-if="items==1"></image>
										<image src="../../static/bank.png" v-if="items==2"></image>
										<image src="../../static/wx.png"  v-if="items==3"></image>
									</block>
								</view>
							</view>
						</view>
					</view>
					<view @click="tosell(item)" class="flex justify-end">
						<view class=" round cu-btn lines-red mid shadow">出售</view>
					</view>
				</view>
				<!-- 订单结束 -->
					
			</block>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				CustomBar: this.CustomBar,
				TabCur: 0,
				avatar:[''],
				tabNav: ['购买', '出售','发布订单'],
				OrderList:[]
			};
		},
		onLoad() {
			this.GetOrderList();
		},
		methods: {
			tabSelect(e) {
				let Tid = e.currentTarget.dataset.id;
				if(Tid!=2){
					this.TabCur = Tid;
				}
				this.scrollLeft = (Tid - 1) * 60
				if(Tid==2){
					uni.navigateTo({
						url: '/pages/jyorder/issueorder'
					});
				}
			},
			tobuy(item) {
				uni.navigateTo({
					url: '/pages/jyorder/tobuy?item=' + JSON.stringify(item)
				});
			},
			tosell(item){
				uni.navigateTo({
					url: '/pages/jyorder/tosell?item=' + JSON.stringify(item)
				});
			},
			//获取列表
			GetOrderList:function(){
				api.get({
					url:'Api/TurntableApi/GetDealList',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						this.OrderList = res.data
					}
				})
			},
		},
		onPullDownRefresh() {
			this.GetOrderList();
			setTimeout(function(){
				uni.stopPullDownRefresh();
			},1500)
		},
		onShow() {
			if(!uni.getStorageSync('userinfo')){
				uni.navigateTo({
					url:'/pages/login/login'
				})
			}
		}
	}
</script>

<style>
	page{
		background-color: #18191d;
	}
	.nav{
		background-color: #1c1d1f;
		color: #FFFFFF;
	}
	.cover {
		width: 100upx;
		height: 100upx;
	}
	
	.test-ash{
		color: #bebebe;
	}
	.payment image{
		width: 40upx;
		height: 40upx;
		float: right;
		margin-left: 5upx;
	}
</style>
