From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: Re: [PATCH 2/4] mfd: max77686: Use module_i2c_driver() instead of
 subsys initcall
Date: Wed, 17 Feb 2016 15:38:59 -0300
Message-ID: <56C4BE43.9090005@osg.samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-3-git-send-email-javier@osg.samsung.com>
 <56C1762E.9040208@samsung.com> <56C1ED07.6090008@osg.samsung.com>
 <56C25D55.5040208@samsung.com> <56C38A78.2090601@osg.samsung.com>
 <56C4260E.5010808@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:49131 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965424AbcBQSjJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Feb 2016 13:39:09 -0500
In-Reply-To: <56C4260E.5010808@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hello Krzysztof,

On 02/17/2016 04:49 AM, Krzysztof Kozlowski wrote:
> On 17.02.2016 05:45, Javier Martinez Canillas wrote:

[snip]

>>>
>>> By "please check" in this case I mean - look if every regulator/clock
>>> consumer using stuff exposed by PMIC, supports properly deferred probing.
>>>
>>
>> Got it, I checked and all but one consumer driver that use resources
>> provided by the max77686 defer probe when this is not found AFAICT.
>>
>> Clocks:
>>
>> drivers/mmc/core/pwrseq_simple.c
>> drivers/rtc/rtc-s3c.c
>>
>> Regulators:
>>
>> drivers/cpufreq/cpufreq-dt.c
>> drivers/gpu/drm/exynos/exynos_drm_dsi.c
>> drivers/gpu/drm/exynos/exynos_hdmi.c
>> drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
>> drivers/iio/adc/exynos_adc.c
>> drivers/input/misc/max77693-haptic.c
>> drivers/input/touchscreen/mms114.c
>> drivers/media/i2c/s5c73m3/s5c73m3-core.c
>> drivers/media/i2c/s5k6a3.c
>> drivers/media/platform/exynos4-is/mipi-csis.c
>> drivers/mfd/wm8994-core.c
>> drivers/mmc/host/dw_mmc.c
>> drivers/mmc/host/sdhci.c
>> drivers/usb/dwc2/platform.c
>>
>> The only driver that does not defer probe when an input supply
>> isn't found is drivers/thermal/samsung/exynos_tmu.c (vtmu-supply).
>>
>> So that should be handled before this series are merged.
>
> Thanks for the analysis. Indeed the exynos_tmu does not support probe
> deferral. Instead it just ignores the error and skips the regulator. It
> would be good to fix this before applying this patch.
>

Ok. I'll take care of that, probably tomorrow.
  
> Rest looks indeed good so I don't have objections (beside tmu case).
>

Thanks a lot for your feedback and suggestions.

> Best regards,
> Krzysztof
> --

Best regards,
-- 
Javier Martinez Canillas
Open Source Group
Samsung Research America
