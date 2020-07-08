<template>
	<view class="center">
		
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">添加收款方式</block>
			<view slot="right" class="rightsub" @tap="getCropperImage">完成</view>
		</cu-custom>
		<form>
		<view class="cu-form-group margin-top">
			<view class="title">收款方式</view>
			<picker @change="PickerChange" :value="paytype" :range="picker" v-if="form=='add'">
				<view class="picker">
					{{paytype>0?picker[paytype]:'支付宝'}}
				</view>
			</picker>
			<picker :value="paytype" :range="picker" v-if="form=='edit'">
				<view class="picker">
					{{paytype>0?picker[paytype]:'支付宝'}}
				</view>
			</picker>
		</view>
		<!-- 支付宝 -->
		<block v-if="paytype==0 || paytype==-1">
			<view class="cu-form-group11">
				<view class="title title11">姓名</view>
			</view>
			<view class="cu-form-group ">
				<input placeholder="请输入姓名" name="input" v-model="pay_name"></input>
			</view>
			<view class="cu-form-group11">
				<view class="title title11">支付宝账户</view>
			</view>
			<view class="cu-form-group">	
				<input placeholder="请输入支付宝账户" name="input" v-model="pay_number"></input>
			</view>
			<!-- 二维码 -->
			<view class="cu-bar">
				<view class="action">
					收款二维码
				</view>
			</view>
			<view class="cu-form-group">
				<view class="grid col-4 grid-square flex-sub">
					<view class="bg-img"  @tap="ViewImage" :data-url="returnImgPath" v-if="returnImgPath!=''">
					 <image :src="returnImgPath"></image>
						<view class="cu-tag bg-red"  @tap.stop="DelImg" v-if="form=='add'">
							<text class='cuIcon-close'></text>
						</view>
					</view>
					<view class="solids" @tap="ChooseImage" v-if="imgList.length<1">
						<text class='cuIcon-cameraadd'></text>
					</view>
				</view>
			</view>
		</block>
		<!-- 二维码结束 -->
		
		<!-- 银行卡 -->
		<block v-if="paytype==1">
			<view class="cu-form-group11">
				<view class="title  title11">姓名</view>
			</view>
			<view class="cu-form-group ">	
				<input placeholder="请输入姓名" name="input" v-model="pay_name"></input>
			</view>
			<view class="cu-form-group11">
				<view class="title  title11">开户银行</view>
			</view>
			<view class="cu-form-group">	
				<input placeholder="请输入开户银行" name="input" v-model="open_bank"></input>
			</view>
			<view class="cu-form-group11">
				<view class="title  title11">开户支行</view>
			</view>
			<view class="cu-form-group">	
				<input placeholder="请输入开户支行" name="input" v-model="opening_branch"></input>
			</view>
			<view class="cu-form-group11">
				<view class="title  title11">银行卡号</view>
			</view>	
			<view class="cu-form-group">	
				<input placeholder="请输入银行卡号" name="input" v-model="pay_number"></input>
			</view>
		</block>
		
		<!-- 微信 -->
		<block v-if="paytype==2">
			<view class="cu-form-group11">
				<view class="title  title11">姓名</view>
			</view>	
			<view class="cu-form-group ">	
				<input placeholder="请输入姓名" name="input" v-model="pay_name"></input>
			</view>
			<view class="cu-form-group11">
				<view class="title  title11">微信账户</view>
			</view>	
			<view class="cu-form-group">	
				<input placeholder="请输入微信账户" name="input" v-model="pay_number"></input>
			</view>
			<!-- 二维码 -->
			<view class="cu-bar">
				<view class="action">
					收款二维码
				</view>
			</view>
			<view class="cu-form-group">
				<view class="grid col-4 grid-square flex-sub">
					<view class="bg-img" @tap="ViewImage" :data-url="returnImgPath">
					<image :src="returnImgPath"></image>
						<view class="cu-tag bg-red"  @tap.stop="DelImg" v-if="form=='add'">
							<text class='cuIcon-close'></text>
						</view>
					</view>
					<view class="solids" @tap="ChooseImage" v-if="imgList.length<1">
						<text class='cuIcon-cameraadd'></text>
					</view>
				</view>
			</view>
		</block>
		<!-- 二维码结束 -->
		<view class="cu-form-group"></view>
		</form>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	export default {
		data() {
			return {
				paytype: 0,
				picker: ['支付宝', '银行卡', '微信'],
				imgList: [],
				returnImgPath:'',
				pay_name:'',
				pay_number:'',
				open_bank:'',
				opening_branch:'',
				form:'',
				id:''
			}
		},
		onLoad(options) {
			this.form = options.form;
			if(options.form=='edit'){
				this.paytype = options.type;
				this.pay_number = options.pay_number;
				this.getMybankinfo(options.id);
				this.id = options.id;
			}
		},
		methods: {
			getMybankinfo(id){
				api.get({
					url:'Api/UserApi/GetMyBankId',
					data:{
						openid:uni.getStorageSync('userinfo').openid,
						id:id
					},
					success:(res)=>{
						if(res.status==1){
							this.returnImgPath = res.result.img,
							this.pay_name = res.result.alipay_name,
							this.open_bank = res.result.open_bank,
							this.opening_branch = res.result.opening_branch
						}else{
							this.modelalert(res.message)
						}
					}
				})
			},
			PickerChange(e) {
				this.paytype = e.detail.value
				this.imgList = [];
				this.returnImgPath = '';
				this.pay_name = '';
				this.pay_number = '';
				this.opening_branch = '';
				this.open_bank = '';
			},
			ChooseImage() {
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
					title: '删除二维码',
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
			getCropperImage(){
				if(this.form=='add'){
					var url = 'Api/UserApi/addPayType';
				}else{
					var url = 'Api/UserApi/EditMyBank';
				}
				if(this.paytype==0 || this.paytype==1){					
					if(this.pay_name.length<1){
						this.modelalert('姓名有误')
						return;
					}
				}
				if(this.pay_number.length<1){
					this.modelalert('账号有误')
					return;
					
				}
				// if(this.paytype==0 || this.paytype==2){
				// 	if(this.returnImgPath.length==''){
				// 		this.modelalert('未上传收款码')
				// 		return;
				// 	}
				// }
				api.post({
					url: url,
					data: {
						"openid":uni.getStorageSync('userinfo').openid,
						"pay_number":this.pay_number,
						"pay_name":this.pay_name,
						"paytype":this.paytype,
						"qrcode":this.returnImgPath,
						"open_bank":this.open_bank,
						"opening_branch":this.opening_branch,
						"id":this.id
					},
					success:res=>{
						uni.showToast({
						    icon: 'none',
							position: 'bottom',
						    title: res.message
						});
					}
				})
			},
			modelalert(message){
				uni.showToast({
					title: message,
					icon: 'none',
					duration: 1000
				});
			}
		}
	}
</script>
<style lang="scss">
	page{
		background-color: #18191d;
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