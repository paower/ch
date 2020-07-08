<template>
		<view class="content">
			<cu-custom bgColor="bg-gradual-blue" :isBack="true">
				<block slot="backText"></block>
				<block slot="content">账号管理</block>
			</cu-custom>
			<view class="list">
				<view class="row">
					<view class="title">手机号码</view>
					<view class="right">
						<view class="tis tis01">{{mygrade.mobile}}</view>
					</view>
				</view>
				<!-- <view class="row">
					<view class="title">钱包地址</view>
					<view class="right">
						<view class="tis tis01">{{mygrade.wallet_add}}</view>
					</view>
				</view> -->
				<view @click="certification()" class="row">
					<view class="title">身份认证</view>
					<view class="right">
						<view class="tis">
							{{mygrade.is_real_name== 1 ?'已认证':'去认证'}}</view>
						<view class="icon"><image src="../../static/arrow-right.png" /></view>
					</view>
				</view>
				<view @click="twocertification()" class="row">
					<view class="title">二级认证</view>
					<view class="right">
						<view class="tis">
							{{mygrade.industry_verify== 1 ?'已认证':'去认证'}}
						</view>
						<view class="icon"><image src="../../static/arrow-right.png" /></view>
					</view>
				</view>
				
				<view @click="bank_list()" class="row">
					<view class="title">收款方式</view>
					<view class="right">
						<view class="icon"><image src="../../static/arrow-right.png" /></view>
					</view>
				</view>
				<view @click="loginpw()" class="row">
					<view class="title">修改登录密码</view>
					<view class="right">
						<view class="icon"><image src="../../static/arrow-right.png" /></view>
					</view>
				</view>
				<view @click="securityspw()" class="row">
					<view class="title">修改安全密码</view>
					<view class="right">
						<view class="icon"><image src="../../static/arrow-right.png" /></view>
					</view>
				</view>
				<view @click="forget()" class="row">
					<view class="title">忘记密码</view>
					<view class="right">
						<view class="icon"><image src="../../static/arrow-right.png" /></view>
					</view>
				</view>
			</view>
		</view>
</template>

<script>
var api = require('../../components/js/api.js'); 
export default {
	data() {
		return {
			appcache: '0Mb',
			mygrade:[],
		};
	},
	onLoad(e) {
		var self = this;
		// #ifdef APP-PLUS
		// 锁定屏幕方向
		plus.cache.calculate(function(size) {
			console.log(size);
			self.appcache = formatter.formatFileSize(size);
		});
		// #endif
	},
	onShow() {
		api.post({
			url: 'Api/UserApi/mygrade',
			data: {openid:uni.getStorageSync('userinfo').openid},
			success: res => {
				if(res.status==1){
					this.mygrade = res.result;
				}
			}
		})
	},
	methods: {
		twocertification(){
			if(this.mygrade.industry_verify!=1){
				uni.navigateTo({
					url:'/pages/user/twocertification'
				})
			}
			
		},
		forget(){
			uni.navigateTo({
				url: '/pages/login/forget'
			});
		},
		certification() {
				if(this.mygrade.is_real_name!=1){
					uni.navigateTo({
						url: '/pages/user/certification'
					});
				}
				
			},
			loginpw() {
					uni.navigateTo({
						url: '/pages/my/loginpw'
					});
				},
			securityspw() {
					uni.navigateTo({
						url: '/pages/my/securityspw'
					});
				},
			bank_list() {
					uni.navigateTo({
						url: '/pages/bank/bank_list'
					});
				},
		showType(tbIndex) {
			this.tabbarIndex = tbIndex;
			this.list = this.orderList[tbIndex];
		},
		clearClick: function() {
			uni.showModal({
				title: '清除缓存',
				content: '清除缓存后保存的图片草稿都会被清除？确定要清除缓存吗？',
				success: function(res) {
					if (res.confirm) {
						// 清除缓存
						uni.clearStorage();
						//同步清缓存
						// uni.clearStorageSync();
						// 两秒后重启
						// #ifdef APP-PLUS
						uni.showToast({
							icon: 'none',
							duration: 3000,
							title: '清除成功2秒后重启'
						});
						setTimeout(function() {
							uni.hideToast();
							plus.runtime.restart();
						}, 2000);
						// #endif
						// 两秒后跳转
						// #ifdef H5 || MP-WEIXIN
						uni.showToast({
							icon: 'none',
							duration: 3000,
							title: '清除成功2秒后刷新'
						});
						setTimeout(function() {
							uni.navigateTo({
								url: 'pages/index/index'
							});
						}, 2000);

						// #endif
					} else if (res.cancel) {
						// console.log('用户点击取消');
					}
				}
			});
		}
	}
};
</script>
	
<style lang="scss">
page {
	background-color: #18191d;
}
.icon{
	height: 40upx;
}
.icon image{
	width: 40upx;
	height: 40upx;
	line-height: 40upx;
}
.content {
	padding-bottom: 20upx;
	.list {
		width: 100%;
		padding-left: 4%;
		
		margin-bottom: 20upx;
		.row {
			widows: 100%;
			min-height: 90upx;
			display: flex;
			align-items: center;
			justify-content: space-between;
			// border-bottom: solid 1upx #eee;
			&:last-child {
				border-bottom: none;
			}
			.title {
				font-size: 30upx;
				color: #FFFFFF;
			}
			.right {
				display: flex;
				align-items: center;
				color: #999;
				.tis {
					font-size: 26upx;
					margin-right: 5upx;
					max-height: 120upx;
					image {
						width: 100upx;
						height: 100upx;
						border-radius: 100%;
						margin: 10upx 0;
					}
				}
				.tis01{
					margin-right: 43upx;
				}
			}
		}
	}
}
</style>
