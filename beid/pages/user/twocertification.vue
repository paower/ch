<template>
	<view class="center">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">二级认证</block>
		</cu-custom>
		<form>
		<view class="cu-form-group margin-top">
			<view class="title">行业类型</view>
			<picker @change="PickerChange" :value="index" :range="picker">
				<view class="picker">
					{{index>-1?picker[index]:'三农精品'}}
				</view>
			</picker>
		</view>
		<!-- 二级认证 -->
		<view class="cu-form-group11">
			<view class="title title11">公司名称</view>
		</view>
		<view class="cu-form-group ">
			<input placeholder="请输入公司名称" name="input" v-model="company"></input>
		</view>
		<!-- 二级认证执照 -->
		<view class="cu-bar">
			<view class="action">
				营业执照
			</view>
		</view>
		<view class="cu-form-group">
			<view class="grid col-4 grid-square flex-sub">
				<view class="bg-img" @tap="ViewImage" :data-url="returnImgPath" v-if="returnImgPath">
				<image :src="returnImgPath"></image>
					<view class="cu-tag bg-red"  @tap.stop="DelImg">
						<text class='cuIcon-close'></text>
					</view>
				</view>
				<view class="solids" @tap="ChooseImage" v-if="is_verify==-1 || is_verify==2">
					<text class='cuIcon-cameraadd'></text>
				</view>
			</view>
		</view>
		<!-- 二级认证执照结束 -->
		
		<view class="cu-form-group"></view>
		</form>
		<view class="buttonBox" @click="submit" v-if="is_verify==-1">提交</view>
		<view class="buttonBox"  v-if="is_verify==0">等待审核</view>
		<view class="buttonBox"  v-if="is_verify==1">审核成功</view>
		<view class="buttonBox"  @click="submit" v-if="is_verify==2">重新审核</view>
	</view>
	
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				index: 0,
				picker: ['选择行业'],
				imgList: [],
				company:'',
				returnImgPath:'',
				is_verify:-1
			}
		},
		onLoad() {
			this.gethy();
			this.get_id_card()
		},
		methods: {
			get_id_card(){
				api.get({
					url: 'Api/VerifyApi/GetHYData',
					data: {openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						if(res.status==1){
							this.index = res.data.industry_id,
							this.company = res.data.company,
							this.returnImgPath = res.data.license,
							this.is_verify = res.data.status
						}
					}
				})
			},
			submit(){
				if(this.index<1){
					uni.showToast({
						title: '请选择行业',
						icon: 'none',
						duration: 1000
					});
					return;
				}
				if(this.company.length<1){
					uni.showToast({
						title: '请填写公司',
						icon: 'none',
						duration: 1000
					});
					return;
				}
				if(this.returnImgPath.length<1){
					uni.showToast({
						title: '请上传营业执照',
						icon: 'none',
						duration: 1000
					});
					return;
				}
				api.post({
					url:'Api/VerifyApi/industry_verify',
					data:{openid:uni.getStorageSync('userinfo').openid,industry_id:this.index,company:this.company,license:this.returnImgPath},
					success:res=>{
					
							uni.showToast({
								title: res.message,
								icon: 'none',
								duration: 1000
							});
						
					}
				})
			},
			gethy(){
				api.get({
					url:'Api/VerifyApi/get_industry_list',
					data:{openid:uni.getStorageSync('userinfo').openid},
					success:res=>{
						if(res.status==1){
							for (let item of res.data) {
								this.picker = this.picker.concat(item.industry_name)
							}
						}
					}
				})
			},
			PickerChange(e) {
				this.index = e.detail.value
			},
			ChooseImage() {
				var _that = this;
				uni.chooseImage({
					count: 1, //默认1
					sizeType: ['original', 'compressed'], //可以指定是原图还是压缩图，默认二者都有
					sourceType: ['album'], //从相册选择
					success: (res) => {
						const tempFilePaths = res.tempFilePaths;
						const uploadTask = uni.uploadFile({
						  url : 'http://192.168.0.164/Api/UserApi/otherUpload',
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
								_that.returnImgPath = res.data;
								
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
					title: '删除营业执照',
					content: '确定要删除？',
					cancelText: '取消',
					confirmText: '删除',
					success: res => {
						if (res.confirm) {
							this.imgList.splice(e.currentTarget.dataset.index, 1)
							this.returnImgPath = '';
						}
					}
				})
			},
		}
	}
</script>
<style lang="scss">
	page{
		background-color: #18191d;
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
	.rightsub{
		margin-right: 30upx;
	}
	.cu-form-group,.cu-form-group11{
		background: none;
		border-top: none;
		
	.title{
		color: #FFFFFF;
		}
	.title11{
		font-size: 30upx;
		color: #dadada;
		}
	input{
		color: #FFFFFF;
	}
	.picker{
		color:#e2e2e2;
	}	
	}
	.action{
		font-size: 20upx;
		color: #dadada;
		}
	.cu-form-group11{
		padding: 1px 14px;
		display: -webkit-box;
		display: -webkit-flex;
		display: flex;
		-webkit-box-align: center;
		-webkit-align-items: center;
		align-items: center;
		min-height: 27px;
		-webkit-box-pack: justify;
		-webkit-justify-content: space-between;
		justify-content: space-between;
	}
	.solids{
		width: 100% !important;
	}
	.bg-img{
		width: 100% !important;
		height: auto;
	}
</style>