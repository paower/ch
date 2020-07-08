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
						<text class="text-white text-bold">下单成功！</text>
					</view>
					<!-- 已完成状态 -->
					<!-- <view class="text-xl">
						<text class="text-white text-bold">已完成！</text>
					</view> -->
					
					<!-- 未付款状态 -->
					<view class="padding">
						<view class=" padding bg-grey radius">等待对方付款...</view>
					</view>
					<!-- 已付款状态 -->
					<view class="padding">
						<view class=" padding bg-gradual-green radius">对方已付款</view>
					</view>
					<!-- 申诉状态 -->
					<view class="padding">
						<view class=" padding bg-grey radius">申诉中...</view>
					</view>
				</view>
			</view>
			
			<!-- 订单 -->
			<view class="cu-bar solid-top">
				<view class="action">订单金额</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>￥60.00</span></text>
					</navigator>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">单价</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>6.00CNY/慈点</span></text>
					</navigator>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">数量</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>10.00 慈点</span></text>
					</navigator>
				</view>
			</view>
			<view class="cu-bar">
				<view class="action">订单号</view>
				<view class="action">
					<navigator>
						<text class="text-df"><span>PAY5325972586355643</span></text>
					</navigator>
				</view>
			</view>
		</view>
		<view class="cu-bar btn-group bg-bluebl">
			<button class="cu-btn bg-red shadow-blur round">取消订单</button>
			<button @click="buydetails()"  class="cu-btn bg-blue shadow-blur round">确认收款</button>
		</view>
		<view class="cu-bar btn-group">
			<button class="cu-btn bg-grey shadow-blur round">投诉</button>
		</view>
	</view>
</template>

<script>
	export default {
		data() {
			return {
				ColorList: this.ColorList,
			};
		}
	}
</script>

<style>

</style>
