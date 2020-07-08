<template>
	<view class="content" >
	<view class="top">
		<cu-custom bgColor="bg-transparent" :isBack="true">
			<block slot="backText"></block>
			<block slot="content"> </block>
		</cu-custom>
	</view>
	<view class="banner">
		<dl>
			<dt><image :src="headimg" mode=""></image></dt>
			<dd>邀请二维码</dd>
		</dl>
		<view class="img">
			<image :src="qrcode" mode=""></image>
		</view>
		
		<view>
			<view class="text-center">您的邀请码</view>
		</view>
		<view class="cu-item margin text-bold text-sl">
			<view class="text-center text-cyan">{{yqm}}</view>
		</view>
		<view class="cu-item text-center">
			<button class="cu-btn round bg-cyan" @click="copyyqm">复制</button>
		</view>
		<!-- <view class="tgtit">邀请链接：<text class="tugurl">{{url}}</text></view> -->
		<view class="sharbuttn">
			<view class="btn" @click="save">保存二维码</view>
			<view class="btn" @click="sharurl">复制邀请链接</view>
		</view>
		
		<view class="shartitle"><view>分享</view></view>
		<view class="sharapk" @click="share">
			<view><image src="../../static/img/weact.png"></image></view>
			<view><image src="../../static/img/shar.png"></image></view>
			<view><image src="../../static/img/qq.png"></image></view>
		</view>
		
		
		<view class="bottom">
			<ul>
				<li>1、好友识别二维码通过手机号进行注册</li>
				<li>2、也可分享此页面到微信或QQ邀请好友注册</li>
			</ul>
		</view>
	</view>
	
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data(){
			return {
				qrcode:'',
				url:'',
				headimg:'',
				yqm:''
			}
		},
		onLoad() {
			// this.version = plus.runtime.version;
			uni.getProvider({
				service: 'share',
				success: (e) => {
					let data = [];
					for (let i = 0; i < e.provider.length; i++) {
						switch (e.provider[i]) {
							case 'weixin':
								data.push({
									name: '分享到微信好友',
									id: 'weixin'
								})
								data.push({
									name: '分享到微信朋友圈',
									id: 'weixin',
									type: 'WXSenceTimeline'
								})
								break;
							case 'qq':
								data.push({
									name: '分享到QQ',
									id: 'qq'
								})
								break;
							default:
								break;
						}
					}
					this.providerList = data;
				},
				fail: (e) => {
					console.log('获取登录通道失败'+ JSON.stringify(e));
				}
			});
			this.getdata();
		},
		methods:{
			//获取相关数据
			getdata(){
				api.get({
					url:'Api/UserApi/Sharecode',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						if(res.status==1){
							console.log(res)
							this.qrcode = res.qrcode;
							this.url = res.url;
							this.headimg = res.headimg;
							this.yqm = res.yqm;
						}
					}
				})
			},
			//复制分享链接
			sharurl(){
				uni.setClipboardData({
					data: this.url,
					success: function () {
						console.log('success');
						uni.showModal({
							title: '复制成功',
							content: '内容已复制到粘贴板，可前往其他应用粘贴查看。', 
							showCancel:false,
							success: function(res) {
								if (res.confirm) {											 
									//console.log('用户点击确定');
								} else if (res.cancel) {
									//console.log('用户点击取消');
								}
							}
						});
					}
				});
			},
			//复制邀请码
			copyyqm(){
				uni.setClipboardData({
					data: this.yqm,
					success: function () {
						console.log('success');
						uni.showModal({
							title: '复制成功',
							content: '内容已复制到粘贴板，可前往其他应用粘贴查看。', 
							showCancel:false,
							success: function(res) {
								if (res.confirm) {											 
									//console.log('用户点击确定');
								} else if (res.cancel) {
									//console.log('用户点击取消');
								}
							}
						});
					}
				});
			},
			//保存图片到相册
			save(){
				uni.showActionSheet({
					itemList:['保存图片到相册'],
					success: () => {
						plus.gallery.save(this.qrcode, function() {
							uni.showToast({
								title:'保存成功',
								icon:'none'
							})
						}, function() {
							uni.showToast({
								title:'保存失败，请重试！',
								icon:'none'
							})
						});
					}
				})
			},
			share(e) {
				if (this.providerList.length === 0) {
					uni.showModal({
						title: '当前环境无分享渠道!',
						showCancel: false
					})
					return;
				}
				let itemList = this.providerList.map(function (value) {
					return value.name
				})
				
				uni.showActionSheet({
					itemList: itemList,
					success: (res) => {
						console.log(this.providerList[res.tapIndex].id)
						if(this.providerList[res.tapIndex].id=='qq'){
							this.type=1
						}else{
							this.type=0
						}
						 uni.share({
						 	provider: this.providerList[res.tapIndex].id,
						 	scene: this.providerList[res.tapIndex].type && this.providerList[res.tapIndex].type === 'WXSenceTimeline' ? 'WXSenceTimeline' : "WXSceneSession",
						 	type: this.type,
						 	title:'##',
						 	summary: '#######',
						 	imageUrl:'http://###.com/wxtest/logo.png',
						 	href:"https://###.cn/uniapp",
						 	success: (res) => {
						 		console.log("success:" + JSON.stringify(res));
						 	},
						 	fail: (e) => {
						 		uni.showModal({
						 			content: e.errMsg,
						 			showCancel:false
						 		})
						 	}
						 });
					}
				})
				
				
				
			 
			},
			openLink() {
				plus.runtime.openWeb(this.sourceLink)
			},
			returnsetup(){
			uni.navigateTo({
				url:'/pages/my/setup'
			});
		}
		}
	}
	
	
</script>

<style>
	.tugurl{
		color: #999;
	}
	.sharbuttn{
		display: flex;
		justify-content: center;
	}
	.shartitle{
		    width: 80%;
			text-align: center;
			margin-left: 10%;
			border-bottom: 1px solid #dddddd;
			position: relative;
			height: 60upx;
	}
	.tgtit{
		text-align: center;
		margin-top: 20upx;
	}
	.shartitle view{
		    height: 50upx;
			line-height: 50upx;
			font-size: 28upx;
			color: #999;
			width: 120upx;
			margin: 32upx auto;
			position: absolute;
			background: #fff;
			left: 50%;
			margin-left: -60upx;
	}
	.sharapk{
	 display: flex;
	 justify-content: center;
	 margin: 20upx auto
	}
	.sharapk view{
		margin: 40upx;
	}
	.sharapk view image{
		height: 80upx;
		width: 80upx;
	}
	.content{
		width: 100%;
		/* background-color: #ffffff; */
	}
	.top{
		width: 100%;
		height:350upx;
		background: url(../../static/img/banner.png) no-repeat ;
		background-size:100% ;
		background-position:center center;
	}
	.top image{
		width: 45upx;
		height: 45upx;
		margin: 20upx 0 0 10upx;
	}
	.banner{
		width: 100% ;
		background-color: #FFFFFF;
		border-radius: 60upx 60upx 0 0;
		margin-top: -60upx;
	}
	.banner dl{
		margin-top: -80upx;
	}
	.banner dl dt{
		text-align: center;
	}
	.banner dl dt image{
		width: 160upx;
		height: 160upx;
		border-radius:50% ;
		margin-top: -80upx;
	}
	.banner dl dd{
		text-align: center;
	}
	.img{
		width: 300upx;
		height: 300upx;
		/* background-color: red; */
		margin: 0 auto;
		margin-top: 60upx;
	}
	.img image{
		width: 100%;
		height: 100%;
	}
	.btn{
		width: 260upx;
		height: 60upx;
		line-height: 60upx;
		margin: 0 auto;
		margin-top: 60upx;
		border-radius: 40upx;
		border: 0;
		font-size: 26upx;
		outline: 0;
		background: #33b17b;
		color: #FFFFFF;
		text-align: center;
	}
	.bottom{
		width: 100%;
		height: 200upx;
		background-position:left bottom;/* 设置背景图片位置 */
		background-size: 20%;
	}
	.bottom ul{
		padding-left: 40upx;
		box-sizing: border-box;
	}
	.bottom ul li{
		width: 100%;
		height: 60upx;
		list-style: none;
	}
</style>
