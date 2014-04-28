From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH 1/1] ARM: exynos_defconfig: Enable HS-I2C
Date: Mon, 28 Apr 2014 09:26:18 +0530
Message-ID: <535DD162.1080404@linaro.org>
References: <1393935776-22657-1-git-send-email-sachin.kamat@linaro.org> <5358C521.9060103@linaro.org> <0b5b01cf6140$afd3d390$0f7b7ab0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f53.google.com ([209.85.160.53]:61765 "EHLO
	mail-pb0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751223AbaD1D4Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 27 Apr 2014 23:56:24 -0400
Received: by mail-pb0-f53.google.com with SMTP id jt11so3602787pbb.40
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Apr 2014 20:56:23 -0700 (PDT)
In-Reply-To: <0b5b01cf6140$afd3d390$0f7b7ab0$@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Sachin Kamat' <sachin.kamat@linaro.org>

On 04/26/2014 04:44 PM, Kukjin Kim wrote:
> Tushar Behera wrote:
>>
>> On 03/04/2014 05:52 PM, Sachin Kamat wrote:
>>> High speed I2C is used on Exynos5 based SoCs. Enable it.
>>>
>>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>>> ---
>>>  arch/arm/configs/exynos_defconfig |    1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm/configs/exynos_defconfig
>> b/arch/arm/configs/exynos_defconfig
>>> index 4ce7b70ea901..e07a227ec0db 100644
>>> --- a/arch/arm/configs/exynos_defconfig
>>> +++ b/arch/arm/configs/exynos_defconfig
>>> @@ -65,6 +65,7 @@ CONFIG_TCG_TIS_I2C_INFINEON=y
>>>  CONFIG_I2C=y
>>>  CONFIG_I2C_MUX=y
>>>  CONFIG_I2C_ARB_GPIO_CHALLENGE=y
>>> +CONFIG_I2C_EXYNOS5=y
>>>  CONFIG_I2C_S3C2410=y
>>>  CONFIG_DEBUG_GPIO=y
>>>  # CONFIG_HWMON is not set
>>>
>> Kukjin,
>>
>> Please consider picking this patch when you plan to update
>> exynos_defconfig. With this change on upstream kernel, we are able to
>> get Arndale_Octa board to boot and mount an MMC partition successfully.
>>
> Oh, OK.
> 
> BTW, basically the boot should be fine with/without selecting

The boot is just fine. Just that, we can't use the MMC partition to
mount rootfs.

> I2C_EXYNOS5...or if the config is required always for arndale_octa board, it
> should be enabled without any manual selecting. I think, it means this is
> just temporal solution not right approach to fix the problem..
> 

I don't see any reason why HS-I2C support not be enabled by default on
exynos_defconfig. On many boards,the regulators are connected HS-I2C bus
and without this option enabled the regulators don't come by default.

If you have any reason why this is not the right approach to fix the
problem, please let us know.

> I need to look at the codes...
> 
> Thanks,
> Kukjin
> 

-- 
Tushar Behera
