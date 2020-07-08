
<template>
	<view class="content">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">编辑资料</block>
		</cu-custom>
			<view class="editInfo_58">
				<view class="main">
					<image v-on:click="upload()"  :src="userinfo.headimg?userinfo.headimg:'/static/touxiang.png'" mode="scaleToFill" border="0"    class="photo avatar"></image>
					<text decode="true" class="btChange item flex"  @click="upload()">点击更换头像</text>
					
					<view @click="tonickname()" class="editInfo_21">
						<text decode="true" class="title">昵称</text>
						<text decode="true" class="rightContent">{{userinfo.nickname}}</text>
						<image v-on:click="nickname()"  src="/static/arrow-right.png" mode="scaleToFill" border="0"    class="editInfo_24"></image>
					</view>
					<view class="editInfo_21">
						<text decode="true" class="title">慈惠号</text>
						<text decode="true" class="rightContent">{{userinfo.username}}</text>
						<image v-on:click="idnumber()"  src="/static/arrow-right.png" mode="scaleToFill" border="0"    class="editInfo_24"></image>
					</view>
					<view @click="signature()" class="editInfo_21">
						<text decode="true" class="title">个性签名</text>
						<text decode="true" class="rightContent">{{userinfo.gxqm}}</text>
						<image v-on:click="autograph()"  src="/static/arrow-right.png" mode="scaleToFill" border="0"    class="editInfo_24"></image>
					</view>
					<view @click="gender()" class="editInfo_21">
						<text decode="true" class="title">性别</text>
						<text decode="true" class="rightContent">
							<block v-if="userinfo.sex==1">男</block>
							<block v-if="userinfo.sex==0">女</block>
							<block v-if="userinfo.sex==2">保密</block>
						</text>
						<image v-on:click="gender()"  src="/static/arrow-right.png" mode="scaleToFill" border="0"    class="editInfo_24"></image>
					</view>
					<view class="editInfo_21">
						<text decode="true" class="title">生日</text>
						<text decode="true" class="rightContent row">
							<view class="value">
								<!-- <BiaofunDatetimePicker :placeholder="userinfo.birthday?userinfo.birthday:'点击选择生日'" fields="day" @change="changeDatetimePicker"></BiaofunDatetimePicker> -->
								<picker mode="date" :value="date"  @change="changeDatetimePicker">
									<view class="picker">
										{{date}}
									</view>
								</picker>
							</view>
						</text>
						<image v-on:click="changeDatetimePicker()"  src="/static/arrow-right.png" mode="scaleToFill" border="0"    class="editInfo_24"></image>
						
					</view>
				</view>
			</view>
	</view>
</template>

<script>
import editInfo from "../../components/js/editInfo.js";
import BiaofunDatetimePicker from '../../components/biaofun-datetime-picker.vue';
var api = require('../../components/js/api.js'); 
export default {
	/**日期组件**/
	components: {
		BiaofunDatetimePicker
	},
	data() {
		return{
			userinfo:[],
			date:'请选择生日'
		}
	},
	onShow() {
		this.userinfo = uni.getStorageSync('userinfo');
		this.date = uni.getStorageSync('userinfo').birthday
	},
	methods:{
		/**选择日期时间
		 * @param {Object} date 日期数据
		 */ 
		changeDatetimePicker(e) {
			var data = e.detail.value;
			api.post({
				url: 'Api/UserApi/setUserInfo',
				data: {openid:this.userinfo.openid,type: 'birthday',data:data},
				success: res => {
					if(res.status==1){
						uni.setStorageSync('userinfo',res.result);
						this.date = uni.getStorageSync('userinfo').birthday
					}
					uni.showToast({
						icon: 'none',
						position: 'bottom',
						title: res.message
					});
				}
			})
		},
		upload(){
			uni.navigateTo({
				url:'/pages/user/upload'
			});
		},
		tonickname(){
			uni.navigateTo({
				url:'/pages/user/nickname'
			});
		},
		signature(){
			uni.navigateTo({
				url:'/pages/user/signature'
			});
		},
		gender(){
			uni.navigateTo({
				url:'/pages/user/gender'
			});
		},
	},
		onLoad(option) {
			let { avatar } = option;
			if (avatar) {
				this.src=avatar;
			}
		}
}
</script>

<style>
   @import '../../components/css/editInfo.scss';
   page{
   	background-color: #18191d;
   }
</style>

<style>
.container{
    width: 100%;
    height: 100%;
}

.avatar-container{
    position: relative;
    text-align: center;
    padding-top: 50%;
}


.avatar{
    width: 5rem;
    height: 5rem;
    background-color: #e5e5e5;
    border-radius: 50%;
	margin: 20px;
}

.item{
    line-height: 3rem;
}
</style>