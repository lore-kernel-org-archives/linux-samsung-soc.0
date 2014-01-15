From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Subject: Re: [PATCH 1/1] ARM: S3C24XX: Move rtc-core.h from plat to mach
Date: Wed, 15 Jan 2014 22:34:22 +0100
Message-ID: <2677599.hxjB7meQWY@phil>
References: <1388400008-9113-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:39853 "EHLO gloria.sntech.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751336AbaAOVeu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jan 2014 16:34:50 -0500
In-Reply-To: <1388400008-9113-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

Am Montag, 30. Dezember 2013, 16:10:08 schrieb Sachin Kamat:
> plat/rtc-core.h is only referenced from mach-s3c24xx. Hence
> move it there to de-populate the plat directory. While at it
> also do some cleanup of the header file.
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> Cc: Heiko Stuebner <heiko@sntech.de>

late, but as the patch is not merged yet:

Acked-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  .../plat => mach-s3c24xx/include/mach}/rtc-core.h  |   13 ++++++-------
>  arch/arm/mach-s3c24xx/s3c2416.c                    |    2 +-
>  arch/arm/mach-s3c24xx/s3c2443.c                    |    2 +-
>  3 files changed, 8 insertions(+), 9 deletions(-)
>  rename arch/arm/{plat-samsung/include/plat =>
> mach-s3c24xx/include/mach}/rtc-core.h (69%)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/rtc-core.h
> b/arch/arm/mach-s3c24xx/include/mach/rtc-core.h similarity index 69%
> rename from arch/arm/plat-samsung/include/plat/rtc-core.h
> rename to arch/arm/mach-s3c24xx/include/mach/rtc-core.h
> index 7b542f7b7938..4d5f5768f700 100644
> --- a/arch/arm/plat-samsung/include/plat/rtc-core.h
> +++ b/arch/arm/mach-s3c24xx/include/mach/rtc-core.h
> @@ -1,5 +1,4 @@
> -/* linux/arch/arm/plat-samsung/include/plat/rtc-core.h
> - *
> +/*
>   * Copyright (c) 2011 Heiko Stuebner <heiko@sntech.de>
>   *
>   * Samsung RTC Controller core functions
> @@ -9,19 +8,19 @@
>   * published by the Free Software Foundation.
>  */
> 
> -#ifndef __ASM_PLAT_RTC_CORE_H
> -#define __ASM_PLAT_RTC_CORE_H __FILE__
> +#ifndef __RTC_CORE_H
> +#define __RTC_CORE_H __FILE__
> 
>  /* These functions are only for use with the core support code, such as
>   * the cpu specific initialisation code
>   */
> 
> +extern struct platform_device s3c_device_rtc;
> +
>  /* re-define device name depending on support. */
>  static inline void s3c_rtc_setname(char *name)
>  {
> -#if defined(CONFIG_S3C_DEV_RTC) || defined(CONFIG_PLAT_S3C24XX)
>  	s3c_device_rtc.name = name;
> -#endif
>  }
> 
> -#endif /* __ASM_PLAT_RTC_CORE_H */
> +#endif /* __RTC_CORE_H */
> diff --git a/arch/arm/mach-s3c24xx/s3c2416.c
> b/arch/arm/mach-s3c24xx/s3c2416.c index cb77880029f7..a0b787505c02 100644
> --- a/arch/arm/mach-s3c24xx/s3c2416.c
> +++ b/arch/arm/mach-s3c24xx/s3c2416.c
> @@ -48,6 +48,7 @@
>  #include <asm/system_misc.h>
> 
>  #include <mach/regs-s3c2443-clock.h>
> +#include <mach/rtc-core.h>
> 
>  #include <plat/gpio-core.h>
>  #include <plat/gpio-cfg.h>
> @@ -61,7 +62,6 @@
>  #include <plat/fb-core.h>
>  #include <plat/nand-core.h>
>  #include <plat/adc-core.h>
> -#include <plat/rtc-core.h>
>  #include <plat/spi-core.h>
> 
>  #include "common.h"
> diff --git a/arch/arm/mach-s3c24xx/s3c2443.c
> b/arch/arm/mach-s3c24xx/s3c2443.c index faa1086924c4..4af858457b2f 100644
> --- a/arch/arm/mach-s3c24xx/s3c2443.c
> +++ b/arch/arm/mach-s3c24xx/s3c2443.c
> @@ -34,6 +34,7 @@
>  #include <asm/system_misc.h>
> 
>  #include <mach/regs-s3c2443-clock.h>
> +#include <mach/rtc-core.h>
> 
>  #include <plat/gpio-core.h>
>  #include <plat/gpio-cfg.h>
> @@ -43,7 +44,6 @@
>  #include <plat/fb-core.h>
>  #include <plat/nand-core.h>
>  #include <plat/adc-core.h>
> -#include <plat/rtc-core.h>
>  #include <plat/spi-core.h>
> 
>  static struct map_desc s3c2443_iodesc[] __initdata = {
