<template>
	<view>
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">订单详情</block>
		</cu-custom>
		<view class="bg-bluebl">
			<view class="padding-xs flex align-center">
				<view class="flex-sub text-center">
					<view class="text-xsl padding">
						<text class="cuIcon-roundcheckfill text-green"></text>
					</view>
					<view class="text-xl">
						
						<text class="text-white text-bold" v-if="OrderInfo.status==3">订单完成</text>
						<text class="text-white text-bold" v-else-if="OrderInfo.status==0">挂单中</text>
						<text class="text-white text-bold" v-else-if="OrderInfo.status==6">申诉中</text>
						<text class="text-white text-bold" v-else-if="OrderInfo.status==5">已取消</text>
						<text class="text-white text-bold" v-else>下单成功</text>
					</view>
					<!-- 已完成状态 -->
					<!-- <view class="text-xl">
						<text class="text-white text-bold">已完成！</text>
					</view> -->
					
					<!-- 未付款状态 -->
					<view class="padding" v-if="OrderInfo.status==1">
						<view class=" padding bg-grey radius">等待付款...</view>
					</view>
					<!-- 已付款状态 -->
					<view class="padding" v-if="OrderInfo.status==2">
						<view class=" padding bg-green radius">已付款，等待确认...</view>
					</view>
				</view>
			</view>
			<view class="cu-bar solid-bottom">
				<view class="action text-bold">付款信息</view>
				<view class="action">
						<block v-if="OrderInfo.status==3">
							<text>订单完成</text>
						</block>
						<block v-else-if="OrderInfo.status==0">
							<text>挂单中</text>
						</block>
						<block v-else-if="OrderInfo.status==6">
							<text>申诉中</text>
						</block>
						<block v-else-if="OrderInfo.status==5">
							<text>已取消</text>
						</block>
						<block v-else>
							<uni-countdown :show-day="false" :hour="OrderInfo.hour" :minute="OrderInfo.minute" :second="OrderInfo.second"></uni-countdown>
						</block>
				</view>
			</view>
			<view class="cu-bar">
				<block v-if="!OrderInfo.is_me_sell"><view class="action">买家</view></block>
				<block v-if="OrderInfo.is_me_sell"><view class="action">卖家</view></block>
				<view class="action">
					<navigator>
						<text class="text-df"><span>{{OrderInfo.mj_username}}</span></text>
					</navigator>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">手机号</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>{{OrderInfo.mj_mobile}}</span></text>
					</navigator>
				</view>
			</view>
			<!-- 支付宝 -->
			<!-- <block v-for="(item,index) in OrderInfo.pay_info" :key="index" v-if="OrderInfo.status>0 || OrderInfo.type==1"> -->
			<block v-for="(item,index) in OrderInfo.pay_info" :key="index" v-if="OrderInfo.is_me_sell">
				<block v-if="item.type==1">
					<view class="cu-bar">
						<view class="action">姓名</view>
						<view class="action">
							<view @click="copy(item.alipay_name)">
								<text class="text-df"><span>{{item.alipay_name}}</span></text>
								<text class="cuIcon-copy padding-left"></text>
							</view>
						</view>
					</view>
					<view class="cu-bar">
						<view class="action">支付宝账号</view>
						<view class="action">
							<view @click="copy(item.alipay_number)">
								<text class="text-df"><span>{{item.alipay_number}}</span></text>
								<text class="cuIcon-copy padding-left"></text>
							</view>
						</view>
					</view>
					<view class="cu-bar">
						<view class="action">支付宝收款码</view>
						<view class="action">
							<view @click="Shouqi('alipay')">
								<text class="cuIcon-unfold padding-left"></text>
							</view>
						</view>
					</view>
					<view class="cu-bar" v-show="alipay">
						<image :src="item.img"></image>
					</view>
				</block>
				<!-- 银行卡 -->
				<block v-if="item.type==2">
					<view class="cu-bar">
						<view class="action">姓名</view>
						<view class="action">
							<view @click="copy(item.alipay_name)">
								<text class="text-df"><span>{{item.alipay_name}}</span></text>
								<text class="cuIcon-copy padding-left"></text>
							</view>
						</view>
					</view>
					<view class="cu-bar">
						<view class="action">开户银行</view>
						<view class="action">
							<view @click="copy(item.open_bank)">
								<text class="text-df"><span>{{item.open_bank}}</span></text>
								<text class="cuIcon-copy padding-left"></text>
							</view>
						</view>
					</view>
					<view class="cu-bar">
						<view class="action">开户支行</view>
						<view class="action">
							<view @click="copy(item.opening_branch)">
								<text class="text-df"><span>{{item.opening_branch}}</span></text>
								<text class="cuIcon-copy padding-left"></text>
							</view>
						</view>
					</view>
					<view class="cu-bar">
						<view class="action">银行卡号</view>
						<view class="action">
							<view @click="copy(item.alipay_number)">
								<text class="text-df"><span>{{item.alipay_number}}</span></text>
								<text class="cuIcon-copy padding-left"></text>
							</view>
						</view>
					</view>
				</block>
				<!-- 微信 -->
				<block v-if="item.type==3">
					<view class="cu-bar">
						<view class="action">姓名</view>
						<view class="action">
							<view @click="copy(item.alipay_name)">
								<text class="text-df"><span>{{item.alipay_name}}</span></text>
								<text class="cuIcon-copy padding-left"></text>
							</view>
						</view>
					</view>
					<view class="cu-bar">
						<view class="action">微信账号</view>
						<view class="action">
							<view @click="copy(item.alipay_number)">
								<text class="text-df"><span>{{item.alipay_number}}</span></text>
								<text class="cuIcon-copy padding-left"></text>
							</view>
						</view>
					</view>
					<view class="cu-bar">
						<view class="action">微信收款码</view>
						<view class="action">
							<view @click="Shouqi('wechat')">
								<text class="cuIcon-unfold padding-left"></text>
							</view>
						</view>
					</view>
					<view class="cu-bar" v-show="wechat">
						<image :src="item.img"></image>
					</view>
				</block>
			</block>
			<!-- 订单 -->
			<view class="cu-bar solid-top">
				<view class="action">订单金额</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>￥{{OrderInfo.tprice}}</span></text>
						<text class="cuIcon-copy padding-left"></text>
					</navigator>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">单价</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>{{OrderInfo.dprice}}CNY/慈点</span></text>
					</navigator>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">数量</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>{{OrderInfo.num}} 慈点</span></text>
						<text class="cuIcon-copy padding-left"></text>
					</navigator>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">订单号</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>{{OrderInfo.deal_sn}}</span></text>
						<text class="cuIcon-copy padding-left"></text>
					</navigator>
				</view>
			</view>
		</view>
		
		<view class="cu-bar btn-group bg-bluebl">
			
			<view class="cu-modal show" v-if="this.is_submit==1">
				<view class="cu-dialog">
					<!-- <view class="cu-bar bg-white justify-end">
						<view class="content">请输入安全密码</view>
					</view> -->
					<view class="padding-xl">
						<input type="password" placeholder="请输入安全密码" v-model="anquan" style="border: 2upx solid #ccc;height: 80upx; border-radius: 12upx;margin-top: 10upx;color: #000000;">
					</view>
					<view class="cu-bar bg-white justify-end">
						<view class="action" style="width: 100%;">
							<button class="cu-btn line-green text-green" @tap="hideModal">取消</button>
							<button class="cu-btn bg-green margin-left" @tap="subfk" v-if="OrderInfo.status==1">确认</button>
							<button class="cu-btn bg-green margin-left" @tap="comfire" v-if="OrderInfo.status==2">确认</button>
			
						</view>
					</view>
				</view>
			</view>
			
			<button class="cu-btn bg-grey shadow-blur round" v-if="OrderInfo.status==1" @click="quxiao()">取消订单</button>
			
			<block v-if="OrderInfo.status==1">
				<button @click="checkyes()"  class="cu-btn bg-blue shadow-blur round" v-if="OrderInfo.is_my_order==1">确认付款</button>
				<button class="cu-btn bg-blue shadow-blur round" disabled="disabled" v-else>等待付款</button>
			</block>
			<block v-if="OrderInfo.status==2">
				<block v-if="OrderInfo.is_my_order==1">
					<button class="cu-btn bg-blue shadow-blur round" disabled="disabled">等待确认</button>
				</block>
				<block v-else>
					<button class="cu-btn bg-grey shadow-blur round" @click="shensu()">订单申诉</button>
					<button @click="checkyes()"  class="cu-btn bg-purple shadow-blur round" >确认收款</button>
				</block>
			</block>
		</view>
	</view>
</template>

<script>
	var api = require('../../components/js/api.js'); 
	import uniCountdown from '@/components/uni-countdown/uni-countdown.vue'
	export default {
		components: {uniCountdown},
		data() {
			return {
				ColorList: this.ColorList,
				cid:'',
				formtype:'',
				OrderInfo:[],
				alipay:false,
				ubank:false,
				wechat:false,
				anquan:'',
				is_submit:'0', //0->隐藏,1->显示
			};
			
		},
		onLoad(options) {
			this.cid = options.cid;
			this.formtype = options.formtype;
		},
		onShow() {
			this.GetOrderInfo()
		},
		methods:{
			GetOrderInfo:function(){
				uni.showLoading({title:'请稍等'})
				api.get({
					url:'Api/TurntableApi/GetOrderInfo',
					data:{openid:uni.getStorageSync('userinfo').openid,cid:this.cid,formtype:this.formtype},
					success:res=>{
						if(res.status==1){
							console.log(res);
							this.OrderInfo = res.result
							uni.hideLoading();
						}
					}
				})
			},
			Shouqi:function(name){
				if(name=='alipay'){
					this.alipay=!this.alipay;
				}else if(name=='wechat'){
					this.wechat=!this.wechat;
				}
			},
			copy:function(str){
				uni.setClipboardData({
					data: str
				});
			},
			hideModal(){
				this.is_submit = 0;
			},
			checkyes(){
				this.is_submit = 1;
			},
			subfk:function(){
				api.post({
					url:'Api/TurntableApi/ConfirmPayment',
					data:{openid:uni.getStorageSync('userinfo').openid,cid:this.cid,formtype:this.formtype,anquan:this.anquan},
					success:res=>{
						if(res.status==1){
							//重新加载数据
							this.GetOrderInfo();
						}
						this.is_submit = 0;
						uni.showToast({
							title:res.message,
							icon:'none'
						})
					}
				})
			},
			comfire:function(){
				api.post({
					url:'Api/TurntableApi/ConfirmCollection',
					data:{openid:uni.getStorageSync('userinfo').openid,cid:this.cid,formtype:this.formtype,anquan:this.anquan},
					success:res=>{
						if(res.status==1){
							//重新加载数据
							this.GetOrderInfo();
						}
						this.is_submit = 0;
						uni.showToast({
							title:res.message,
							icon:'none'
						})
					}
				})
			},
			quxiao:function(){
				var _that = this;
				uni.showModal({
				    title: '提示',
				    content: '是否取消该订单',
				    success: function (res) {
				        if (res.confirm) {
				            api.post({
				            	url:'Api/TurntableApi/CancelOrder',
				            	data:{openid:uni.getStorageSync('userinfo').openid,cid:_that.cid,formtype:_that.formtype},
				            	success:res=>{
				            		if(res.status==1){
				            			uni.navigateBack();
				            		}
				            		uni.showToast({
				            			title:res.message,
				            			icon:'none'
				            		})
				            	}
				            })
				        }
				    }
				});
			},
			shensu:function(){
				var _that = this;
				uni.showModal({
				    title: '提示',
				    content: '是否提交申诉',
				    success: function (res) {
				        if (res.confirm) {
				            api.post({
				            	url:'Api/TurntableApi/ConfirmRepresen',
				            	data:{openid:uni.getStorageSync('userinfo').openid,cid:_that.cid,formtype:_that.formtype},
				            	success:res=>{
				            		if(res.status==1){
				            			uni.navigateBack();
				            		}
				            		uni.showToast({
				            			title:res.message,
				            			icon:'none'
				            		})
				            	}
				            })
				        }
				    }
				});
			}
		}
	}
</script>

<style>

</style>
