From: Anand Moon <linux.amoon@gmail.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: Make S3C2410_WATCHDOG as loadable module
Date: Thu, 3 Sep 2015 10:50:48 +0530
Message-ID: <CANAwSgQwC3-Z364ZcGRbKCzQbNi_RYB_3cDRT0ZsxhhprW9mxQ@mail.gmail.com>
References: <1441253429-3264-1-git-send-email-linux.amoon@gmail.com> <55E7D478.2020200@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f169.google.com ([209.85.212.169]:35618 "EHLO
	mail-wi0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750818AbbICFVJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 3 Sep 2015 01:21:09 -0400
In-Reply-To: <55E7D478.2020200@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Andreas Faerber <afaerber@suse.de>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Linux Kernel <linux-kernel@vger.kernel.org>

Hi Krzysztof

On 3 September 2015 at 10:32, Krzysztof Kozlowski
<k.kozlowski@samsung.com> wrote:
> On 03.09.2015 13:10, Anand Moon wrote:
>> S3C2410_WATCHDOG watchdog drivers should not be loaded automatically,
>> but only if a watchdog daemon is installed.
>
> First of all: why?
>
> Secondly: even as a module driver could be loaded automatically to match
> enabled device (it has MODULE_DEVICE_TABLE). In the same time loading it
> does not hurt - watchdog should be inactive:
>
> s3c2410-wdt 10060000.watchdog: watchdog inactive, reset disabled, irq
> disabled
>
> Best regards,
> Krzysztof
>
>>
>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>> ---
>>  arch/arm/configs/exynos_defconfig | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
>> index aaf7aa4..b5d382e 100644
>> --- a/arch/arm/configs/exynos_defconfig
>> +++ b/arch/arm/configs/exynos_defconfig
>> @@ -101,7 +101,7 @@ CONFIG_CPU_THERMAL=y
>>  CONFIG_THERMAL_EMULATION=y
>>  CONFIG_EXYNOS_THERMAL=y
>>  CONFIG_WATCHDOG=y
>> -CONFIG_S3C2410_WATCHDOG=y
>> +CONFIG_S3C2410_WATCHDOG=m
>>  CONFIG_MFD_CROS_EC=y
>>  CONFIG_MFD_CROS_EC_I2C=y
>>  CONFIG_MFD_CROS_EC_SPI=y
>>

All the watchdog drivers are blacklisted not to be loaded by the ubuntu.
Their are some configurable parameters which get configured while
loading of the module using watchdog daemon.
Watchdog service will reconfigure watchdog driver while loading.

-Anand Moon
>
