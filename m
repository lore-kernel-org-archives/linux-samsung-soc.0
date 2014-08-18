From: Kukjin Kim <kgene.kim@samsung.com>
Subject: Re: [PATCH v2 1/1] ARM: exynos_defconfig: Enable SBS battery support
Date: Mon, 18 Aug 2014 11:26:56 -0500
Message-ID: <53F22950.8020801@samsung.com>
References: <1407779837-10981-1-git-send-email-javier.martinez@collabora.co.uk> <5085566.VKH3IuqYyi@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f48.google.com ([209.85.213.48]:45908 "EHLO
	mail-yh0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789AbaHRQ1X (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Aug 2014 12:27:23 -0400
Received: by mail-yh0-f48.google.com with SMTP id i57so4648663yha.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2014 09:27:22 -0700 (PDT)
In-Reply-To: <5085566.VKH3IuqYyi@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-samsung-soc@vger.kernel.org, Sachin Kamat <sachin.kamat@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org

On 08/12/14 12:05, Bartlomiej Zolnierkiewicz wrote:
> On Monday, August 11, 2014 07:57:17 PM Javier Martinez Canillas wrote:
>> Many Exynos5 boards (e.g: Snow, Peach Pit and Pi) have
>> a SBS-compliant gas gauge battery. Enable to built it
>> so the needed support is available for these boards.
>>
>> Suggested-by: Doug Anderson<dianders@chromium.org>
>> Signed-off-by: Javier Martinez Canillas<javier.martinez@collabora.co.uk>
>> Acked-by: Kukjin Kim<kgene.kim@samsung.com>
>> Reviewed-by: Doug Anderson<dianders@chromium.org>
>
> Thanks for updating the patch.
>
> Reviewed-by: Bartlomiej Zolnierkiewicz<b.zolnierkie@samsung.com>
>
Thanks, applied into fixes.

- Kukjin

>>
>> Changes since v1:
>>   - Don't build it as a module since is the exception in exynos_defconfig.
>>     Suggested by Bartlomiej Zolnierkiewicz.
>>
>>   arch/arm/configs/exynos_defconfig | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
>> index fc7d168..c390bb9 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -77,6 +77,7 @@ CONFIG_SPI_S3C64XX=y
>>   CONFIG_I2C_S3C2410=y
>>   CONFIG_DEBUG_GPIO=y
>>   CONFIG_POWER_SUPPLY=y
>> +CONFIG_BATTERY_SBS=y
>>   CONFIG_CHARGER_TPS65090=y
>>   # CONFIG_HWMON is not set
>>   CONFIG_THERMAL=y
