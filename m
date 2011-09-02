From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 3/3] ARM: EXYNOS4: Add support for 8-bit bus width in
 SDHCI for ORIGEN
Date: Fri, 02 Sep 2011 16:29:33 +0530
Message-ID: <4E60B715.6090801@linaro.org>
References: <1314351524-10942-1-git-send-email-tushar.behera@linaro.org> <1314351524-10942-4-git-send-email-tushar.behera@linaro.org> <000601cc6779$7fe130b0$7fa39210$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f42.google.com ([209.85.210.42]:34978 "EHLO
	mail-pz0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933366Ab1IBK7k (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Sep 2011 06:59:40 -0400
Received: by pzk37 with SMTP id 37so4403129pzk.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 02 Sep 2011 03:59:40 -0700 (PDT)
In-Reply-To: <000601cc6779$7fe130b0$7fa39210$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linaro-dev@lists.linaro.org, patches@linaro.org

On Wednesday 31 August 2011 06:31 AM, Kukjin Kim wrote:
> Tushar Behera wrote:
>>
>> Platform data for SDHCI controller on ORIGEN board is missing the
>> support for 8-bit bus width. The platform data is extended in sync
>> with other EXYNOS4 machines.
>>
>> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
>> ---
>>   arch/arm/mach-exynos4/mach-origen.c |    8 ++++++++
>>   1 files changed, 8 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/mach-origen.c
> b/arch/arm/mach-exynos4/mach-
>> origen.c
>> index ae18812..6b6cd77 100644
>> --- a/arch/arm/mach-exynos4/mach-origen.c
>> +++ b/arch/arm/mach-exynos4/mach-origen.c
>> @@ -75,11 +75,19 @@ static struct s3c2410_uartcfg origen_uartcfgs[]
> __initdata =
>> {
>>   static struct s3c_sdhci_platdata origen_hsmmc0_pdata __initdata = {
>>   	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>>   	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
>> +#ifdef CONFIG_EXYNOS4_SDHCI_CH0_8BIT
>> +	.max_width		= 8,
>> +	.host_caps		= MMC_CAP_8_BIT_DATA,
>> +#endif
>>   };
>>
>>   static struct s3c_sdhci_platdata origen_hsmmc2_pdata __initdata = {
>>   	.cd_type		= S3C_SDHCI_CD_INTERNAL,
>>   	.clk_type		= S3C_SDHCI_CLK_DIV_EXTERNAL,
>> +#ifdef CONFIG_EXYNOS4_SDHCI_CH2_8BIT
>> +	.max_width		= 8,
>> +	.host_caps		= MMC_CAP_8_BIT_DATA,
>> +#endif
>>   };
>>
>>   static struct platform_device *origen_devices[] __initdata = {
>> --
>> 1.7.4.1
>
> Hi Tushar,
>
> I wonder the bus width of SDHCI controller can be changed manually on ORIGEN
> like SMDK board.
>
Thanks for your review.

On ORIGEN board, we have wire connections for HSMMC-0/2/3 between the 
MMC port and the SoC. Hence ideally we can work with HSMMC2 in both 
4-bit and 8-bit mode. However HSMMC0 can only work in 4-bit mode.

Also IIRC WLAN would be using HSMMC-3 controller for its operations. So 
we would have conflict when HSMMC2 is working in 8-bit mode and WLAN is 
also enabled. Hence it appears better to drop this patch now.

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
