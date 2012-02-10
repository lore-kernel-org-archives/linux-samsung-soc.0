From: Evgeny Voevodin <e.voevodin@samsung.com>
Subject: Re: [PATCH] ARM: EXYNOS: Add alias name of 'fimd' clock for 'lcd' clock
Date: Fri, 10 Feb 2012 10:34:13 +0400
Message-ID: <4F34BA65.7030108@samsung.com>
References: <000101ccd693$71185b60$53491220$%han@samsung.com>
 <CAH9JG2UGvc42AzCSPSKwNT1UrnPy8RG7Snoe+vULoAMW1GQckA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:8720 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754985Ab2BJGeS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 10 Feb 2012 01:34:18 -0500
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0LZ500GDQZL342@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 06:34:15 +0000 (GMT)
Received: from [106.109.9.191] by spt1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LZ50029HZL2KA@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 10 Feb 2012 06:34:15 +0000 (GMT)
In-reply-to: <CAH9JG2UGvc42AzCSPSKwNT1UrnPy8RG7Snoe+vULoAMW1GQckA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Jingoo Han <jg1.han@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, Jonghwan Choi <jhbird.choi@samsung.com>, Tushar Behera <tushar.behera@linaro.org>, Dmitry Solodkiy <d.solodkiy@samsung.com>

On 01/20/2012 04:53 AM, Kyungmin Park wrote:
> On 1/19/12, Jingoo Han<jg1.han@samsung.com>  wrote:
>> This patch adds alias name of 'fimd' clock for 'lcd' clock. While 'lcd'
>> clock is used for s3c-fb driver, 'fimd' clock is defined for Exynos fimd
>> ip. Therefore, 'fimd' clock can be called by using clk_add_alias().
> Hi,
>
> Doesn't it better to add common.c?
> Are there any reason to add each board files?
>
> Thank you,
> Kyungmin Park
>> Cc: Jonghwan Choi<jhbird.choi@samsung.com>
>> Signed-off-by: Jingoo Han<jg1.han@samsung.com>
>> ---
>>   arch/arm/mach-exynos/mach-nuri.c           |    2 ++
>>   arch/arm/mach-exynos/mach-origen.c         |    2 ++
>>   arch/arm/mach-exynos/mach-smdkv310.c       |    2 ++
>>   arch/arm/mach-exynos/mach-universal_c210.c |    3 +++
>>   4 files changed, 9 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/mach-nuri.c
>> b/arch/arm/mach-exynos/mach-nuri.c
>> index 3df8bf4..06c22e0 100644
>> --- a/arch/arm/mach-exynos/mach-nuri.c
>> +++ b/arch/arm/mach-exynos/mach-nuri.c
>> @@ -1310,6 +1310,8 @@ static void __init nuri_machine_init(void)
>>   	i2c9_devs[I2C9_MAX17042].irq = gpio_to_irq(EXYNOS4_GPX2(3));
>>   	i2c_register_board_info(9, i2c9_devs, ARRAY_SIZE(i2c9_devs));
>>
>> +	dev_set_name(&s5p_device_fimd0.dev, "exynos4-fb.0");
>> +	clk_add_alias("lcd", "exynos4-fb.0", "fimd",&s5p_device_fimd0.dev);
>>   	s5p_fimd0_set_platdata(&nuri_fb_pdata);
>>
>>   	nuri_camera_init();
>> diff --git a/arch/arm/mach-exynos/mach-origen.c
>> b/arch/arm/mach-exynos/mach-origen.c
>> index b453464..7cea0be 100644
>> --- a/arch/arm/mach-exynos/mach-origen.c
>> +++ b/arch/arm/mach-exynos/mach-origen.c
>> @@ -722,6 +722,8 @@ static void __init origen_machine_init(void)
>>   	s5p_tv_setup();
>>   	s5p_i2c_hdmiphy_set_platdata(NULL);
>>
>> +	dev_set_name(&s5p_device_fimd0.dev, "exynos4-fb.0");
>> +	clk_add_alias("lcd", "exynos4-fb.0", "fimd",&s5p_device_fimd0.dev);
>>   	s5p_fimd0_set_platdata(&origen_lcd_pdata);
>>
>>   	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
>> diff --git a/arch/arm/mach-exynos/mach-smdkv310.c
>> b/arch/arm/mach-exynos/mach-smdkv310.c
>> index bf2094e..eccd96d 100644
>> --- a/arch/arm/mach-exynos/mach-smdkv310.c
>> +++ b/arch/arm/mach-exynos/mach-smdkv310.c
>> @@ -370,6 +370,8 @@ static void __init smdkv310_machine_init(void)
>>   	samsung_keypad_set_platdata(&smdkv310_keypad_data);
>>
>>   	samsung_bl_set(&smdkv310_bl_gpio_info,&smdkv310_bl_data);
>> +	dev_set_name(&s5p_device_fimd0.dev, "exynos4-fb.0");
>> +	clk_add_alias("lcd", "exynos4-fb.0", "fimd",&s5p_device_fimd0.dev);
>>   	s5p_fimd0_set_platdata(&smdkv310_lcd0_pdata);
>>
>>   	smdkv310_ehci_init();
>> diff --git a/arch/arm/mach-exynos/mach-universal_c210.c
>> b/arch/arm/mach-exynos/mach-universal_c210.c
>> index c38e18d..fe554f1 100644
>> --- a/arch/arm/mach-exynos/mach-universal_c210.c
>> +++ b/arch/arm/mach-exynos/mach-universal_c210.c
>> @@ -31,6 +31,7 @@
>>   #include<plat/cpu.h>
>>   #include<plat/devs.h>
>>   #include<plat/iic.h>
>> +#include<plat/clock.h>
>>   #include<plat/gpio-cfg.h>
>>   #include<plat/fb.h>
>>   #include<plat/mfc.h>
>> @@ -1029,6 +1030,8 @@ static void __init universal_machine_init(void)
>>   	s5p_i2c_hdmiphy_set_platdata(NULL);
>>   	i2c_register_board_info(5, i2c5_devs, ARRAY_SIZE(i2c5_devs));
>>
>> +	dev_set_name(&s5p_device_fimd0.dev, "exynos4-fb.0");
>> +	clk_add_alias("lcd", "exynos4-fb.0", "fimd",&s5p_device_fimd0.dev);
>>   	s5p_fimd0_set_platdata(&universal_lcd_pdata);
>>
>>   	universal_touchkey_init();
>> --
>> 1.7.1
>>
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>

Still no appropriate support of frame buffer in the kernel...

-- 
Kind regards,
Evgeny Voevodin,
Leading Software Engineer,
ASWG, Moscow R&D center, Samsung Electronics
e-mail: e.voevodin@samsung.com
