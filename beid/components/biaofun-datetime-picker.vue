<!-- 
 * 日期时间选择器
 * 组件的默认日期有效期范围为：1970-01-01 00:00 - 2300-01-01 00:00。
 * 注意：如果您传递的日期有效范围的结束日期小于开始日期，则日期有效范围的结束日期会自动修正为开始日期+300年，比如，您传递的日期有效范围的开始日期为 "2020-11-11 18:30"，
 * 结束日期为 "2018-11-11 18:30"，则此时将会自动修正结束日期为 "2320-11-11 18:30"。
 * 注意：如果您传递的默认值不在日期有效范围内，则会自动修正默认值为当前日期时间，如果当前日期时间也不在日期有效范围内，则会再次修正为日期有效范围的开始日期。
 * 
 * @作者：陈万照
 * @公司：山东标梵互动信息技术有限公司
 * @官网：http://biaofun.com/
 * @微信：C207668802
 * @QQ：207668802
 * @邮箱：cwz@biaofun.com || 207668802@qq.com
 * @版本：v1.0.0
 * 
 * props:
 *   disabled: 是否禁用该组件？Boolean类型；
 *   placeholder: 组件没有选中值时显示的内容，String类型；
 *   start: 表示有效日期时间范围的开始，String类型，格式为"YYYY-MM-DD hh:mm"；
 *   end: 表示有效日期时间范围的结束，String类型，格式为"YYYY-MM-DD hh:mm"；
 *   fields: 选择器的粒度，String类型，有效值为 year、month、day、hour、minute；
 *   defaultValue: 默认值，String或Date类型；
 * 
 * emit事件：
 *   change(date): 选择事件。
 *     date.year: 年；
 *     date.month: 月；
 *     date.month2: 月（补0）；
 *     date.day: 日；
 *     date.day2: 日（补0；
 *     date.hour: 时；
 *     date.hour2: 时（补0；
 *     date.minute: 分；
 *     date.minute2: 分（补0；
 -->
<!-- 日期时间选择器 -->
<template>
	<view class="datatime">
		<picker mode="multiSelector" :range="range" range-key="text" @change="change" @columnchange="columnchange" :value="value" :disabled="disabled">
			<view class="content" :class="{ placeholder: !dateStr }">
				<text>{{ dateStr ? dateStr : placeholder }}</text>
			</view>
		</picker>
	</view>
</template>

<script>
export default {
	/**
	 * 数据
	 */
	props: {
		// 是否禁用
		disabled: {
			type: Boolean,
			default: false
		},

		// placeholder
		placeholder: {
			type: String,
			default: '请选择日期时间'
		},

		// 表示有效日期时间范围的开始，字符串格式为"YYYY-MM-DD hh:mm"
		start: {
			type: String,
			default: '1970-01-01 00:00'
		},

		// 表示有效日期时间范围的结束，字符串格式为"YYYY-MM-DD hh:mm"
		end: {
			type: String,
			default: '2300-01-01 00:00'
		},

		// 有效值 year,month,day,hour,minute，表示选择器的粒度
		fields: {
			type: String,
			default: 'minute'
		},

		// 默认值
		defaultValue: {
			type: [Date, String],
			default() {
				return null;
			}
		}
	},

	/**
	 * 数据
	 */
	data() {
		return {
			range: [],
			value: [],
			dateStr: '', // 最终显示的字符串
			dtStart: new Date('1970-01-01 00:00'), // 有效范围开始
			dtEnd: new Date('2300-01-01 00:00'), // 有效范围结束
		};
	},

	/**
	 * 组件初次加载完成
	 */
	mounted() {
		// 判断有效日期结束是否大于有效日期开始，如果不是，则将有效日期结束修改为有效日期开始往后300年
		this.dtStart = new Date(this.start); // 有效日期开始
		this.dtEnd = new Date(this.end); // 有效日期结束
		if (this.dtEnd <= this.dtStart) {
			this.dtEnd = new Date(this.start);
			this.dtEnd.setFullYear(this.dtStart.getFullYear() + 300);
			this.dtEnd.setDate(this.dtEnd.getDate() - 1);
		}

		// 设置默认值
		this.setDefaultValue();
	},

	/**
	 * 方法
	 */
	methods: {
		/**
		 * 确认选择
		 */
		change(event) {
			let year, month, month2, day, day2, hour, hour2, minute, minute2;
			year = this.range[0][this.value[0]].number; // 年
			if(this.fields == 'month' || this.fields == 'day' || this.fields == 'hour' || this.fields == 'minute') {
				month = this.range[1][this.value[1]].number; // 月
				month2 = month >= 10 ? month : '0' + month; // 月（补0）
			}
			if(this.fields == 'day' || this.fields == 'hour' || this.fields == 'minute') {
				day = this.range[2][this.value[2]].number; // 日
				day2 = day >= 10 ? day : '0' + day; // 日（补0）
			}
			if(this.fields == 'hour' || this.fields == 'minute') {
				hour = this.range[3][this.value[3]].number; // 时
				hour2 = hour >= 10 ? hour : '0' + hour; // 时（补0）
			}
			if(this.fields == 'minute') {
				minute = this.range[4][this.value[4]].number; // 分
				minute2 = minute >= 10 ? minute : '0' + minute; // 分（补0）
			}
			
			// 时间日期数据
			let date = {
				year: year,
				month: month,
				month2: month2,
				day: day,
				day2: day2,
				hour: hour,
				hour2: hour2,
				minute: minute,
				minute2: minute2,
			}
			
			// 设置显示的值
			let dt = new Date();
			dt.setFullYear(year);
			month ? dt.setMonth(month - 1) : {};
			day ? dt.setDate(day) : {};
			hour ? dt.setHours(hour) : {};
			minute ? dt.setMinutes(minute) : {};
			this.setDateStr(dt);
			
			// 提交事件
			this.$emit('change', date);
		},

		/**
		 * 设置显示的值
		 * @param {Date|String} date 日期字符串或日期对象
		 */
		setDateStr(date) {
			let dt = this.formatDate(date);
			if(this.fields == 'year') {
				this.dateStr = `${dt.YYYY}年`;
				return;
			}
			if(this.fields == 'month') {
				this.dateStr = `${dt.YYYY}年${dt.MM}月`;
				return;
			}
			if(this.fields == 'day') {
				this.dateStr = `${dt.YYYY}年${dt.MM}月${dt.DD}日`;
				return;
			}
			if(this.fields == 'hour') {
				this.dateStr = `${dt.YYYY}年${dt.MM}月${dt.DD}日 ${dt.hh}时`;
				return;
			}
			this.dateStr = `${dt.YYYY}年${dt.MM}月${dt.DD}日 ${dt.hh}时${dt.mm}分`;
		},
		
		/**
		 * 设置年数据
		 */ 
		setYearData() {
			// 有效日期
			let yearStart = this.dtStart.getFullYear();
			let yearEnd = this.dtEnd.getFullYear();
			
			// 年
			let years = [];
			for (let year = yearStart; year <= yearEnd; year++) {
				let item = {
					number: year,
					text: `${year}年`,
				};
				years.push(item);
			}
			this.range.splice(0, 1, years);
		},
		
		/**
		 * 设置月数据
		 * @param {Number} year 年 
		 */ 
		setMonthData(year) {
			// 有效日期
			let yearStart = this.dtStart.getFullYear();
			let monthStart = this.dtStart.getMonth() + 1;
			let yearEnd = this.dtEnd.getFullYear();
			let monthEnd = this.dtEnd.getMonth() + 1;
			
			// 月
			let months = [];
			let monthStartIndex = year == yearStart ? monthStart : 1;
			let monthEndIndex = year == yearEnd ? monthEnd : 12;
			for (let month = monthStartIndex; month <= monthEndIndex; month++) {
				let item = {
					number: month,
					text: `${month}月`,
				};
				months.push(item);
			}
			this.range.splice(1, 1, months);
		},
		
		/**
		 * 设置日数据
		 * @param {Number} year 年 
		 * @param {Number} month 月 
		 */ 
		setDayData(year, month) {
			// 有效日期
			let yearStart = this.dtStart.getFullYear();
			let monthStart = this.dtStart.getMonth() + 1;
			let dayStart = this.dtStart.getDate();
			let yearEnd = this.dtEnd.getFullYear();
			let monthEnd = this.dtEnd.getMonth() + 1;
			let dayEnd = this.dtEnd.getDate();
			
			// 日
			let days = [];
			let dayStartIndex = year == yearStart && month == monthStart ? dayStart : 1;
			let dayEndIndex = year == yearEnd && month == monthEnd ? dayEnd : new Date(year, month, 0).getDate();
			for (let day = dayStartIndex; day <= dayEndIndex; day++) {
				let item = {
					number: day,
					text: `${day}日`,
				};
				days.push(item);
			}
			this.range.splice(2, 1, days);
		},
		
		/**
		 * 设置时数据
		 * @param {Number} year 年 
		 * @param {Number} month 月 
		 * @param {Number} day 日 
		 */ 
		setHourData(year, month, day) {
			// 有效日期
			let yearStart = this.dtStart.getFullYear();
			let monthStart = this.dtStart.getMonth() + 1;
			let dayStart = this.dtStart.getDate();
			let hourStart = this.dtStart.getHours();
			let yearEnd = this.dtEnd.getFullYear();
			let monthEnd = this.dtEnd.getMonth() + 1;
			let dayEnd = this.dtEnd.getDate();
			let hourEnd = this.dtEnd.getHours();
			
			// 时
			let hours = [];
			let hourStartIndex = year == yearStart && month == monthStart && day == dayStart ? hourStart : 0;
			let hourEndIndex = year == yearEnd && month == monthEnd && day == dayEnd ? hourEnd : 23;
			for (let hour = hourStartIndex; hour <= hourEndIndex; hour++) {
				let item = {
					number: hour,
					text: `${hour}时`,
				};
				hours.push(item);
			}
			this.range.splice(3, 1, hours);
		},
		
		/**
		 * 设置分数据
		 * @param {Number} year 年 
		 * @param {Number} month 月 
		 * @param {Number} day 日
		 * @param {Number} hour 时
		 */ 
		setMinuteData(year, month, day, hour) {
			// 有效日期
			let yearStart = this.dtStart.getFullYear();
			let monthStart = this.dtStart.getMonth() + 1;
			let dayStart = this.dtStart.getDate();
			let hourStart = this.dtStart.getHours();
			let minuteStart = this.dtStart.getMinutes();
			let yearEnd = this.dtEnd.getFullYear();
			let monthEnd = this.dtEnd.getMonth() + 1;
			let dayEnd = this.dtEnd.getDate();
			let hourEnd = this.dtEnd.getHours();
			let minuteEnd = this.dtEnd.getMinutes();
			
			// 分
			let minutes = [];
			let minuteStartIndex = year == yearStart && month == monthStart && day == dayStart && hour == hourStart ? minuteStart : 0;
			let minuteEndIndex = year == yearEnd && month == monthEnd && day == dayEnd && hour == hourEnd ? minuteEnd : 59;
			for(let minute = minuteStartIndex; minute <= minuteEndIndex; minute++) {
				let item = {
					number: minute,
					text: `${minute}分`,
				}
				minutes.push(item);
			}
			this.range.splice(4, 1, minutes);
		},
		
		/**
		 * 设置默认值
		 */
		setDefaultValue() {
			let dateDefault = null; // 默认日期
			let dateStart = new Date(this.start); // 有效开始日期
			let dateEnd = new Date(this.end); // 有效结束日期

			// 设置默认日期
			// 如果没有设置默认日期，将默认日期设置为当前日期
			// 如果有设置默认日期，但是默认日期不在有效日期范围内，将默认日期设置为当前日期
			// 如果有设置默认日期，默认日期不在有效日期范围内，当前日期也不在有效日期范围内，设置默认日期为有效日期开始值
			if (!this.defaultValue) {
				dateDefault = new Date();
			} else {
				dateDefault = new Date(this.defaultValue);
			}
			if (dateDefault < dateStart || dateDefault > dateEnd) {
				dateDefault = new Date(this.start);
			}
			
			// 更新 dateStr
			if(this.defaultValue) this.setDateStr(dateDefault);
			
			// 默认值相关数据
			let dfYear = dateDefault.getFullYear();
			let dfMonth = dateDefault.getMonth() + 1;
			let dfDay = dateDefault.getDate();
			let dfHour = dateDefault.getHours();
			let dfMinute = dateDefault.getMinutes();
			
			// 设置年数据
			this.setYearData();
			// 设置 Year 这一列的 value 值
			let yearIndex = this.range[0].findIndex(year => {
				return dfYear == year.number;
			});
			this.value.splice(0, 1, yearIndex >= 0 ? yearIndex : 0);
			
			// 设置月数据
			if(this.fields == 'year') return;
			this.setMonthData(dfYear);
			// 设置 Month 这一列的 value 值
			let monthIndex = this.range[1].findIndex(month => {
				return dfMonth == month.number;
			});
			this.value.splice(1, 1, monthIndex >=0 ? monthIndex : 0);
			
			// 设置日数据
			if(this.fields == 'month') return;
			this.setDayData(dfYear, dfMonth);
			// 设置 Day 这一列的 value 值
			let dayIndex = this.range[2].findIndex(day => {
				return dfDay == day.number;
			});
			this.value.splice(2, 1, dayIndex >=0 ? dayIndex : 0);
			
			// 设置时数据
			if(this.fields == 'day') return;
			this.setHourData(dfYear, dfMonth, dfDay);
			// 设置 Hour 这一列的 value 值
			let hourIndex = this.range[3].findIndex(hour => {
				return dfHour == hour.number;
			});
			this.value.splice(3, 1, hourIndex >=0 ? hourIndex : 0);
			
			// 设置分数据
			if(this.fields == 'hour') return;
			this.setMinuteData(dfYear, dfMonth, dfDay, dfHour);
			// 设置 Minute 这一列的 value 值
			let minuteIndex = this.range[4].findIndex(minute => {
				return dfMinute == minute.number;
			});
			this.value.splice(4, 1, minuteIndex >=0 ? minuteIndex : 0);
		},

		/**
		 * 某一列的值改变时触发
		 * @param {Number} event.detail.column 表示改变了第几列（下标从0开始）
		 * @param {Number} event.detail.value 表示变更值的下标
		 */
		columnchange(event) {
			let columnIndex = event.detail.column; // 改变的列的下标
			let valueIndex = event.detail.value; // 变更值的下标
			
			// 更新改变列的 value
			this.value.splice(columnIndex, 1, valueIndex);
			
			// 改变年要更新月数据
			if(this.fields == 'year') return;
			if (columnIndex == 0) {
				// 当前选择的月
				let monthBeforeUpdate = this.range[1][this.value[1]];
				// 更新月数据
				this.setMonthData(this.range[0][this.value[0]].number);
				// 更新 Month Value
				let monthIndex = this.range[1].findIndex(month => {
					return month.number == monthBeforeUpdate.number;
				});
				this.value.splice(1, 1, monthIndex >= 0 ? monthIndex : 0);
			}
			
			// 改变年、月都要更新日数据
			if(this.fields == 'month') return;
			if (columnIndex == 0 || columnIndex == 1) {
				// 当前选择的日
				let dayBeforeUpdate = this.range[2][this.value[2]];
				// 更新日数据
				this.setDayData(this.range[0][this.value[0]].number, this.range[1][this.value[1]].number);
				// 更新 Day Value
				let dayIndex = this.range[2].findIndex(day => {
					return day.number == dayBeforeUpdate.number;
				});
				this.value.splice(2, 1, dayIndex >= 0 ? dayIndex : 0);
			}
			
			// 改变年、月、日都要更新时数据
			if(this.fields == 'day') return;
			if (columnIndex == 0 || columnIndex == 1 || columnIndex == 2) {
				// 当前选择的时
				let hourBeforeUpdate = this.range[3][this.value[3]];
				// 更新时数据
				this.setHourData(this.range[0][this.value[0]].number, this.range[1][this.value[1]].number, this.range[2][this.value[2]].number);
				// 更新 Hour Value
				let hourIndex = this.range[3].findIndex(hour => {
					return hour.number == hourBeforeUpdate.number;
				});
				this.value.splice(3, 1, hourIndex >= 0 ? hourIndex : 0);
			}
			
			// 当前选择的分
			if(this.fields == 'hour') return;
			let minuteBeforeUpdate = this.range[4][this.value[4]];
			// 更新分数据
			this.setMinuteData(this.range[0][this.value[0]].number, this.range[1][this.value[1]].number, this.range[2][this.value[2]].number, this.range[3][this.value[3]].number);
			// 更新 Minute Value
			let minuteIndex = this.range[4].findIndex(minute => {
				return minute.number == minuteBeforeUpdate.number;
			});
			this.value.splice(4, 1, minuteIndex >= 0 ? minuteIndex : 0);
		},
		
		/**
		 * 格式化日期
		 * @param {Date|String} date 日期或日期字符串
		 */
		formatDate(date) {
			let dt = new Date(date);
			let YYYY = dt.getFullYear();
			let M = dt.getMonth() + 1;
			let MM = M >= 10 ? M : '0' + M;
			let D = dt.getDate();
			let DD = D >= 10 ? D : '0' + D;
			let h = dt.getHours();
			let hh = h >= 10 ? h : '0' + h;
			let m = dt.getMinutes();
			let mm = m >= 10 ? m : '0' + m;
			let s = dt.getSeconds();
			let ss = s >= 10 ? s : '0' + s;
			let ms = dt.getMilliseconds();
			let ms2 = ms;
			let ms3 = ms;
			let ms4 = ms;
			if (ms < 10) {
				ms2 = '0' + ms;
				ms3 = '00' + ms;
				ms4 = '000' + ms;
			} else if (ms < 100) {
				ms3 = '0' + ms;
				ms4 = '00' + ms;
			} else {
				ms4 = '0' + ms;
			}
			let result = {
				YYYY: YYYY,
				MM: MM,
				M: M,
				DD: DD,
				D: D,
				hh: hh,
				h: h,
				mm: mm,
				m: m,
				ss: ss,
				s: s,
				ms: ms,
				ms2: ms2,
				ms3: ms3,
				ms4: ms4,
				fmt1: YYYY + '-' + MM + '-' + DD,
				fmt2: YYYY + '年' + MM + '月' + DD + '日',
				fmt3: YYYY + '-' + MM + '-' + DD + ' ' + hh + ':' + mm,
				notes: 'YYYY（年），MM（月，补0），M（月，不补0），DD（日，补0），D（日，不补0），hh（时，补0），h（时，不补0），mm（分，补0），m（分，不补0），ss（秒，补0），s（秒，不补0），ms（毫秒，不补0），ms2（毫秒，补0到2位），ms3（毫秒，补0到3位），ms4（毫秒，补0到4位），其余的fmt1，fmt2，... 看格式就知道了！'
			};
			return result;
		},
	}
};
</script>

<style lang="scss" scoped>
.content {
	text-align: right;
}

.placeholder {
	color: #949596;
}
</style>
