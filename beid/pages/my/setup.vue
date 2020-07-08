<template>
	<view class="center">
		<cu-custom bgColor="bg-black" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">个人中心</block>
			
		</cu-custom>
		<view class="center-list">
			<view @click="editinfo()" class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-profile" style="color:#aa00ff"></text>
				<text class="list-text">用户信息</text>
				<text class="navigat-arrow">&#xe65e;</text>
			</view>
			<view @click="setting()" class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-settings" style="color:#00aa00"></text>
				<text class="list-text">帐号管理</text>
				<text class="navigat-arrow">&#xe65e;</text>
			</view>
			<view @click="team()" class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-friend" style="color:#ffaa00"></text>
				<text class="list-text">我的团队</text>
				<text class="navigat-arrow">&#xe65e;</text>
			 </view>
			<view @click="inscription()" class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-shopfill" style="color:#ff00ff"></text>
				<text class="list-text">慈场园</text>
				<text class="navigat-arrow">&#xe65e;</text>
			</view>
			<view @click="ability()" class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-favor" style="color:#aaff7f"></text>
				<text class="list-text">星级达人</text>
				<text class="navigat-arrow">&#xe65e;</text>
			 </view>
			<view @click="invitation()" class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-friendaddfill" style="color:#ffaa00"></text>
				<text class="list-text">邀请二维码</text>
				<text class="navigat-arrow">&#xe65e;</text>
			</view>
			<!-- <view class="center-list-item">
				<text class="list-icon">&#xe65f;</text>
				<text class="list-text">设置</text>
				<text class="navigat-arrow">&#xe65e;</text>
			</view> -->
			<view @click="transaction()" class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-activityfill" style="color:#ff0000"></text>
				<text class="list-text">流转中心</text>
				<text class="navigat-arrow">&#xe65e;</text>
			</view>
			<view @click="shoplist()" class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-taoxiaopu" style="color:#00ffff"></text>
				<text class="list-text">商城列表</text>
				<text class="navigat-arrow">&#xe65e;</text>
			</view>
			<view @click="bill()" class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-calendar" style="color:#aaaa00"></text>
				<text class="list-text">账单</text>
				<text class="navigat-arrow">&#xe65e;</text>
			</view>
			<view @click="about()" class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-global"  style="color:#aa00ff"></text>
				<text class="list-text">关于慈场</text>
				<text class="navigat-arrow">&#xe65e;</text>
			</view>
		</view>
		<view class="center-list">
			<view class="center-list-item">
				<text class="list-icon lg text-gray cuIcon-forwardfill" style="color:#ff007f"></text>
				<text @click="login()" class="list-text">安全退出</text>
			</view>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				
			}
		},
		methods: {
			goLogin() {
				if (!this.login) {
					console.log("点击前往登录")
				}
			},
			editinfo() {
				uni.navigateTo({
					url: '/pages/user/editinfo'
				});
			},
			about() {
				uni.navigateTo({
					url: '/pages/my/about'
				});
			},
			invitation() {
				uni.navigateTo({
					url: '/pages/my/invitation'
				});
			},
			setting() {
				uni.navigateTo({
					url: '/pages/my/setting'
				});
			},
			inscription() {
				uni.navigateTo({
					url: '/pages/my/inscription'
				});
			},
			login() {
				uni.removeStorageSync('userinfo');
				uni.navigateTo({
					url: '/pages/login/login'
				});
			},
			transaction() {
				uni.navigateTo({
					url: '/pages/index/transaction-buy'
				});
			},
			shoplist() {
				uni.showToast({
					icon:'none',
					title:'暂未开放',
				})
			},
			bill() {
				uni.navigateTo({
					url: '/pages/user/bill'
				});
			},
			ability() {
				uni.navigateTo({
					url: '/pages/my/ability'
				});
			},
			team(){
				uni.navigateTo({
					url:'/pages/my/team'
				})
			}
		}
	}
</script>

<style>
	@font-face {
		font-family: texticons;
		font-weight: normal;
		font-style: normal;
		src: url('../../static/font/font_984210_5cs13ndgqsn.ttf') format('truetype');
	}

	page {
		display: flex;
	}

	page {
		background-color: #18191d;
	}

	.center {
		flex-direction: column;
	}

	.cuIcon-forwardfill{
		color:"#ff007f"
	}
	.center-list {
		background-color: #18191d;
		margin-top: 20upx;
		width: 750upx;
		flex-direction: column;
	}

	.center-list-item {
		height: 90upx;
		width: 750upx;
		box-sizing: border-box;
		flex-direction: row;
		padding: 0upx 20upx;
	}

	.border-bottom {
		border-bottom-width: 1upx;
		border-color: #c8c7cc;
		border-bottom-style: solid;
	}

	.list-icon {
		width: 40upx;
		height: 90upx;
		margin: 21upx 15upx 0 0;
		font-size: 40upx;
		text-align: center;
	}

	.list-text {
		height: 90upx;
		line-height: 90upx;
		font-size: 30upx;
		color: #FFFFFF;
		flex: 1;
		text-align: left;
	}

	.navigat-arrow {
		height: 90upx;
		width: 40upx;
		line-height: 90upx;
		font-size: 34upx;
		color: #7d7d7d;
		float: right;
		text-align: right;
		font-family: texticons;
	}
</style>