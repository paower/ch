<template>
	<view>
		<cu-custom bgColor="bg-black" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">我的团队</block>
		</cu-custom>
		
		<view class="margin-top-xxl margin-bottom-xl">
			
			<view class="flex grid text-center text-white padding-df">
				<view class="flex-sub text-center padding">
					<view class="text-yellow padding-bottom-sm">{{son_num}}</view>
					<view>直推人数</view>
				</view>
				<view class="flex-sub text-center padding">
					<view class="text-yellow padding-bottom-sm">{{team_num}}</view>
					<view>团队人数</view>
				</view>
				<view class="flex-sub text-center padding">
					<view class="text-yellow padding-bottom-sm">{{hyd}}</view>
					<view>总活跃度</view>
				</view>
			</view>
			
			<!-- 邀请人 -->
			<block v-if="pinfo">
				<view class="col-3 text-white padding-lr margin-top-sm margin-lr-sm flex align-center bg-purple radius">
					<view class="cu-avatar round lg" style="background-image: url(&quot;https://ossweb-img.qq.com/images/lol/web201310/skin/big10001.jpg&quot;);"></view>
					<view class="flex-sub text-left">
						<view class="padding text-xl">
							<block v-if="pinfo.nickname != '设置昵称'"><text class="">{{pinfo.nickname}}</text><br /></block>
							<block v-if="pinfo.nickname == '设置昵称'"><text class="">暂无</text><br /></block>
							<text class=" text-sm">{{pinfo.mobile}}</text><br />
							<block v-if="pinfo.wx_no != 0"><text class=" text-sm">{{pinfo.wx}}</text><br /></block>
							<block v-if="pinfo.wx_no == 0"><text class=" text-sm">暂无</text><br /></block>
							<text class=" text-sm">实名状态
								<!-- <text class="cu-btn margin-left-sm round sm text-gray">未实名</text> -->
								<text class="cu-btn margin-left-sm bg-green round sm">已实名</text>
							</text>
							
						</view>
					</view>
					<view class="text-right">
						<text class=" text-sm ">注册时间</text><br />
						<text class=" text-sm">{{pinfo.reg_date|timeStamp}}</text>
					</view>
				</view>
			</block>
			
			<!-- 分隔线 -->
			<view class="padding-xs margin-top-sm margin-lr-xs bg-white"></view>
			
			<!-- 直推 -->
			<view class="col-3 text-white padding-lr margin-top-sm margin-lr-sm flex align-center bg-orange radius" v-for="son in son_list" :key="son.id">
				<view class="cu-avatar round lg" style="background-image: url(&quot;https://ossweb-img.qq.com/images/lol/web201310/skin/big10001.jpg&quot;);"></view>
				<view class="flex-sub text-left">
					<view class="padding text-xl">
						<block v-if="son.nickname != '设置昵称'"><text class="">{{son.nickname}}</text><br /></block>
						<block v-if="son.nickname == '设置昵称'"><text class="">暂无</text><br /></block>
						<text class=" text-sm">{{son.mobile}}</text><br />
						<block v-if="son.wx_no != 0"><text class=" text-sm">{{son.wx}}</text><br /></block>
						<block v-if="son.wx_no == 0"><text class=" text-sm">暂无</text><br /></block>
						<text class=" text-sm">实名状态
							<block v-if="son.is_real_name == 0"><text class="cu-btn margin-left-sm round sm text-gray">未实名</text></block>
							<block v-if="son.is_real_name == 1"><text class="cu-btn margin-left-sm bg-green round sm">已实名</text></block>
						</text>
						
					</view>
				</view>
				<view class="text-right">
					<text class=" text-sm ">团队人数{{son.team_num}}</text><br />
					<text class=" text-sm ">注册时间</text><br />
					<text class=" text-sm">{{son.reg_date|timeStamp}}</text>
				</view>
			</view>
		</view>
		
	</view>
</template>

<script>
	var api = require('../../components/js/api.js');
	export default{
		data (){
			return {
				userinfo:'',
				team_num:'0',
				son_num:'0',
				pinfo:'',
				son_list:'',
				hyd:'0'
			}
		},
		onShow() {
			var userinfo = uni.getStorageSync('userinfo');
			this.userinfo = userinfo;
			this.get_son_num();
			this.get_pinfo();
			this.get_son_list();
			this.get_team_num();
			this.get_total_team_active();
		},
		filters: {
					// timeStamp: function(value) {
					// 	if (!value) return '';
					// 	var now = new Date(value);
					// 	console.log("time:" + JSON.stringify(now));
					// 	var year = now.getFullYear();
					// 	var month = now.getMonth() + 1;
					// 	if (month < 10) {
					// 		month = '0' + month
					// 	}
					// 	var date = now.getDate();
					// 	if (date < 10) {
					// 		date = '0' + date
					// 	}
					// 	return year + "-" + month + "-" + date
					// },
					timeStamp: function(value) {  //具体到时分秒
						var now = new Date(value*1000); //时间戳为10位需*1000，时间戳为13位的话不需乘1000
						var year = now.getFullYear();
						var month = ("0" + (now.getMonth() + 1)).slice(-2);
						var sdate = ("0" + now.getDate()).slice(-2);
						var hour = ("0" + now.getHours()).slice(-2);
						var minute = ("0" + now.getMinutes()).slice(-2);
						var second = ("0" + now.getSeconds()).slice(-2);
						// 拼接
						var result = year + "-" + month + "-" + sdate + " " + hour + ":" + minute;
						// 返回
						return result;
					}
				},
		methods:{
			get_son_num(){
				api.get({
					url:'Api/UserApi/get_son_num',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						// console.log(res);
						this.son_num = res.message;
					}
				})
			},
			get_pinfo(){
				api.get({
					url:'Api/UserApi/get_pinfo',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						// console.log(res);
						this.pinfo = res.message;
					}
				})
			},
			get_son_list(){
				api.get({
					url:'Api/UserApi/get_son_list',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						// console.log(res);
						this.son_list = res.message;
					}
				})
			},
			get_team_num(){
				api.get({
					url:'Api/UserApi/get_team_num',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						// console.log(res);
						this.team_num = res.message;
					}
				})
			},
			get_total_team_active(){
				api.get({
					url:'Api/UserApi/get_total_team_active',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						console.log(res);
						this.hyd = res.message;
					}
				})
			}
		}
	}
</script>

<style>
	
</style>