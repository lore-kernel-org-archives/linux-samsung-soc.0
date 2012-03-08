From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Enable G2D on SMDKV310
Date: Thu, 8 Mar 2012 17:11:06 +0530
Message-ID: <CAK9yfHz4xUj2oX_Ek=yF281o55en7bGjmJ7tDt2-zaGhbNp1cA@mail.gmail.com>
References: <1325492711-15012-1-git-send-email-sachin.kamat@linaro.org>
	<4F3CFF6E.9010404@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qy0-f174.google.com ([209.85.216.174]:50790 "EHLO
	mail-qy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756821Ab2CHLlH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Mar 2012 06:41:07 -0500
Received: by qcqw6 with SMTP id w6so248323qcq.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 08 Mar 2012 03:41:06 -0800 (PST)
In-Reply-To: <4F3CFF6E.9010404@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, patches@linaro.org

Hi Kukjin,

This patch is missing in your tree.
Please check.

Regards
Sachin

On 16/02/2012, Kukjin Kim <kgene.kim@samsung.com> wrote:
> On 01/02/12 17:25, Sachin Kamat wrote:
>> This patch enables G2D support on SMDKV310 board.
>>
>> Signed-off-by: Sachin Kamat<sachin.kamat@linaro.org>
>> ---
>>   arch/arm/mach-exynos/Kconfig         |    1 +
>>   arch/arm/mach-exynos/mach-smdkv310.c |    1 +
>>   2 files changed, 2 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>> index bd4600e..a673d0d 100644
>> --- a/arch/arm/mach-exynos/Kconfig
>> +++ b/arch/arm/mach-exynos/Kconfig
>> @@ -183,6 +183,7 @@ config MACH_SMDKV310
>>   	select S5P_DEV_FIMC1
>>   	select S5P_DEV_FIMC2
>>   	select S5P_DEV_FIMC3
>> +	select S5P_DEV_G2D
>>   	select S5P_DEV_I2C_HDMIPHY
>>   	select S5P_DEV_MFC
>>   	select S5P_DEV_TV
>> diff --git a/arch/arm/mach-exynos/mach-smdkv310.c
>> b/arch/arm/mach-exynos/mach-smdkv310.c
>> index b2c5557..8a5c23b 100644
>> --- a/arch/arm/mach-exynos/mach-smdkv310.c
>> +++ b/arch/arm/mach-exynos/mach-smdkv310.c
>> @@ -270,6 +270,7 @@ static struct platform_device *smdkv310_devices[]
>> __initdata = {
>>   	&s5p_device_fimc1,
>>   	&s5p_device_fimc2,
>>   	&s5p_device_fimc3,
>> +	&s5p_device_g2d,
>>   	&exynos4_device_ac97,
>>   	&exynos4_device_i2s0,
>>   	&exynos4_device_ohci,
>
> Looks ok, will apply.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>


-- 
With warm regards,
Sachin
