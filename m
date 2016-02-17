From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: Re: [PATCH 2/4] mfd: max77686: Use module_i2c_driver() instead of
 subsys initcall
Date: Wed, 17 Feb 2016 16:49:34 +0900
Message-ID: <56C4260E.5010808@samsung.com>
References: <1455251419-8919-1-git-send-email-javier@osg.samsung.com>
 <1455251419-8919-3-git-send-email-javier@osg.samsung.com>
 <56C1762E.9040208@samsung.com> <56C1ED07.6090008@osg.samsung.com>
 <56C25D55.5040208@samsung.com> <56C38A78.2090601@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:45751 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756534AbcBQHtl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Feb 2016 02:49:41 -0500
In-reply-to: <56C38A78.2090601@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>, linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@samsung.com>, linux-samsung-soc@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>

On 17.02.2016 05:45, Javier Martinez Canillas wrote:
> Hello Krzysztof,
> 
> On 02/15/2016 08:20 PM, Krzysztof Kozlowski wrote:
>> On 16.02.2016 00:21, Javier Martinez Canillas wrote:
>>> Hello Krzysztof,
>>>
>>> On 02/15/2016 03:54 AM, Krzysztof Kozlowski wrote:
>>>> On 12.02.2016 13:30, Javier Martinez Canillas wrote:
>>>>> The driver's init and exit function don't do anything besides
>>>>> adding and
>>>>> deleting the I2C driver so the module_i2c_driver() macro could be
>>>>> used.
>>>>>
>>>>> Currently is not being used because the driver is initialized at
>>>>> subsys
>>>>> initcall level, claiming that this is done to allow consumers
>>>>> devices to
>>>>> use the resources provided by this driver. But dependencies should
>>>>> be in
>>>>> the DT and consumers drivers should not rely in the registration
>>>>> order.
>>>>>
>>>>> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
>>>>> ---
>>>>>
>>>>>    drivers/mfd/max77686.c | 13 +------------
>>>>>    1 file changed, 1 insertion(+), 12 deletions(-)
>>>>>
>>>>
>>>> In the past not all dependencies supported deferred probing so such
>>>> ordering was required.
>>>>
>>>> I don't like the "dependencies should be in DT" reason for the
>>>> change...
>>>> because it is kind of wishful thinking. Yeah, the dependencies
>>>> should be
>>>> in DT, but are they?
>>>>
>>>> Instead *please check it* and write:
>>>> "Dependencies are in DT so manual ordering of init calls is not
>>>> necessary any more".
>>>>
>>>
>>> For the max77802 I know that's the case since the only two DTS in
>>> mainline
>>> that use it are the Peach Pit and Pi and I'm very familiar with those
>>> two.
>>>
>>> But I wonder how can I check that this is the case for the max77686.
>>> Most
>>> DTS in mainline have nodes that use some clocks and regulators
>>> provided by
>>> the PMIC, only arch/arm/boot/dts/exynos5250-smdk5250.dts doesn't have
>>> one
>>> of the regulators as input supply or clock consumer defined.
>>
>> +Cc Marek Szyprowski, who may know a lot more about dependencies between
>> these.
>>
>> I wouldn't care for drivers not taking references to regulators/clocks.
>> Most of necessary regulators and clocks are turned on by bootloader or
>> by default values in PMIC. This means that later probing of PMIC
>> shouldn't influence drivers which are not using it.
>>
>> The remaining problem was unsupported deferred probing by some of the
>> drivers using regulators/clocks (drivers being consumers of regulators
>> or clocks). AFAIR one of example was USB OTG.
>>
>> By "please check" in this case I mean - look if every regulator/clock
>> consumer using stuff exposed by PMIC, supports properly deferred probing.
>>
> 
> Got it, I checked and all but one consumer driver that use resources
> provided by the max77686 defer probe when this is not found AFAICT.
> 
> Clocks:
> 
> drivers/mmc/core/pwrseq_simple.c
> drivers/rtc/rtc-s3c.c
> 
> Regulators:
> 
> drivers/cpufreq/cpufreq-dt.c
> drivers/gpu/drm/exynos/exynos_drm_dsi.c
> drivers/gpu/drm/exynos/exynos_hdmi.c
> drivers/gpu/drm/panel/panel-samsung-s6e8aa0.c
> drivers/iio/adc/exynos_adc.c
> drivers/input/misc/max77693-haptic.c
> drivers/input/touchscreen/mms114.c
> drivers/media/i2c/s5c73m3/s5c73m3-core.c
> drivers/media/i2c/s5k6a3.c
> drivers/media/platform/exynos4-is/mipi-csis.c
> drivers/mfd/wm8994-core.c
> drivers/mmc/host/dw_mmc.c
> drivers/mmc/host/sdhci.c
> drivers/usb/dwc2/platform.c
> 
> The only driver that does not defer probe when an input supply
> isn't found is drivers/thermal/samsung/exynos_tmu.c (vtmu-supply).
> 
> So that should be handled before this series are merged.

Thanks for the analysis. Indeed the exynos_tmu does not support probe
deferral. Instead it just ignores the error and skips the regulator. It
would be good to fix this before applying this patch.

Rest looks indeed good so I don't have objections (beside tmu case).

Best regards,
Krzysztof
