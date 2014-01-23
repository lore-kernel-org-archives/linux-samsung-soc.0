From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH 4/5] ARM: S3C24XX: convert boards to use common restart
 function
Date: Thu, 23 Jan 2014 19:12:04 +0100
Message-ID: <52E15B74.3040409@samsung.com>
References: <3105326.uFdOVLyXH8@phil> <2227259.2cNbl9uzOp@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:16185 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753675AbaAWSMU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 23 Jan 2014 13:12:20 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MZV00E2O98JDY60@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 23 Jan 2014 18:12:20 +0000 (GMT)
In-reply-to: <2227259.2cNbl9uzOp@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Hi Heiko,

On 06.01.2014 19:40, Heiko St=FCbner wrote:
> This converts all boards to use the new common restart function inste=
ad
> of SoC specific ones.
>
> The mach-s3c2416-dt board now tries to setup either a swrst- or watch=
dog-
> reset so that it will be able to handle more s3c24xx-SoCs later on.
[snip]
> diff --git a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c b/arch/arm/mach-=
s3c24xx/mach-s3c2416-dt.c
> index 0a86953..88716fa4 100644
> --- a/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> +++ b/arch/arm/mach-s3c24xx/mach-s3c2416-dt.c
> @@ -24,6 +24,7 @@
>
>   #include <plat/cpu.h>
>   #include <plat/pm.h>
> +#include <plat/watchdog-reset.h>
>
>   #include "common.h"
>
> @@ -34,6 +35,14 @@ static void __init s3c2416_dt_map_io(void)
>
>   static void __init s3c2416_dt_machine_init(void)
>   {
> +	s3c24xx_swrst_reset_of_init();
> +
> +#ifdef CONFIG_SAMSUNG_WDT_RESET
> +	/* if no special swrst-device exists try to find a watchdog */
> +	if (!s3c24xx_swrst_reset_available())
> +		samsung_wdt_reset_of_init();
> +#endif

Hmm... I think it would be safe to assume availability of soft reset,=20
especially if you could move the restart code to the clock driver.

Best regards,
Tomasz
