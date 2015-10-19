From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 5/7] ARM: exynos_defconfig: Normalize exynos defconfig
Date: Mon, 19 Oct 2015 21:28:44 +0530
Message-ID: <CAGOxZ52bGrHo0DzjhyjGPXwX0CWUn0Oqkx-EGZY51zC5FWcAKw@mail.gmail.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
 <1445234635-3950-6-git-send-email-alim.akhtar@samsung.com> <5624EF5D.7080403@osg.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:34990 "EHLO
	mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753596AbbJSP7Y (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 11:59:24 -0400
In-Reply-To: <5624EF5D.7080403@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, kgene <kgene@kernel.org>, =?UTF-8?Q?Krzysztof_Koz=C5=82owski?= <k.kozlowski@samsung.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Javier,

On Mon, Oct 19, 2015 at 6:55 PM, Javier Martinez Canillas
<javier@osg.samsung.com> wrote:
> Hello Alim,
>
> On 10/19/2015 08:03 AM, Alim Akhtar wrote:
>> make savedefconfig result in some difference, lets normalize the
>> defconfig.
>>
>> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
>> ---
>
> Did you make savedefconfig against v4.3-rc6 or tot linux-next?
>
These are based on v4.3-rc5.

> I remember we had issues in the past due savedefconfig made against
> linux-next but then some of the patches in linux-next not making it
> to the next release. So I think it should be good to mention what's
> the base used for this patch.
>
Ah, ok I didn't follow that, will check again on Linux-next as well as
on 4.3-rc5

>>  arch/arm/configs/exynos_defconfig |    8 ++------
>>  1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
>> index 1ff2bfa2e183..3349713e6c63 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -99,10 +99,8 @@ CONFIG_SENSORS_LM90=y
>>  CONFIG_SENSORS_NTC_THERMISTOR=y
>>  CONFIG_SENSORS_PWM_FAN=y
>>  CONFIG_SENSORS_INA2XX=y
>> -CONFIG_THERMAL=y
>>  CONFIG_CPU_THERMAL=y
>>  CONFIG_THERMAL_EMULATION=y
>> -CONFIG_EXYNOS_THERMAL=y
>
> I would prefer to split all the changes that removes symbols into a
> separate patch explaining why these are not needed anymore (i.e: it
> is selected now by symbol $foo).
>
Ok ..let me rebase my patches and check these config changes again....
>>  CONFIG_WATCHDOG=y
>>  CONFIG_S3C2410_WATCHDOG=y
>>  CONFIG_MFD_CROS_EC=y
>> @@ -127,14 +125,14 @@ CONFIG_REGULATOR_S2MPS11=y
>>  CONFIG_REGULATOR_S5M8767=y
>>  CONFIG_REGULATOR_TPS65090=y
>>  CONFIG_DRM=y
>> -CONFIG_DRM_NXP_PTN3460=y
>> -CONFIG_DRM_PARADE_PS8622=y
>>  CONFIG_DRM_EXYNOS=y
>>  CONFIG_DRM_EXYNOS_FIMD=y
>>  CONFIG_DRM_EXYNOS_DSI=y
>>  CONFIG_DRM_EXYNOS_HDMI=y
>>  CONFIG_DRM_PANEL_SIMPLE=y
>>  CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
>> +CONFIG_DRM_NXP_PTN3460=y
>> +CONFIG_DRM_PARADE_PS8622=y
>
> Moving these DRM bridge symbols to match savedefconfig is ok IMHO.
>
>>  CONFIG_FB_SIMPLE=y
>>  CONFIG_EXYNOS_VIDEO=y
>>  CONFIG_EXYNOS_MIPI_DSI=y
>> @@ -175,7 +173,6 @@ CONFIG_RTC_DRV_S5M=y
>>  CONFIG_RTC_DRV_S3C=y
>>  CONFIG_DMADEVICES=y
>>  CONFIG_PL330_DMA=y
>> -CONFIG_CHROME_PLATFORMS=y
>>  CONFIG_CROS_EC_CHARDEV=y
>>  CONFIG_COMMON_CLK_MAX77686=y
>>  CONFIG_COMMON_CLK_MAX77802=y
>> @@ -190,7 +187,6 @@ CONFIG_PWM_SAMSUNG=y
>>  CONFIG_PHY_EXYNOS5250_SATA=y
>>  CONFIG_EXT2_FS=y
>>  CONFIG_EXT3_FS=y
>> -CONFIG_EXT4_FS=y
>>  CONFIG_MSDOS_FS=y
>>  CONFIG_VFAT_FS=y
>>  CONFIG_TMPFS=y
>>
>
> Same comment than above, I would prefer these to be split.
>
> Best regards,
> --
> Javier Martinez Canillas
> Open Source Group
> Samsung Research America
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Regards,
Alim
