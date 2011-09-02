From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 2/3] ARM: EXYNOS4: Add support for secondary MMC port
 on ORIGEN
Date: Fri, 02 Sep 2011 08:51:12 +0530
Message-ID: <4E604BA8.6090303@linaro.org>
References: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org> <1314351524-10942-3-git-send-email-tushar.behera@linaro.org> <000201cc6778$5bd7d670$13878350$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:46416 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758091Ab1IBDVK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Sep 2011 23:21:10 -0400
Received: by pzk37 with SMTP id 37so3932492pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Sep 2011 20:21:09 -0700 (PDT)
In-Reply-To: <000201cc6778$5bd7d670$13878350$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org

Hi Kukjin,

On Wednesday 31 August 2011 06:23 AM, Kukjin Kim wrote:
> Tushar Behera wrote:
>> -----Original Message-----
>> From: Tushar Behera [mailto:tushar.behera@linaro.org]
>> Sent: Friday, August 26, 2011 6:39 PM
>> To: linux-samsung-soc@vger.kernel.org
>> Cc: linaro-dev@lists.linaro.org; kgene.kim@samsung.com; patches@linaro.org
>> Subject: [PATCH 2/3] ARM: EXYNOS4: Add support for secondary MMC port on
>> ORIGEN
>>
>> Secondary MMC port on ORIGEN is connected to sdhci instance 0. Support
>> for secondary MMC port is extended by registering sdhci instance 0.
>>
>> Since sdhci instance 2 can contain a bootable media, sdhci instance 0
>> is registered after instance 2.
>>
> Would be helpful if above comments could be included in codes :)
>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>>   arch/arm/mach-exynos4/Kconfig       |    1 +
>>   arch/arm/mach-exynos4/mach-origen.c |    7 +++++++
>>   2 files changed, 8 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
>> index e6925de..4c14d5e 100644
>> --- a/arch/arm/mach-exynos4/Kconfig
>> +++ b/arch/arm/mach-exynos4/Kconfig
>> @@ -229,6 +229,7 @@ config MACH_ORIGEN
>>   	select CPU_EXYNOS4210
>>   	select S3C_DEV_RTC
>>   	select S3C_DEV_WDT
>> +	select S3C_DEV_HSMMC
>>   	select S3C_DEV_HSMMC2
>>   	select EXYNOS4_SETUP_SDHCI
>>   	help
>> diff --git a/arch/arm/mach-exynos4/mach-origen.c
> b/arch/arm/mach-exynos4/mach-
>> origen.c
>> index e280270..ae18812 100644
>> --- a/arch/arm/mach-exynos4/mach-origen.c
>> +++ b/arch/arm/mach-exynos4/mach-origen.c
>> @@ -72,6 +72,11 @@ static struct s3c2410_uartcfg origen_uartcfgs[]
> __initdata = {
>>   	},
>>   };
>>
>> +static struct s3c_sdhci_platdata origen_hsmmc0_pdata __initdata = {
>> +	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>> +	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
>> +};
>> +
>>   static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
>>   	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>>   	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
>> @@ -79,6 +84,7 @@ static struct s3c_sdhci_platdata origen_hsmmc2_pdata
>> __initdata = {
>>
>>   static struct platform_device *origen_devices[] __initdata = {
>>   	&s3c_device_hsmmc2,
>> +	&s3c_device_hsmmc0,
>>   	&s3c_device_rtc,
>>   	&s3c_device_wdt,
>>   };
>> @@ -93,6 +99,7 @@ static void __init origen_map_io(void)
>>   static void __init origen_machine_init(void)
>>   {
>>   	s3c_sdhci2_set_platdata(&origen_hsmmc2_pdata);
>> +	s3c_sdhci0_set_platdata(&origen_hsmmc0_pdata);
>>   	platform_add_devices(origen_devices, ARRAY_SIZE(origen_devices));
>>   }
>>
>> --
>> 1.7.4.1
>
> OK, will apply.
> If you don't mind, I will add comments the reason of the ordering when I
> apply this.
>
Thanks. That would be great.

> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim<kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>


-- 
Tushar Behera
