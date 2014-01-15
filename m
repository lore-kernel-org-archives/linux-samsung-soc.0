From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] ARM: S3C[24|64]xx: move includes back under <mach/> scope
Date: Wed, 15 Jan 2014 14:41:01 +0530
Message-ID: <CAHbNUh29qGSt-isqOAdVVO3x0w2mDTVnKeH+Sc_rkfkOiXc_mA@mail.gmail.com>
References: <1389707618-17011-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-oa0-f45.google.com ([209.85.219.45]:43210 "EHLO
	mail-oa0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751362AbaAOJLC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 15 Jan 2014 04:11:02 -0500
Received: by mail-oa0-f45.google.com with SMTP id j17so895311oag.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jan 2014 01:11:01 -0800 (PST)
In-Reply-To: <1389707618-17011-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Ben Dooks <ben-linux@fluff.org>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <tomasz.figa@gmail.com>, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Mark Brown <broonie@kernel.org>

On 14 January 2014 19:23, Linus Walleij <linus.walleij@linaro.org> wrote:
> When refactoring and breaking out the includes for the
> machine-specific GPIO configuration, two files were created
> in <linux/platform_data/gpio-samsung-s3c[24|64]xx.h>, but as
> that namespace shall be used for defining data exchanged
> between machines and drivers, using it for these broad macros
> and config settings is wrong.
>
> Move the headers back into the machine-local
> <mach/gpio-samsung.h> file and think about the next step.
>

<snip>

> diff --git a/arch/arm/plat-samsung/pm-gpio.c b/arch/arm/plat-samsung/pm-gpio.c
> index c4efa1c2a5d1..a9f7a37c4173 100644
> --- a/arch/arm/plat-samsung/pm-gpio.c
> +++ b/arch/arm/plat-samsung/pm-gpio.c
> @@ -19,12 +19,7 @@
>  #include <linux/io.h>
>  #include <linux/gpio.h>
>
> -#ifdef CONFIG_ARCH_S3C24XX
> -#include <linux/platform_data/gpio-samsung-s3c24xx.h>
> -#endif
> -#ifdef CONFIG_ARCH_S3C64XX
> -#include <linux/platform_data/gpio-samsung-s3c64xx.h>
> -#endif
> +#include <mach/gpio-samsung.h>

This inclusion should be protected by a check for CONFIG_ARCH_S3C24XX
|| CONFIG_ARCH_S3C64XX. Currently generating build errors for
s5p64x0_defconfig, s5pc100_defconfig and s5pv210_defconfig on
next-20140115.

-- 
Tushar Behera
