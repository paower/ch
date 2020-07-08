<template>
	<view class="center">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">实名认证</block>
		</cu-custom>
	<view class="container999">
		<view class="title">说明：慎重填写以确保资料真实准确！</view>
		<view class='line'>
		  <view class="lineRight">  
			<input class="input" placeholder-class="plaClass" placeholder='请输入姓名' v-model="truename" ></input>
			</view>
		</view>
		<view class='line'>
		  <view class="lineRight">  
			<input class="input" placeholder-class="plaClass" placeholder='请输入真实身份证号' v-model="id_card"></input>
			</view>
		</view>
		<!-- 身份证正面 -->
		<view class="cu-bar">
			<view class="action">
				身份证正面
			</view>
		</view>
		<view class="cu-form-group">
			<view class="grid col-2 grid-square flex-sub">
				<view class="bg-img"  @tap="ViewImage" :data-url="pic1" v-if="pic1">
				 <image :src="pic1"></image>
					<view class="cu-tag bg-red"  @tap.stop="DelImg(1)" v-if="is_verify==-1">
						<text class='cuIcon-close'></text>
					</view>
				</view>
				<view class="solids" @tap="ChooseImage(1)" v-if="is_verify==-1">
					<text class='cuIcon-cameraadd'></text>
				</view>
			</view>
			<view class="bg-img radius" style="background-image: url(../../static/card1.png); width: 400upx; height: 300upx;"></view>
		</view>
		<!-- 身份证正面结束 -->
		<!-- 身份证背面 -->
		<view class="cu-bar">
			<view class="action">
				身份证背面
			</view>
		</view>
		<view class="cu-form-group">
			<view class="grid col-2 grid-square flex-sub">
				<view class="bg-img"  @tap="ViewImage" :data-url="pic2" v-if="pic2">
				 <image :src="pic2"></image>
					<view class="cu-tag bg-red"  @tap.stop="DelImg(2)"  v-if="is_verify==-1">
						<text class='cuIcon-close'></text>
					</view>
				</view>
				<view class="solids" @tap="ChooseImage(2)" v-if="is_verify==-1">
					<text class='cuIcon-cameraadd'></text>
				</view>
			</view>
			<view class="bg-img radius" style="background-image: url(../../static/card2.png); width: 400upx; height: 300upx;"></view>
		</view>
		<!-- 身份证背面结束 -->
		<!-- <view class="title">已阅读并同意
			<text class="agreement1" @click="agreement1()">《用户协议》</text>和
			<text class="agreement2" @click="agreement2()">《用户隐私协议》</text>
		</view> -->
	
			<view class="buttonBox" @click="submit" v-if="is_verify==-1">提交</view>
			<view class="buttonBox" v-else-if="is_verify==0">等待审核</view>
			<view class="buttonBox" v-else-if="is_verify==1">审核通过</view>
			<view class="buttonBox" v-else-if="is_verify==2">重新审核</view>

	</view>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return{
				id_card:'',
				truename:'',
				imgList: [],
				pic1:'',
				pic2:'',
				is_verify:-1
			}
		},
		onLoad() {
			var openid = uni.getStorageSync('userinfo').openid;
			this.get_id_card(openid);
		},
		onShow() {
			var openid = uni.getStorageSync('userinfo').openid;
			this.get_id_card(openid);
		},
		methods:{
			PickerChange(e) {
				this.index = e.detail.value
			},
			ChooseImage(id) {
				var _that = this;
				uni.chooseImage({
					count: 1, //默认1
					sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
					sourceType: ['album'], //从相册选择
					success: (res) => {
						//执行上传
						const tempFilePaths = res.tempFilePaths;
						const uploadTask = uni.uploadFile({
						  url : 'http://192.168.0.94/Api/UserApi/otherUpload',
						  filePath: tempFilePaths[0],
						  name: 'file',
						  formData: {
							'openid': uni.getStorageSync('userinfo').openid
						  },
						  success: function (uploadFileRes) {
							var res = JSON.parse(uploadFileRes.data);
							
							if(res.code==400){
							   uni.showToast({
								title: res.message,
								icon: 'none',
								duration: 1000
							   });
							}else{
								_that.imgList = tempFilePaths;
								if(id==1){
									_that.pic1 = res.data;
								}else{
									_that.pic2 = res.data;
								}
							}
						  }
						});
					}
				});
			},
			ViewImage(e) {
				uni.previewImage({
					urls: this.imgList,
					current: e.currentTarget.dataset.url
				});
			},
			DelImg(e) {
				uni.showModal({
					title: '删除身份证',
					content: '确定要删除？',
					cancelText: '取消',
					confirmText: '删除',
					success: res => {
						if (res.confirm) {
							if(e==1){
								this.pic1='';
							}else{
								this.pic2=''
							}
						}
					}
				})
			},
			get_id_card(openid){
				api.get({
					url: 'Api/UserApi/get_id_card',
					data: {openid:openid},
					success:res=>{
						if(res.status==1){
							this.id_card = res.result.id_card,
							this.truename = res.result.truename,
							this.is_verify = res.result.is_verify,
							this.pic1 = res.result.pic1,
							this.pic2 = res.result.pic2
						}
					}
				})
			},
			submit(){
				var openid = uni.getStorageSync('userinfo').openid;
				if (this.truename.length == "") {
				     uni.showToast({
				        icon: 'none',
						position: 'bottom',
				        title: '姓名不能为空'
				    });
				    return;
				}
				if (this.id_card.length < 16) {
				    uni.showToast({
				        icon: 'none',
						position: 'bottom',
				        title: '请输入正确身份证号'
				    });
				    return;
				}
				if(this.pic1.length<1 || this.pic2.length<1){
					uni.showToast({
					    icon: 'none',
						position: 'bottom',
					    title: '请正确上传身份证照片'
					});
					return;
				}
				api.post({
					url: 'Api/VerifyApi/sub_verify',
					data: {openid:openid,id_card: this.id_card,truename:this.truename,pic1:this.pic1,pic2:this.pic2},
					success: res => {
						uni.showToast({
							icon: 'none',
							position: 'bottom',
							title: res.message
						});
					}
				})
			},
			agreement1(){
				uni.navigateTo({
					url:'/pages/msg/user_agreement'
				});
			},
			agreement2(){
				uni.navigateTo({
					url:'/pages/msg/privacy_agreement'
				});
			},
			
		},
		
	}
</script>

<style lang="scss">
	page{
		background-color: #18191d;
	}
	.plaClass{
		color: #dbdbdb;
	}
	.container999{
		.title{
			height: 80rpx;
			line-height: 80rpx;
			padding-left: 4%;
			// border-bottom: 1px solid #f5f5f5;
		}
		.agreement1,.agreement2{
			color: #007AFF;
		}
		.buttonBox{
			width: 91%;
			margin: 30upx auto;
			height: 84rpx;
			border-radius: 84rpx;
			color: white;
			display: flex;
			align-items: center;
			justify-content: center;
			// position: fixed;
			bottom: 100rpx;
			left: 0;
			right: 0;
			background-color: #4a8be9;
		}
		.tri{
			width:0;
			height:0;
			border-left:8rpx solid transparent;
			border-right:8rpx solid transparent;
			right: 30rpx !important;
			border-top:16rpx solid #545151;
		}
		.line{
		  height: 85rpx;
		  width: 92%;
		  margin: 30upx auto;
		  // border-bottom: 1px solid #f5f5f5;
		  display: flex;
		  .lineRight{
			  .tips{
				  color: #9a9a9c;
				  font-weight: bold;
			  }
			 flex: 1;
			  height: 100%;
			  display: flex;
			  align-items: center;
			  justify-content: space-between;
			  position: relative;
		  }
			.lineLeft{
			  display: flex;
			  width: 20%;
			  align-items: center;
			  height: 100%;
			  font-weight: bold;
			  color: #000000;
			}
			.input{
				padding-right: 20rpx;
				height: 100%;
				width: 100%;
				text-align: left;
				padding-left: 20upx;
				font-size: 28rpx;
				color: #FFFFFF;
				border: 1px solid #535353;
				border-radius: 80upx;
			}
			.picker{
			 height: 100%;
			 justify-content: flex-start;
			  display: flex;
			  align-content: center;
			  width: 500rpx;
			}
			picker{
			  height: 84rpx;
			  line-height: 84rpx;
			}
		}
		width: 100vw;
		font-size: 28upx;
		min-height: 100vh;
		overflow: hidden;
		color: #6b8082;
		position: relative;
	}
</style>
