<template>
	<view class="container">
		<cu-custom bgColor="bg-black" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">账单</block>
			<view slot="right" class="text-xl" @click="shaixuan"><text class="cuIcon-filter padding-right"></text></view>
		</cu-custom>
		
		<block v-if="check == 1">
			<view class="bg-white" style="display: ;">
				<view class="cu-bar margin-top solid-bottom">
					<view class="action">
						<text class="text-blue"></text>筛选查看
					</view>
				</view>
				<view class="flex solid-bottom padding justify-start">
					<view class="bg-blue padding-sm margin-xs radius" @click="checklist(1)">全部</view>
					<view class="bg-blue padding-sm margin-xs radius" @click="checklist(2)">慈点</view>
					<view class="bg-blue padding-sm margin-xs radius" @click="checklist(3)">活跃度</view>
					<view class="bg-blue padding-sm margin-xs radius" @click="checklist(4)">经验值</view>
				</view>
			</view>
		</block>
		<!-- 账单列表 -->
		<view class="coin-section">
			
			<view class="block bg-bluebl solid-bottom" v-for="(item,index) in list" :key="index">
				<view class="s-row">
					<view class="col">
						<text v-html="item.get_type_text"></text>
						<text class="coin  padding">{{item.huobi.name}}</text>
					</view>
					<view class="col r light">
						<text class="status">已完成</text>
						<text size="20" class="cuIcon-right text-gray"></text>
					</view>
				</view>
				<view class="s-row">
					<view class="col subtitle text-gray">时间</view>
					<!-- <view class="col subtitle text-gray">数量(个)</view> -->
					<view class="col r subtitle text-gray">{{item.huobi.xfcontent}}</view>
				</view>
				<view class="s-row">
					<view class="col subtitle row-amount">{{item.get_time}}</view>
					<!-- <view class="col subtitle row-amount">1</view> -->
					<view class="col r subtitle row-amount">
						<block v-if="item.pay_id == item.me">
							-
						</block>
						<block v-else>
							+
						</block>
						{{item.get_nums}}
					</view>
				</view>
			</view>
			
		</view>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default{
		data(){
			return{
				list:[],
				check:'0'
			}
		},
		onShow() {
			this.getlist();
		},
		methods:{
			getlist(){
				api.get({
					url:'Api/IndexApi/TranmoneyList',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						this.list = res.result;
					}
				})
			},
			checklist(i){
				api.get({
					url:'Api/IndexApi/CheckList',
					data:{openid:uni.getStorageSync('userinfo').openid,i:i},
					success:res=>{
						this.list = res.result;
					}
				})
			},
			shaixuan(){
				if(this.check == 0){
					this.check = 1;
				}else{
					this.check = 0;
				}
			}
		}
	}
</script>

<style lang='scss' scoped>
	.container{
		padding: 0upx 0upx;
	}
	.coin-section{
		background: #fff;
		.block{
			padding: 20upx 0;
			.s-row{
				display:flex;
				align-items:center;
				padding: 10upx 30upx 0upx 30upx;
				.subtitle{
					padding: 4upx 0 10upx 0;
				}
				.col{
					flex:1;
					.coin{
						font-weight: bold;
						padding-right: 10upx;
					}
				}
				
				.light{
					font-weight: bold;
				}
				.r{
					text-align: right;
				}
			}
		}
	}
</style>
