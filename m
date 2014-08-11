From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: Re: [RESEND PATCH 1/1] ARM: exynos_defconfig: Enable SBS battery
 support
Date: Mon, 11 Aug 2014 14:52:27 +0200
Message-ID: <53E8BC8B.70709@collabora.co.uk>
References: <1407755198-17568-1-git-send-email-javier.martinez@collabora.co.uk> <1761549.yKSqfXafKr@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:37550 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751485AbaHKMwZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 08:52:25 -0400
In-Reply-To: <1761549.yKSqfXafKr@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Tomasz Figa <t.figa@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Hello Bartlomiej,

On 08/11/2014 02:40 PM, Bartlomiej Zolnierkiewicz wrote:
>> index fc7d168..c390bb9 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -77,6 +77,7 @@ CONFIG_SPI_S3C64XX=y
>>  CONFIG_I2C_S3C2410=y
>>  CONFIG_DEBUG_GPIO=y
>>  CONFIG_POWER_SUPPLY=y
>> +CONFIG_BATTERY_SBS=m
> 
> Why not make it "=y"?
> 
> Rationale:
> - currently no hardware related option uses "=m" in exynos_defconfig
> - it would match the SBS option usage in multi_v7_defconfig
>
>>  CONFIG_CHARGER_TPS65090=y
>>  # CONFIG_HWMON is not set
>>  CONFIG_THERMAL=y
> 

I know but personally I think this should be changed. The idea of having a multi
platform kernel is to build a single kernel image that can be used to boot
different platforms. Not all platforms have a SBS-compliant battery so this
support shouldn't be built in the kernel image IMHO.

This also matches to what real users will do since distributions most likely
will have a minimal kernel and every possible hardware support will be enabled
as a loadable kernel module. This is what distros do for other platforms too.

If someone has a different use case and wants a kernel image that is optimized
for a particular platform then she has to create its own defconfig anyways.

> Best regards,
> --
> Bartlomiej Zolnierkiewicz
> Samsung R&D Institute Poland
> Samsung Electronics
> 

Best regards,
Javier
