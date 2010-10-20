From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2 1/4] ARM: S3C24XX: Fix gpiolib support for ports K..M
Date: Wed, 20 Oct 2010 19:46:40 +0900
Message-ID: <05d901cb7044$16087090$421951b0$%kim@samsung.com>
References: <1277220124-16225-1-git-send-email-jekhor@gmail.com>
 <1277220124-16225-2-git-send-email-jekhor@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:37625 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751825Ab0JTKqW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Oct 2010 06:46:22 -0400
Received: from epmmp2 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Sun Java(tm) System Messaging Server 7u3-15.01 64bit (built Feb 12 2010))
 with ESMTP id <0LAL00J9F4L8GC20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Oct 2010 19:46:20 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LAL00F5T4L8FI@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 20 Oct 2010 19:46:21 +0900 (KST)
In-reply-to: <1277220124-16225-2-git-send-email-jekhor@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Yauhen Kharuzhy' <jekhor@gmail.com>, 'Ben Dooks' <ben-linux@fluff.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Yauhen Kharuzhy wrote:
> 
> S3C2443 and S3C2416 has 12 GPIO banks (from A to M), increase
> ARCH_NR_GPIOS for this architectures.
> 
> Also typo from previous commit has been fixed: CONFIG_CPU_S3C24XX
> instead CONFIG_CPU_244X.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> Tested-by: Vasily Khoruzhick <anarsoul@gmail.com>
> 
> ---
>  arch/arm/mach-s3c2410/include/mach/gpio.h |   10 +++++++---
>  1 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c2410/include/mach/gpio.h b/arch/arm/mach-
> s3c2410/include/mach/gpio.h
> index b649bf2..f7f6b07 100644
> --- a/arch/arm/mach-s3c2410/include/mach/gpio.h
> +++ b/arch/arm/mach-s3c2410/include/mach/gpio.h
> @@ -22,6 +22,8 @@
> 
>  #ifdef CONFIG_CPU_S3C244X
>  #define ARCH_NR_GPIOS	(32 * 9 + CONFIG_S3C24XX_GPIO_EXTRA)
> +#elif defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
> +#define ARCH_NR_GPIOS	(32 * 12 + CONFIG_S3C24XX_GPIO_EXTRA)
>  #else
>  #define ARCH_NR_GPIOS	(256 + CONFIG_S3C24XX_GPIO_EXTRA)
>  #endif
> @@ -30,8 +32,10 @@
>  #include <mach/gpio-nrs.h>
>  #include <mach/gpio-fns.h>
> 
> -#ifdef CONFIG_CPU_S3C24XX
> -#define S3C_GPIO_END	(S3C2410_GPIO_BANKJ + 32)
> +#ifdef CONFIG_CPU_S3C244X
> +#define S3C_GPIO_END	(S3C2410_GPJ(0) + 32)
> +#elif defined(CONFIG_CPU_S3C2443) || defined(CONFIG_CPU_S3C2416)
> +#define S3C_GPIO_END	(S3C2410_GPM(0) + 32)
>  #else
> -#define S3C_GPIO_END	(S3C2410_GPIO_BANKH + 32)
> +#define S3C_GPIO_END	(S3C2410_GPH(0) + 32)
>  #endif
> --

Looks ok to me...will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
