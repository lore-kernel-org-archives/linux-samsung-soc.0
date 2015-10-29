From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: Re: [PATCH v4 4/4] drivers/rtc/rtc-s5m.c: add support for S2MPS15 RTC
Date: Thu, 29 Oct 2015 11:04:48 +0530
Message-ID: <5631AFF8.10205@samsung.com>
References: <1446094723-6212-1-git-send-email-alim.akhtar@samsung.com>
 <1446094723-6212-5-git-send-email-alim.akhtar@samsung.com>
 <5631A982.2050603@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:42588 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751818AbbJ2Fdq (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Oct 2015 01:33:46 -0400
In-reply-to: <5631A982.2050603@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, lee.jones@linaro.org, broonie@kernel.org
Cc: linux-samsung-soc@vger.kernel.org, rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, Alexandre Belloni <alexandre.belloni@free-electrons.com>



On 10/29/2015 10:37 AM, Krzysztof Kozlowski wrote:
> On 29.10.2015 13:58, Alim Akhtar wrote:
>> RTC found in s2mps15 is almost same as one found on s2mps14/13
>> with few differences in RTC_UPDATE register fields, like
>> bit fields are changed for WUDR and AUDR.
>> This patch add required changes to enable s2mps15 rtc timer.
>>
>> Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>>   drivers/rtc/rtc-s5m.c           |   20 ++++++++++++++++++--
>>   include/linux/mfd/samsung/rtc.h |    4 ++++
>>   2 files changed, 22 insertions(+), 2 deletions(-)
>
>
> Oh, this is totally different than previous patch and changelog does not
> mention these changes.
>
I am still learning to make thing more correct in first attempt, these 
input will help :-), thanks.

> Was the previous RTC patch tested?
Yes, it was tested, but the coverage was limited to wakealarm.

Now I have tested wakealarm and setting hw clock date/time using hwclock 
utility, setting system time/date to rtc and visa-versa, both works as 
expected.

> Here the AUDR and WUDR seem to be reversed... oh, that is strange. :)
>
Yah, indeed this was a surprised for me also, but this how it is 
implemented in s2mps15.

> Best regards,
> Krzysztof
>
>>
>> diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
>> index f2504b4eef34..0d106a99958f 100644
>> --- a/drivers/rtc/rtc-s5m.c
>> +++ b/drivers/rtc/rtc-s5m.c
>> @@ -188,6 +188,7 @@ static inline int s5m_check_peding_alarm_interrupt(struct s5m_rtc_info *info,
>>   		ret = regmap_read(info->regmap, S5M_RTC_STATUS, &val);
>>   		val &= S5M_ALARM0_STATUS;
>>   		break;
>> +	case S2MPS15X:
>>   	case S2MPS14X:
>>   	case S2MPS13X:
>>   		ret = regmap_read(info->s5m87xx->regmap_pmic, S2MPS14_REG_ST2,
>> @@ -223,6 +224,9 @@ static inline int s5m8767_rtc_set_time_reg(struct s5m_rtc_info *info)
>>   	if (info->device_type == S5M8763X || info->device_type == S5M8767X)
>>   		data |= S5M_RTC_TIME_EN_MASK;
>>
>> +	if (info->device_type == S2MPS15X)
>> +		data |= S2MPS15_RTC_WUDR_MASK;
>> +
>>   	ret = regmap_write(info->regmap, info->regs->rtc_udr_update, data);
>>   	if (ret < 0) {
>>   		dev_err(info->dev, "failed to write update reg(%d)\n", ret);
>> @@ -252,6 +256,9 @@ static inline int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
>>   	case S5M8767X:
>>   		data &= ~S5M_RTC_TIME_EN_MASK;
>>   		break;
>> +	case S2MPS15X:
>> +		data |= S2MPS15_RTC_AUDR_MASK;
>> +		break;
>>   	case S2MPS14X:
>>   		data |= S2MPS_RTC_RUDR_MASK;
>>   		break;
>> @@ -275,7 +282,6 @@ static inline int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
>>   	if (info->device_type == S2MPS13X)
>>   		regmap_update_bits(info->regmap, info->regs->rtc_udr_update,
>>   				   S2MPS13_RTC_AUDR_MASK, 0);
>> -
>>   	return ret;
>>   }
>>
>> @@ -317,7 +323,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
>>   	u8 data[info->regs->regs_count];
>>   	int ret;
>>
>> -	if (info->device_type == S2MPS14X || info->device_type == S2MPS13X) {
>> +	if (info->device_type == S2MPS15X || info->device_type == S2MPS14X ||
>> +			info->device_type == S2MPS13X) {
>>   		ret = regmap_update_bits(info->regmap,
>>   				info->regs->rtc_udr_update,
>>   				S2MPS_RTC_RUDR_MASK, S2MPS_RTC_RUDR_MASK);
>> @@ -339,6 +346,7 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
>>   		break;
>>
>>   	case S5M8767X:
>> +	case S2MPS15X:
>>   	case S2MPS14X:
>>   	case S2MPS13X:
>>   		s5m8767_data_to_tm(data, tm, info->rtc_24hr_mode);
>> @@ -366,6 +374,7 @@ static int s5m_rtc_set_time(struct device *dev, struct rtc_time *tm)
>>   		s5m8763_tm_to_data(tm, data);
>>   		break;
>>   	case S5M8767X:
>> +	case S2MPS15X:
>>   	case S2MPS14X:
>>   	case S2MPS13X:
>>   		ret = s5m8767_tm_to_data(tm, data);
>> @@ -414,6 +423,7 @@ static int s5m_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>>   		break;
>>
>>   	case S5M8767X:
>> +	case S2MPS15X:
>>   	case S2MPS14X:
>>   	case S2MPS13X:
>>   		s5m8767_data_to_tm(data, &alrm->time, info->rtc_24hr_mode);
>> @@ -463,6 +473,7 @@ static int s5m_rtc_stop_alarm(struct s5m_rtc_info *info)
>>   		break;
>>
>>   	case S5M8767X:
>> +	case S2MPS15X:
>>   	case S2MPS14X:
>>   	case S2MPS13X:
>>   		for (i = 0; i < info->regs->regs_count; i++)
>> @@ -508,6 +519,7 @@ static int s5m_rtc_start_alarm(struct s5m_rtc_info *info)
>>   		break;
>>
>>   	case S5M8767X:
>> +	case S2MPS15X:
>>   	case S2MPS14X:
>>   	case S2MPS13X:
>>   		data[RTC_SEC] |= ALARM_ENABLE_MASK;
>> @@ -548,6 +560,7 @@ static int s5m_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alrm)
>>   		break;
>>
>>   	case S5M8767X:
>> +	case S2MPS15X:
>>   	case S2MPS14X:
>>   	case S2MPS13X:
>>   		s5m8767_tm_to_data(&alrm->time, data);
>> @@ -631,6 +644,7 @@ static int s5m8767_rtc_init_reg(struct s5m_rtc_info *info)
>>   		ret = regmap_raw_write(info->regmap, S5M_ALARM0_CONF, data, 2);
>>   		break;
>>
>> +	case S2MPS15X:
>>   	case S2MPS14X:
>>   	case S2MPS13X:
>>   		data[0] = (0 << BCD_EN_SHIFT) | (1 << MODEL24_SHIFT);
>> @@ -679,6 +693,7 @@ static int s5m_rtc_probe(struct platform_device *pdev)
>>   		return -ENOMEM;
>>
>>   	switch (platform_get_device_id(pdev)->driver_data) {
>> +	case S2MPS15X:
>>   	case S2MPS14X:
>>   	case S2MPS13X:
>>   		regmap_cfg = &s2mps14_rtc_regmap_config;
>> @@ -805,6 +820,7 @@ static const struct platform_device_id s5m_rtc_id[] = {
>>   	{ "s5m-rtc",		S5M8767X },
>>   	{ "s2mps13-rtc",	S2MPS13X },
>>   	{ "s2mps14-rtc",	S2MPS14X },
>> +	{ "s2mps15-rtc",	S2MPS15X },
>>   	{ },
>>   };
>>   MODULE_DEVICE_TABLE(platform, s5m_rtc_id);
>> diff --git a/include/linux/mfd/samsung/rtc.h b/include/linux/mfd/samsung/rtc.h
>> index 29c30ac36020..0be45fccc52b 100644
>> --- a/include/linux/mfd/samsung/rtc.h
>> +++ b/include/linux/mfd/samsung/rtc.h
>> @@ -107,6 +107,10 @@ enum s2mps_rtc_reg {
>>   #define S2MPS_RTC_WUDR_MASK	(1 << S2MPS_RTC_WUDR_SHIFT)
>>   #define S2MPS13_RTC_AUDR_SHIFT	1
>>   #define S2MPS13_RTC_AUDR_MASK	(1 << S2MPS13_RTC_AUDR_SHIFT)
>> +#define S2MPS15_RTC_AUDR_SHIFT	4
>> +#define S2MPS15_RTC_AUDR_MASK	(1 << S2MPS15_RTC_AUDR_SHIFT)
>> +#define S2MPS15_RTC_WUDR_SHIFT	1
>> +#define S2MPS15_RTC_WUDR_MASK	(1 << S2MPS15_RTC_WUDR_SHIFT)
>>   #define S2MPS_RTC_RUDR_SHIFT	0
>>   #define S2MPS_RTC_RUDR_MASK	(1 << S2MPS_RTC_RUDR_SHIFT)
>>   #define RTC_TCON_SHIFT		1
>>
>
>
