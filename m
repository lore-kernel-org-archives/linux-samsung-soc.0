From: Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH 3/9] ARM: EXYNOS: add initial setup-i2c0 for EXYNOS5
Date: Wed, 1 Feb 2012 00:53:12 -0800
Message-ID: <CAOesGMg3xS7o1+F1ZmZvg1=oy59F+7QnSYWkJ9kTacCDu35aOg@mail.gmail.com>
References: <1328024354-4277-1-git-send-email-kgene.kim@samsung.com>
	<1328024354-4277-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f42.google.com ([74.125.82.42]:45130 "EHLO
	mail-ww0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753917Ab2BAIxN convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Feb 2012 03:53:13 -0500
Received: by wgbgn7 with SMTP id gn7so5861323wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Feb 2012 00:53:12 -0800 (PST)
In-Reply-To: <1328024354-4277-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, rmk+kernel@arm.linux.org.uk, arnd@arndb.de

Hi,

On Tue, Jan 31, 2012 at 7:39 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

A brief patch description, please.

> diff --git a/arch/arm/mach-exynos/setup-i2c0.c b/arch/arm/mach-exynos=
/setup-i2c0.c
> index d395bd1..3244f3e 100644
> --- a/arch/arm/mach-exynos/setup-i2c0.c
> +++ b/arch/arm/mach-exynos/setup-i2c0.c
> @@ -1,7 +1,7 @@
> =A0/*
> - * linux/arch/arm/mach-exynos4/setup-i2c0.c
> + * linux/arch/arm/mach-exynos/setup-i2c0.c

The file name fills very little purpose in files like these. Consider
removing them at some point.

> @@ -18,9 +18,14 @@ struct platform_device; /* don't need the contents=
 */
> =A0#include <linux/gpio.h>
> =A0#include <plat/iic.h>
> =A0#include <plat/gpio-cfg.h>
> +#include <plat/cpu.h>
>
> =A0void s3c_i2c0_cfg_gpio(struct platform_device *dev)
> =A0{
> - =A0 =A0 =A0 s3c_gpio_cfgall_range(EXYNOS4_GPD1(0), 2,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_GPIO_SF=
N(2), S3C_GPIO_PULL_UP);
> + =A0 =A0 =A0 if (soc_is_exynos5250())
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* will be implemented with gpio functi=
on */
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_gpio_cfgall_range(EXYNOS4_GPD1(0), =
2,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 S3C_GPIO_SFN(2), S3C_GPIO_PULL_UP);
> =A0}

The above is pretty awkward. It's cleaner to return and avoid the else
side of the statement (move the comment accordingly, of course).


-Olof
