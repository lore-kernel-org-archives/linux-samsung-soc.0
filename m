From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix on inclusion mach/gpio.h for Samsung
	SoCs
Date: Thu, 5 Aug 2010 08:38:15 +0900
Message-ID: <AANLkTi=tW4cFwLBDV9znHABqkOTKRJtjo+RC8bjKk_jG@mail.gmail.com>
References: <1280963229-3501-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:54358 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754213Ab0HDXiU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 4 Aug 2010 19:38:20 -0400
Received: by wyb39 with SMTP id 39so6071648wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Aug 2010 16:38:18 -0700 (PDT)
In-Reply-To: <1280963229-3501-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

On Thu, Aug 5, 2010 at 8:07 AM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> This patch fixes on inclusion <mach/gpio.h> to <linux/gpio.h>.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> ---
> =A0arch/arm/mach-s3c64xx/dev-audio.c =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s3c64xx/dev-spi.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s3c64xx/gpiolib.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s3c64xx/setup-fb-24bpp.c =A0 | =A0 =A02 +-
> =A0arch/arm/mach-s3c64xx/setup-i2c0.c =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/arm/mach-s3c64xx/setup-i2c1.c =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/arm/mach-s3c64xx/setup-sdhci-gpio.c | =A0 =A02 +-
> =A0arch/arm/mach-s5p6440/dev-audio.c =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5p6440/dev-spi.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5p6440/gpio.c =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A04 ++=
+-
> =A0arch/arm/mach-s5p6442/dev-audio.c =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5p6442/dev-spi.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5pc100/dev-audio.c =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5pc100/dev-spi.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5pv210/dev-audio.c =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5pv210/dev-spi.c =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5pv210/setup-fb-24bpp.c =A0 | =A0 =A02 +-
> =A0arch/arm/mach-s5pv210/setup-i2c0.c =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/arm/mach-s5pv210/setup-i2c1.c =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/arm/mach-s5pv210/setup-i2c2.c =A0 =A0 =A0 | =A0 =A02 +-
> =A0arch/arm/mach-s5pv210/setup-sdhci-gpio.c | =A0 =A02 +-
> =A021 files changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm/mach-s3c64xx/dev-audio.c b/arch/arm/mach-s3c64x=
x/dev-audio.c
> index c3e9e73..9648fbc 100644
> --- a/arch/arm/mach-s3c64xx/dev-audio.c
> +++ b/arch/arm/mach-s3c64xx/dev-audio.c
> @@ -12,11 +12,11 @@
> =A0#include <linux/string.h>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
>
> =A0#include <mach/irqs.h>
> =A0#include <mach/map.h>
> =A0#include <mach/dma.h>
> -#include <mach/gpio.h>
>
> =A0#include <plat/devs.h>
> =A0#include <plat/audio.h>
> diff --git a/arch/arm/mach-s3c64xx/dev-spi.c b/arch/arm/mach-s3c64xx/=
dev-spi.c
> index 29c32d0..a492b98 100644
> --- a/arch/arm/mach-s3c64xx/dev-spi.c
> +++ b/arch/arm/mach-s3c64xx/dev-spi.c
> @@ -12,10 +12,10 @@
> =A0#include <linux/string.h>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
>
> =A0#include <mach/dma.h>
> =A0#include <mach/map.h>
> -#include <mach/gpio.h>
> =A0#include <mach/gpio-bank-c.h>
> =A0#include <mach/spi-clocks.h>
>
> diff --git a/arch/arm/mach-s3c64xx/gpiolib.c b/arch/arm/mach-s3c64xx/=
gpiolib.c
> index 60c929a..300dee4 100644
> --- a/arch/arm/mach-s3c64xx/gpiolib.c
> +++ b/arch/arm/mach-s3c64xx/gpiolib.c
> @@ -15,9 +15,9 @@
> =A0#include <linux/kernel.h>
> =A0#include <linux/irq.h>
> =A0#include <linux/io.h>
> +#include <linux/gpio.h>
>
> =A0#include <mach/map.h>
> -#include <mach/gpio.h>
>
> =A0#include <plat/gpio-core.h>
> =A0#include <plat/gpio-cfg.h>
> diff --git a/arch/arm/mach-s3c64xx/setup-fb-24bpp.c b/arch/arm/mach-s=
3c64xx/setup-fb-24bpp.c
> index 8e28e44..0007368 100644
> --- a/arch/arm/mach-s3c64xx/setup-fb-24bpp.c
> +++ b/arch/arm/mach-s3c64xx/setup-fb-24bpp.c
> @@ -15,9 +15,9 @@
> =A0#include <linux/kernel.h>
> =A0#include <linux/types.h>
> =A0#include <linux/fb.h>
> +#include <linux/gpio.h>
>
> =A0#include <mach/regs-fb.h>
> -#include <mach/gpio.h>
> =A0#include <plat/fb.h>
> =A0#include <plat/gpio-cfg.h>
>
> diff --git a/arch/arm/mach-s3c64xx/setup-i2c0.c b/arch/arm/mach-s3c64=
xx/setup-i2c0.c
> index d1b11e6..406192a 100644
> --- a/arch/arm/mach-s3c64xx/setup-i2c0.c
> +++ b/arch/arm/mach-s3c64xx/setup-i2c0.c
> @@ -14,10 +14,10 @@
>
> =A0#include <linux/kernel.h>
> =A0#include <linux/types.h>
> +#include <linux/gpio.h>
>
> =A0struct platform_device; /* don't need the contents */
>
> -#include <mach/gpio.h>
> =A0#include <mach/gpio-bank-b.h>
> =A0#include <plat/iic.h>
> =A0#include <plat/gpio-cfg.h>
> diff --git a/arch/arm/mach-s3c64xx/setup-i2c1.c b/arch/arm/mach-s3c64=
xx/setup-i2c1.c
> index 2dce57d..1ee62c9 100644
> --- a/arch/arm/mach-s3c64xx/setup-i2c1.c
> +++ b/arch/arm/mach-s3c64xx/setup-i2c1.c
> @@ -14,10 +14,10 @@
>
> =A0#include <linux/kernel.h>
> =A0#include <linux/types.h>
> +#include <linux/gpio.h>
>
> =A0struct platform_device; /* don't need the contents */
>
> -#include <mach/gpio.h>
> =A0#include <mach/gpio-bank-b.h>
> =A0#include <plat/iic.h>
> =A0#include <plat/gpio-cfg.h>
> diff --git a/arch/arm/mach-s3c64xx/setup-sdhci-gpio.c b/arch/arm/mach=
-s3c64xx/setup-sdhci-gpio.c
> index a58c0cc..dcf37e2 100644
> --- a/arch/arm/mach-s3c64xx/setup-sdhci-gpio.c
> +++ b/arch/arm/mach-s3c64xx/setup-sdhci-gpio.c
> @@ -16,8 +16,8 @@
> =A0#include <linux/interrupt.h>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/io.h>
> +#include <linux/gpio.h>
>
> -#include <mach/gpio.h>
> =A0#include <plat/gpio-cfg.h>
> =A0#include <plat/sdhci.h>
>
> diff --git a/arch/arm/mach-s5p6440/dev-audio.c b/arch/arm/mach-s5p644=
0/dev-audio.c
> index 0c53679..3ca0d2b 100644
> --- a/arch/arm/mach-s5p6440/dev-audio.c
> +++ b/arch/arm/mach-s5p6440/dev-audio.c
> @@ -10,11 +10,11 @@
>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
>
> =A0#include <plat/gpio-cfg.h>
> =A0#include <plat/audio.h>
>
> -#include <mach/gpio.h>
> =A0#include <mach/map.h>
> =A0#include <mach/dma.h>
> =A0#include <mach/irqs.h>
> diff --git a/arch/arm/mach-s5p6440/dev-spi.c b/arch/arm/mach-s5p6440/=
dev-spi.c
> index 0a30280..510af44 100644
> --- a/arch/arm/mach-s5p6440/dev-spi.c
> +++ b/arch/arm/mach-s5p6440/dev-spi.c
> @@ -10,11 +10,11 @@
>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
>
> =A0#include <mach/dma.h>
> =A0#include <mach/map.h>
> =A0#include <mach/irqs.h>
> -#include <mach/gpio.h>
> =A0#include <mach/spi-clocks.h>
>
> =A0#include <plat/s3c64xx-spi.h>
> diff --git a/arch/arm/mach-s5p6440/gpio.c b/arch/arm/mach-s5p6440/gpi=
o.c
> index 92efc05..8bf6e0c 100644
> --- a/arch/arm/mach-s5p6440/gpio.c
> +++ b/arch/arm/mach-s5p6440/gpio.c
> @@ -13,9 +13,11 @@
> =A0#include <linux/kernel.h>
> =A0#include <linux/irq.h>
> =A0#include <linux/io.h>
> +#include <linux/gpio.h>
> +
> =A0#include <mach/map.h>
> -#include <mach/gpio.h>
> =A0#include <mach/regs-gpio.h>
> +
> =A0#include <plat/gpio-core.h>
> =A0#include <plat/gpio-cfg.h>
> =A0#include <plat/gpio-cfg-helpers.h>
> diff --git a/arch/arm/mach-s5p6442/dev-audio.c b/arch/arm/mach-s5p644=
2/dev-audio.c
> index cb801e1..7a4e347 100644
> --- a/arch/arm/mach-s5p6442/dev-audio.c
> +++ b/arch/arm/mach-s5p6442/dev-audio.c
> @@ -10,11 +10,11 @@
>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
>
> =A0#include <plat/gpio-cfg.h>
> =A0#include <plat/audio.h>
>
> -#include <mach/gpio.h>
> =A0#include <mach/map.h>
> =A0#include <mach/dma.h>
> =A0#include <mach/irqs.h>
> diff --git a/arch/arm/mach-s5p6442/dev-spi.c b/arch/arm/mach-s5p6442/=
dev-spi.c
> index 3019952..e894651 100644
> --- a/arch/arm/mach-s5p6442/dev-spi.c
> +++ b/arch/arm/mach-s5p6442/dev-spi.c
> @@ -10,11 +10,11 @@
>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
>
> =A0#include <mach/dma.h>
> =A0#include <mach/map.h>
> =A0#include <mach/irqs.h>
> -#include <mach/gpio.h>
> =A0#include <mach/spi-clocks.h>
>
> =A0#include <plat/s3c64xx-spi.h>
> diff --git a/arch/arm/mach-s5pc100/dev-audio.c b/arch/arm/mach-s5pc10=
0/dev-audio.c
> index 18cfe9a..a699ed6 100644
> --- a/arch/arm/mach-s5pc100/dev-audio.c
> +++ b/arch/arm/mach-s5pc100/dev-audio.c
> @@ -10,11 +10,11 @@
>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
>
> =A0#include <plat/gpio-cfg.h>
> =A0#include <plat/audio.h>
>
> -#include <mach/gpio.h>
> =A0#include <mach/map.h>
> =A0#include <mach/dma.h>
> =A0#include <mach/irqs.h>
> diff --git a/arch/arm/mach-s5pc100/dev-spi.c b/arch/arm/mach-s5pc100/=
dev-spi.c
> index 14618c3..a0ef7c3 100644
> --- a/arch/arm/mach-s5pc100/dev-spi.c
> +++ b/arch/arm/mach-s5pc100/dev-spi.c
> @@ -10,10 +10,10 @@
>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
>
> =A0#include <mach/dma.h>
> =A0#include <mach/map.h>
> -#include <mach/gpio.h>
> =A0#include <mach/spi-clocks.h>
>
> =A0#include <plat/s3c64xx-spi.h>
> diff --git a/arch/arm/mach-s5pv210/dev-audio.c b/arch/arm/mach-s5pv21=
0/dev-audio.c
> index 6e21533..21dc6cf 100644
> --- a/arch/arm/mach-s5pv210/dev-audio.c
> +++ b/arch/arm/mach-s5pv210/dev-audio.c
> @@ -10,11 +10,11 @@
>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
>
> =A0#include <plat/gpio-cfg.h>
> =A0#include <plat/audio.h>
>
> -#include <mach/gpio.h>
> =A0#include <mach/map.h>
> =A0#include <mach/dma.h>
> =A0#include <mach/irqs.h>
> diff --git a/arch/arm/mach-s5pv210/dev-spi.c b/arch/arm/mach-s5pv210/=
dev-spi.c
> index 337a62b..826cdbc 100644
> --- a/arch/arm/mach-s5pv210/dev-spi.c
> +++ b/arch/arm/mach-s5pv210/dev-spi.c
> @@ -10,11 +10,11 @@
>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
>
> =A0#include <mach/dma.h>
> =A0#include <mach/map.h>
> =A0#include <mach/irqs.h>
> -#include <mach/gpio.h>
> =A0#include <mach/spi-clocks.h>
>
> =A0#include <plat/s3c64xx-spi.h>
> diff --git a/arch/arm/mach-s5pv210/setup-fb-24bpp.c b/arch/arm/mach-s=
5pv210/setup-fb-24bpp.c
> index a50cbac..928cf1f 100644
> --- a/arch/arm/mach-s5pv210/setup-fb-24bpp.c
> +++ b/arch/arm/mach-s5pv210/setup-fb-24bpp.c
> @@ -13,9 +13,9 @@
> =A0#include <linux/kernel.h>
> =A0#include <linux/types.h>
> =A0#include <linux/fb.h>
> +#include <linux/gpio.h>
>
> =A0#include <mach/regs-fb.h>
> -#include <mach/gpio.h>
> =A0#include <mach/map.h>
> =A0#include <plat/fb.h>
> =A0#include <mach/regs-clock.h>
> diff --git a/arch/arm/mach-s5pv210/setup-i2c0.c b/arch/arm/mach-s5pv2=
10/setup-i2c0.c
> index c718253..d38f7cb 100644
> --- a/arch/arm/mach-s5pv210/setup-i2c0.c
> +++ b/arch/arm/mach-s5pv210/setup-i2c0.c
> @@ -14,10 +14,10 @@
>
> =A0#include <linux/kernel.h>
> =A0#include <linux/types.h>
> +#include <linux/gpio.h>
>
> =A0struct platform_device; /* don't need the contents */
>
> -#include <mach/gpio.h>
> =A0#include <plat/iic.h>
> =A0#include <plat/gpio-cfg.h>
>
> diff --git a/arch/arm/mach-s5pv210/setup-i2c1.c b/arch/arm/mach-s5pv2=
10/setup-i2c1.c
> index 45e0e6e..148bb78 100644
> --- a/arch/arm/mach-s5pv210/setup-i2c1.c
> +++ b/arch/arm/mach-s5pv210/setup-i2c1.c
> @@ -14,10 +14,10 @@
>
> =A0#include <linux/kernel.h>
> =A0#include <linux/types.h>
> +#include <linux/gpio.h>
>
> =A0struct platform_device; /* don't need the contents */
>
> -#include <mach/gpio.h>
> =A0#include <plat/iic.h>
> =A0#include <plat/gpio-cfg.h>
>
> diff --git a/arch/arm/mach-s5pv210/setup-i2c2.c b/arch/arm/mach-s5pv2=
10/setup-i2c2.c
> index b11b4bf..2396cb8 100644
> --- a/arch/arm/mach-s5pv210/setup-i2c2.c
> +++ b/arch/arm/mach-s5pv210/setup-i2c2.c
> @@ -14,10 +14,10 @@
>
> =A0#include <linux/kernel.h>
> =A0#include <linux/types.h>
> +#include <linux/gpio.h>
>
> =A0struct platform_device; /* don't need the contents */
>
> -#include <mach/gpio.h>
> =A0#include <plat/iic.h>
> =A0#include <plat/gpio-cfg.h>
>
> diff --git a/arch/arm/mach-s5pv210/setup-sdhci-gpio.c b/arch/arm/mach=
-s5pv210/setup-sdhci-gpio.c
> index fe7d86d..6b73e71 100644
> --- a/arch/arm/mach-s5pv210/setup-sdhci-gpio.c
> +++ b/arch/arm/mach-s5pv210/setup-sdhci-gpio.c
> @@ -15,10 +15,10 @@
> =A0#include <linux/interrupt.h>
> =A0#include <linux/platform_device.h>
> =A0#include <linux/io.h>
> +#include <linux/gpio.h>
> =A0#include <linux/mmc/host.h>
> =A0#include <linux/mmc/card.h>
>
> -#include <mach/gpio.h>
> =A0#include <plat/gpio-cfg.h>
> =A0#include <plat/regs-sdhci.h>
> =A0#include <plat/sdhci.h>
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
