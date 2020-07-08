<template>
	<view class="content">
		<cu-custom bgColor="bg-gradual-blue" :isBack="true">
			<block slot="backText"></block>
			<block slot="content">搜索</block>
		</cu-custom>
		<view class="search-box">
			<!-- mSearch组件 如果使用原样式，删除组件元素-->
			<mSearch class="mSearch-input-box" :mode="2" button="inside" :placeholder="defaultKeyword" @search="doSearch(false)" @input="inputChange" @confirm="doSearch(false)" v-model="keyword"></mSearch>
			
		</view>
		<view class="search-keyword" >
			<scroll-view class="keyword-list-box" v-show="isShowKeywordList" scroll-y>
				<block v-for="(row,index) in keywordList" :key="index">
					<view class="keyword-entry" hover-class="keyword-entry-tap" >
						<view class="keyword-text" @tap.stop="doSearch(keywordList[index].keyword)">
							<rich-text :nodes="row.htmlStr"></rich-text>
						</view>
						<view class="keyword-img" @tap.stop="setKeyword(keywordList[index].keyword)">
							<image src="/static/back.png"></image>
						</view>
					</view>
				</block>
			</scroll-view>
			<scroll-view class="keyword-box" v-show="!isShowKeywordList" scroll-y>
				<view class="keyword-block" v-if="oldKeywordList.length>0">
					<view class="keyword-list-header">
						<view>历史搜索</view>
						<view>
							<image @tap="oldDelete" src="/static/delete.png"></image>
						</view>
					</view>
					<view class="keyword">
						<view v-for="(keyword,index) in oldKeywordList" @tap="doSearch(keyword)" :key="index">{{keyword}}</view>
					</view>
				</view>
				
				<view class="uni-padding-wrap" v-if="userinfo.userid">
				    <view class="uni-comment">
						<view class="uni-comment-list">
						    <view @click="otherus(userinfo.userid)" class="uni-comment-face">
						        <image :src="userinfo.headimg?userinfo.headimg:'../../static/touxiang.png'" mode="widthFix"></image>
						    </view>
						    <view class="uni-comment-body">
						        <view @click="otherus(userinfo.userid)" class="uni-comment-top">
						            <text>{{userinfo.nickname}}({{userinfo.username}})</text>
						        </view>
						        <view @click="otherus(userinfo.userid)" class="uni-comment-content">{{userinfo.gxqm?userinfo.gxqm:'还未设置个性签名'}}</view>
						        <view class="uni-comment-date" @click="dofollow(userinfo.userid)">
						            <view class="uni-comment-replay-btn1" v-if="!userinfo.is_my_follow">关注</view>
						        </view>
						    </view>
						</view>
						
				    </view>
				</view>
			</scroll-view>
		</view>
	</view>
</template>

<script>
	//引用mSearch组件，如不需要删除即可
	var api = require('../../components/js/api.js'); 
	import mSearch from '@/components/search-revision.vue';
	export default {
		data() {
			return {
				defaultKeyword: "",
				keyword: "",
				oldKeywordList: [],
				hotKeywordList: [],
				keywordList: [],
				forbid: '',
				isShowKeywordList: false,
				userinfo:[]
			}
		},
		onLoad() {
			this.init();
		},
		components: {
			//引用mSearch组件，如不需要删除即可
			mSearch
		},
		methods: {
			dofollow(toid){
				var userinfos = uni.getStorageSync('userinfo');
				if(!userinfos){
					uni.showToast({
						title:'请先登录',
						icon:'none'
					})
					return;
				}
				uni.showLoading({});
				api.post({
					url:'Api/FollowApi/addFollow',
					data:{openid:userinfos.openid,toid:toid},
					success:res=>{
						if(res.status==1){
							uni.hideLoading();
							this.userinfo.is_my_follow = true;
						}else{
							uni.showToast({
								title:'关注失败',
								icon:'none'
							})
						}
					}
				})
			},
			init() {
				this.loadDefaultKeyword();
				this.loadOldKeyword();
				// this.loadHotKeyword();

			},
			blur(){
				uni.hideKeyboard()
			},
			//加载默认搜索关键字
			loadDefaultKeyword() {
				//定义默认搜索关键字，可以自己实现ajax请求数据再赋值,用户未输入时，以水印方式显示在输入框，直接不输入内容搜索会搜索默认关键字
				this.defaultKeyword = "请输入慈惠号";
			},
			//加载历史搜索,自动读取本地Storage
			loadOldKeyword() {
				uni.getStorage({
					key: 'OldKeys',
					success: (res) => {
						var OldKeys = JSON.parse(res.data);
						this.oldKeywordList = OldKeys;
					}
				});
			},
			
			//监听输入
			inputChange(event) {
				//兼容引入组件时传入参数情况
				var keyword = event.detail?event.detail.value:event;
				if (!keyword) {
					this.keywordList = [];
					this.isShowKeywordList = false;
					return;
				}
				this.isShowKeywordList = true;
				//以下示例的关键字，请替换成你的接口
				api.get({
					url:'Api/VideoApi/SearchKeyWord',
					data:{keyword:keyword},
					success: (res) => {
						if(res.status==0){
							uni.showToast({
								title:res.message,
								icon:'none'
							})
							return;
						}
						this.keywordList = [];
						this.keywordList = this.drawCorrelativeKeyword(res, keyword);
					}
				})
			},
			//高亮关键字
			drawCorrelativeKeyword(keywords, keyword) {
				
				var len = keywords.length,
					keywordArr = [];
				for (var i = 0; i < len; i++) {
					var row = keywords[i];
					//定义高亮#9f9f9f
					var html = row.username.replace(keyword, "<span style='color: #9f9f9f;'>" + keyword + "</span>");
					html = '<div>' + html + '</div>';
					var tmpObj = {
						keyword: row.username,
						htmlStr: html
					};
					keywordArr.push(tmpObj)
				}
				return keywordArr;
			},
			//顶置关键字
			setKeyword(index) {
				this.keyword = this.keywordList[index].keyword;
			},
			//清除历史搜索
			oldDelete() {
				uni.showModal({
					content: '确定清除历史搜索记录？',
					success: (res) => {
						if (res.confirm) {
							console.log('用户点击确定');
							this.oldKeywordList = [];
							uni.removeStorage({
								key: 'OldKeys'
							});
						} else if (res.cancel) {
							console.log('用户点击取消');
						}
					}
				});
			},
			//热门搜索开关
			hotToggle() {
				this.forbid = this.forbid ? '' : '_forbid';
			},
			//执行搜索
			doSearch(keyword) {
				keyword = keyword===false?this.keyword:keyword;
				this.keyword = keyword;
				this.saveKeyword(keyword); //保存为历史 
				api.post({
					url:'Api/VideoApi/Searchinfo',
					data:{username:keyword},
					success:res=>{
						if(res.status==1){
							this.userinfo = res.result;
							this.isShowKeywordList = false;
						}else{
							uni.showToast({
								title: res.message,
								icon: 'none',
								duration: 2000
							});
						}
					}
				})
			},
			//保存关键字到历史记录
			saveKeyword(keyword) {
				uni.getStorage({
					key: 'OldKeys',
					success: (res) => {
						var OldKeys = JSON.parse(res.data);
						var findIndex = OldKeys.indexOf(keyword);
						if (findIndex == -1) {
							OldKeys.unshift(keyword);
						} else {
							OldKeys.splice(findIndex, 1);
							OldKeys.unshift(keyword);
						}
						//最多10个纪录
						OldKeys.length > 10 && OldKeys.pop();
						uni.setStorage({
							key: 'OldKeys',
							data: JSON.stringify(OldKeys)
						});
						this.oldKeywordList = OldKeys; //更新历史搜索
					},
					fail: (e) => {
						var OldKeys = [keyword];
						uni.setStorage({
							key: 'OldKeys',
							data: JSON.stringify(OldKeys)
						});
						this.oldKeywordList = OldKeys; //更新历史搜索
					}
				});
			},
			otherus(userid) {
				uni.navigateTo({
					url: '/pages/user/otherus?userid='+userid
				});
			},
		}
	}
</script>
<style>
	view {
		display: block;
	}
	
	.search-box {
		width: 100%;
		background-color: rgb(31, 31, 31);
		padding: 15upx 2.5%;
		display: flex;
		justify-content: space-between;
		position: sticky;
		top: 0;
	}
	
	.search-box .mSearch-input-box {
		width: 100%;
	}
	
	.search-box .input-box {
		width: 85%;
		flex-shrink: 1;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	.search-box .search-btn {
		width: 20%;
		margin: 0 0 0 2%;
		display: flex;
		justify-content: center;
		align-items: center;
		flex-shrink: 0;
		font-size: 26upx;
		color: #fff;
		background: linear-gradient(to right,#ff00ff,#1418ff);
		border-radius: 60upx;
	}
	
	.search-box .input-box>input {
		width: 100%;
		height: 60upx;
		font-size: 26upx;
		border: 0;
		border-radius: 60upx;
		-webkit-appearance: none;
		-moz-appearance: none;
		appearance: none;
		padding: 0 3%;
		margin: 0;
		background-color: #ffffff;
	}
	
	.placeholder-class {
		color: #9e9e9e;
	}
	
	.search-keyword {
		width: 100%;
		background-color: rgb(242,242,242);
	}
	
	.keyword-list-box {
		height: calc(100vh - 110upx);
		padding-top: 10upx;
		border-radius: 20upx 20upx 0 0;
		background-color: #fff;
	}
	
	.keyword-entry-tap {
		background-color: #eee;
	}
	
	.keyword-entry {
		width: 94%;
		height: 80upx;
		margin: 0 3%;
		font-size: 27upx;
		color: #333;
		display: flex;
		justify-content: space-between;
		align-items: center;
		border-bottom: solid 1upx #e7e7e7;
	}
	
	.keyword-entry image {
		width: 60upx;
		height: 60upx;
	}
	
	.keyword-entry .keyword-text,.keyword-entry .keyword-img {
		height: 80upx;
		display: flex;
		align-items: center;
	}
	
	.keyword-entry .keyword-text {
		width: 90%;
	}
	
	.keyword-entry .keyword-img {
		width: 10%;
		justify-content: center;
	}
	
	.keyword-box {
		height: calc(100vh - 110upx);
		/* border-radius: 20upx 20upx 0 0; */
		background-color: #1f1f1f;
	}
	
	.keyword-box .keyword-block {
		padding: 10upx 0;
	}
	
	.keyword-box .keyword-block .keyword-list-header {
		width: 94%;
		padding: 10upx 3%;
		font-size: 27upx;
		color: #FFFFFF;
		display: flex;
		justify-content: space-between;
	}
	
	.keyword-box .keyword-block .keyword-list-header image {
		width: 40upx;
		height: 40upx;
	}
	
	.keyword-box .keyword-block .keyword {
		width: 94%;
		padding: 3px 3%;
		display: flex;
		flex-flow: wrap;
		justify-content: flex-start;
	}
	
	.keyword-box .keyword-block .hide-hot-tis {
		display: flex;
		justify-content: center;
		font-size: 28upx;
		color: #6b6b6b;
	}
	
	.keyword-box .keyword-block .keyword>view {
		display: flex;
		justify-content: center;
		align-items: center;
		border-radius: 60upx;
		padding: 0 20upx;
		margin: 10upx 20upx 10upx 0;
		height: 60upx;
		font-size: 28upx;
		background-color: rgb(113,113,113);
		color: #FFFFFF;
	}
	
	/* 搜索用户 */
	.uni-padding-wrap {
	    padding: 30upx;
	}
	
	view {
	    font-size: 28upx;
	}
	
	.uni-comment {
	    padding: 5rpx 0;
	    display: flex;
	    flex-grow: 1;
	    flex-direction: column;
	}
	
	.uni-comment-list {
	    flex-wrap: nowrap;
	    padding: 10rpx 0;
	    margin: 10rpx 0;
	    width: 100%;
	    display: flex;
	}
	
	.uni-comment-face {
	    width: 70upx;
	    height: 70upx;
	    border-radius: 100%;
	    margin-right: 20upx;
	    flex-shrink: 0;
	    overflow: hidden;
	}
	
	.uni-comment-face image {
	    width: 100%;
	    border-radius: 100%;
	}
	
	.uni-comment-body {
	    width: 100%;
	}
	
	.uni-comment-top {
		width: 60%;
		float: left;
	    line-height: 1.5em;
	    justify-content: space-between;
	}
	
	.uni-comment-top text {
	    color: #0A98D5;
	    font-size: 24upx;
	}
	
	.uni-comment-date {
	    line-height: 18upx;
	    flex-direction: row;
	    justify-content: space-between;
	    display: flex !important;
	    flex-grow: 1;
		float: right;
	}
	
	.uni-comment-date view {
	    color: #666666;
	    font-size: 24upx;
	    line-height: 38upx;
	}
	.uni-comment-replay-btn,.uni-comment-replay-btn1 {
	    background: #c1c1c1;
	    font-size: 24upx;
	    line-height: 28upx;
	    padding: 5rpx 20upx;
	    border-radius: 30upx;
	    color: #fff !important;
	    margin: 0 10upx;
	}
	.uni-comment-replay-btn1{
		background: #ff5500;
	}
	.uni-comment-content {
		width: 60%;
		float: left;
	    line-height: 1.6em;
	    font-size: 28upx;
	    padding: 8rpx 0;
		color: #f7f7f7;
	}
</style>
