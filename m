From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: GENERIC_GPIO considered deprecated
Date: Thu, 4 Apr 2013 11:12:26 -0700
Message-ID: <CAAVeFuJcAgFma6wxmyoUN4Kfp-+y-gj3QMWvVYsCK_D8q0gSXQ@mail.gmail.com>
References: <CAAVeFu+QUw1WmzwaJDfjyw75PrStd3p3PHs1MU5BC7_WXMB7kw@mail.gmail.com>
 <51576214.8010307@openwide.fr> <CAAVeFu++8YOOSxPbAaTudxSGcBomkGrakBjiVyD+XSee54TrWw@mail.gmail.com>
 <26e401ce30cc$602e45f0$208ad1d0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ia0-f169.google.com ([209.85.210.169]:40436 "EHLO
	mail-ia0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1764347Ab3DDSMr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Apr 2013 14:12:47 -0400
In-Reply-To: <26e401ce30cc$602e45f0$208ad1d0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Romain Naour <romain.naour@openwide.fr>, linux-next <linux-next@vger.kernel.org>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, linux-samsung-soc@vger.kernel.org

On Wed, Apr 3, 2013 at 5:35 PM, Kukjin Kim <kgene.kim@samsung.com> wrote:
>> could you amend the patches that adds them such as they get changed
>> into "select ARCH_REQUIRE_GPIOLIB" instead? You can grep for "select
>
> I can do it for my tree but the branch already included in arm-soc tree so I think, it should be fixed with another patch. And
>
>> GENERIC_GPIO" in arch/arm to find the offending lines. We are removing
>> GENERIC_GPIO and this work cannot be merged until you do this since it
>> would break ARM builds. Thanks!
>>
> So how about following? If you are OK, let me take into samsung tree.
>
> --------8<----------------8<--------
> From: Kukjin Kim <kgene.kim@samsung.com>
> Subject: [PATCH] ARM: SAMSUNG: change GENERIC_GPIO to ARCH_REQUIRE_GPIOLIB
>
> When I applied regarding samsung-time patches, the "select GENERIC_GPIO"
> has been added wrong, so this patch fixes that.
> And since the GENERIC_GPIO in arch/arm/ will be gone away, this adds
> ARCH_REQUIRE_GPIOLIB for S3C24XX and S5PC100 instead.
>
> Reported-by: Alexandre Courbot <gnurou@gmail.com>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/Kconfig |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 46fcfa8..a239c7e 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -770,10 +770,10 @@ config ARCH_SA1100
>  config ARCH_S3C24XX
>         bool "Samsung S3C24XX SoCs"
>         select ARCH_HAS_CPUFREQ
> +       select ARCH_REQUIRE_GPIOLIB
>         select CLKDEV_LOOKUP
>         select CLKSRC_MMIO
>         select GENERIC_CLOCKEVENTS
> -       select GENERIC_GPIO
>         select HAVE_CLK
>         select HAVE_S3C2410_I2C if I2C
>         select HAVE_S3C2410_WATCHDOG if WATCHDOG
> @@ -828,11 +828,11 @@ config ARCH_S5P64X0
>
>  config ARCH_S5PC100
>         bool "Samsung S5PC100"
> +       select ARCH_REQUIRE_GPIOLIB
>         select CLKDEV_LOOKUP
>         select CLKSRC_MMIO
>         select CPU_V7
>         select GENERIC_CLOCKEVENTS
> -       select GENERIC_GPIO
>         select HAVE_CLK
>         select HAVE_S3C2410_I2C if I2C
>         select HAVE_S3C2410_WATCHDOG if WATCHDOG
> --
> 1.7.10.4

Should do the trick, if we can make sure that your tree is merged
prior to my patches. Can you put it into your tree for 3.10?

Thanks!
Alex.
