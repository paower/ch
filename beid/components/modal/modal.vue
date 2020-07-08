<template>
	<view class="cu-modal" :class="reciveUserInfo=='DialogModal1'?'show':''">
	<!-- <view class="cu-modal show"> -->
		<view class="cu-dialog">
			<view class="cu-bar bg-white justify-end">
				<view class="content">提示</view>
				<view class="action" @tap="hideModal">
					<text class="cuIcon-close text-red"></text>
				</view>
			</view>
			<view class="padding-xl">
				权限不足，是否申请{{reciveUserInfo}}
			</view>
			<view class="cu-bar bg-white justify-end">
				<view class="action" style="width: 100%;">
					<button class="cu-btn line-green text-green" @tap="hideModal">取消</button>
					<button class="cu-btn bg-green margin-left" @tap="hideModal">确定</button>
	
				</view>
			</view>
		</view>
	</view>
</template>

<script>
export default {
	props: {
		reciveUserInfo: ''
	},
	data() {
		return {
			// modalName: null,
		};
	},
	methods:{
		hideModal(e) {
			this.modalName = null
		},
	}
};
</script>

<style>
</style>
