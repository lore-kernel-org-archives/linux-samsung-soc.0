From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH v2] ASoC: Samsung: Update Kconfig for Exynos5250 and Exynos4412
Date: Fri, 28 Sep 2012 16:29:49 +0530
Message-ID: <50658325.8050704@linaro.org>
References: <1348741777-29569-1-git-send-email-padma.v@samsung.com> <003401cd9d5f$179495c0$46bdc140$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:43195 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752908Ab2I1K7y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Sep 2012 06:59:54 -0400
Received: by pbbrr4 with SMTP id rr4so4966244pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Sep 2012 03:59:54 -0700 (PDT)
In-Reply-To: <003401cd9d5f$179495c0$46bdc140$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangsu Park <sangsu4u.park@samsung.com>
Cc: 'Padmavathi Venna' <padma.v@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, sbkim73@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com, olofj@google.com

On 09/28/2012 03:23 PM, Sangsu Park wrote:
> 
> On Thu, Sep 27, 2012 at 07:30 PM, Padmavathi Venna wrote:
> 
>> diff --git a/sound/soc/samsung/Kconfig b/sound/soc/samsung/Kconfig
>> index fe3995c..430783b 100644
>> --- a/sound/soc/samsung/Kconfig
>> +++ b/sound/soc/samsung/Kconfig
>> @@ -1,6 +1,6 @@
>>  config SND_SOC_SAMSUNG
>>  	tristate "ASoC support for Samsung"
>> -	depends on ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210
>> || ARCH_S5P64X0 || ARCH_EXYNOS4
>> +	depends on PLAT_SAMSUNG
>>  	select S3C64XX_DMA if ARCH_S3C64XX
>>  	select S3C2410_DMA if ARCH_S3C24XX
>>  	help
> 
> This code is already updated.
> 
>> @@ -63,7 +63,7 @@ config SND_SOC_SAMSUNG_SMDK_WM8580
>>
>>  config SND_SOC_SAMSUNG_SMDK_WM8994
>>  	tristate "SoC I2S Audio support for WM8994 on SMDK"
>> -	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 ||
>> MACH_SMDK4212)
>> +	depends on SND_SOC_SAMSUNG && (MACH_SMDKV310 || MACH_SMDKC210 ||
>> MACH_SMDK4212 || MACH_SMDK4412 || MACH_EXYNOS5_DT)
>>  	depends on I2C=y && GENERIC_HARDIRQS
>>  	select MFD_WM8994
>>  	select SND_SOC_WM8994
> 
> I'm not sure about this since MACH_EXYNOS5_DT can have others instead of SMDK.
> 

But there is no other way we can differentiate between two EXYNOS5_DT
based boards in the kernel. So, support for all possible codecs and
sound-cards should be enabled in the kernel. The instantiation of the
drivers should depend on the device-tree entries.

> Thanks,
> Sangsu.
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
Tushar Behera
