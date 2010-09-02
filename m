From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 07/13] ARM: S5P64X0: Update Audio support
Date: Thu, 2 Sep 2010 10:44:37 +0900
Message-ID: <AANLkTin=fmeRZt=SSrxk9YzrhZs1nLxc9M30PYO3ONEb@mail.gmail.com>
References: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
	<1283324960-21629-8-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:42563 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752566Ab0IBBoj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 21:44:39 -0400
Received: by wyb35 with SMTP id 35so9973566wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Sep 2010 18:44:37 -0700 (PDT)
In-Reply-To: <1283324960-21629-8-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Jassi Brar <jassi.brar@samsung.com>, ben-linux@fluff.org

On Wed, Sep 1, 2010 at 4:09 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> This patch updates Audio and SPI for S5P6440 and S5P6450 SoCs.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Jassi Brar <jassi.brar@samsung.com>
> ---
> =C2=A0arch/arm/mach-s5p6440/dev-audio.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0127 -----------
> =C2=A0arch/arm/mach-s5p6440/dev-spi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0176 ---------------
> =C2=A0arch/arm/mach-s5p6440/include/mach/spi-clocks.h | =C2=A0 17 --
> =C2=A0arch/arm/mach-s5p64x0/dev-audio.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0164 ++++++++++++++
> =C2=A0arch/arm/mach-s5p64x0/dev-spi.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0275 +++++++++++++++++++++++
> =C2=A0arch/arm/mach-s5p64x0/include/mach/spi-clocks.h | =C2=A0 20 ++
> =C2=A0arch/arm/plat-samsung/include/plat/devs.h =C2=A0 =C2=A0 =C2=A0 =
| =C2=A0 =C2=A05 +
> =C2=A07 files changed, 464 insertions(+), 320 deletions(-)
> =C2=A0delete mode 100644 arch/arm/mach-s5p6440/dev-audio.c
> =C2=A0delete mode 100644 arch/arm/mach-s5p6440/dev-spi.c
> =C2=A0delete mode 100644 arch/arm/mach-s5p6440/include/mach/spi-clock=
s.h
> =C2=A0create mode 100644 arch/arm/mach-s5p64x0/dev-audio.c
> =C2=A0create mode 100644 arch/arm/mach-s5p64x0/dev-spi.c
> =C2=A0create mode 100644 arch/arm/mach-s5p64x0/include/mach/spi-clock=
s.h
>
> diff --git a/arch/arm/mach-s5p6440/dev-audio.c b/arch/arm/mach-s5p644=
0/dev-audio.c
> deleted file mode 100644
> index 3ca0d2b..0000000
> --- a/arch/arm/mach-s5p6440/dev-audio.c
> +++ /dev/null
> @@ -1,127 +0,0 @@
> -/* linux/arch/arm/mach-s5p6440/dev-audio.c
> - *
> - * Copyright (c) 2010 Samsung Electronics Co. Ltd
> - * =C2=A0 =C2=A0 Jaswinder Singh <jassi.brar@samsung.com>
> - *
> - * This program is free software; you can redistribute it and/or mod=
ify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - */
> -
> -#include <linux/platform_device.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/gpio.h>
> -
> -#include <plat/gpio-cfg.h>
> -#include <plat/audio.h>
> -
> -#include <mach/map.h>
> -#include <mach/dma.h>
> -#include <mach/irqs.h>
> -
> -static int s5p6440_cfg_i2s(struct platform_device *pdev)
> -{
> - =C2=A0 =C2=A0 =C2=A0 /* configure GPIO for i2s port */
> - =C2=A0 =C2=A0 =C2=A0 switch (pdev->id) {
> - =C2=A0 =C2=A0 =C2=A0 case -1:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(4), S3C_GPIO_SFN(5));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(5), S3C_GPIO_SFN(5));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(6), S3C_GPIO_SFN(5));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(7), S3C_GPIO_SFN(5));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(8), S3C_GPIO_SFN(5));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(13), S3C_GPIO_SFN(5));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(14), S3C_GPIO_SFN(5));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> -
> - =C2=A0 =C2=A0 =C2=A0 default:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "I=
nvalid Device %d\n", pdev->id);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 return 0;
> -}
> -
> -static struct s3c_audio_pdata s3c_i2s_pdata =3D {
> - =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =3D s5p6440_cfg_i2s,
> -};
> -
> -static struct resource s5p6440_iis0_resource[] =3D {
> - =C2=A0 =C2=A0 =C2=A0 [0] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D S5P6440=
_PA_I2S,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D S5=
P6440_PA_I2S + 0x100 - 1,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_MEM,
> - =C2=A0 =C2=A0 =C2=A0 },
> - =C2=A0 =C2=A0 =C2=A0 [1] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D DMACH_I=
2S0_TX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D DM=
ACH_I2S0_TX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_DMA,
> - =C2=A0 =C2=A0 =C2=A0 },
> - =C2=A0 =C2=A0 =C2=A0 [2] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D DMACH_I=
2S0_RX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D DM=
ACH_I2S0_RX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_DMA,
> - =C2=A0 =C2=A0 =C2=A0 },
> -};
> -
> -struct platform_device s5p6440_device_iis =3D {
> - =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D "s3c64xx-iis-v4",
> - =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D -1,
> - =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0 =C2=A0=3D ARRAY_SIZE(s5p=
6440_iis0_resource),
> - =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s5p6=
440_iis0_resource,
> - =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s3c_i2s_pdata,
> - =C2=A0 =C2=A0 =C2=A0 },
> -};
> -
> -/* PCM Controller platform_devices */
> -
> -static int s5p6440_pcm_cfg_gpio(struct platform_device *pdev)
> -{
> - =C2=A0 =C2=A0 =C2=A0 switch (pdev->id) {
> - =C2=A0 =C2=A0 =C2=A0 case 0:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(7), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(13), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(14), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(8), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(6), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> -
> - =C2=A0 =C2=A0 =C2=A0 default:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_DEBUG =
"Invalid PCM Controller number!");
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 return 0;
> -}
> -
> -static struct s3c_audio_pdata s3c_pcm_pdata =3D {
> - =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =3D s5p6440_pcm_cfg_gpio,
> -};
> -
> -static struct resource s5p6440_pcm0_resource[] =3D {
> - =C2=A0 =C2=A0 =C2=A0 [0] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D S5P6440=
_PA_PCM,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D S5=
P6440_PA_PCM + 0x100 - 1,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_MEM,
> - =C2=A0 =C2=A0 =C2=A0 },
> - =C2=A0 =C2=A0 =C2=A0 [1] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D DMACH_P=
CM0_TX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D DM=
ACH_PCM0_TX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_DMA,
> - =C2=A0 =C2=A0 =C2=A0 },
> - =C2=A0 =C2=A0 =C2=A0 [2] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D DMACH_P=
CM0_RX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D DM=
ACH_PCM0_RX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_DMA,
> - =C2=A0 =C2=A0 =C2=A0 },
> -};
> -
> -struct platform_device s5p6440_device_pcm =3D {
> - =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D "samsung-pcm",
> - =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D 0,
> - =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0 =C2=A0=3D ARRAY_SIZE(s5p=
6440_pcm0_resource),
> - =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s5p6=
440_pcm0_resource,
> - =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s3c_pcm_pdata,
> - =C2=A0 =C2=A0 =C2=A0 },
> -};
> diff --git a/arch/arm/mach-s5p6440/dev-spi.c b/arch/arm/mach-s5p6440/=
dev-spi.c
> deleted file mode 100644
> index 510af44..0000000
> --- a/arch/arm/mach-s5p6440/dev-spi.c
> +++ /dev/null
> @@ -1,176 +0,0 @@
> -/* linux/arch/arm/mach-s5p6440/dev-spi.c
> - *
> - * Copyright (C) 2010 Samsung Electronics Co. Ltd.
> - * =C2=A0 =C2=A0 Jaswinder Singh <jassi.brar@samsung.com>
> - *
> - * This program is free software; you can redistribute it and/or mod=
ify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - */
> -
> -#include <linux/platform_device.h>
> -#include <linux/dma-mapping.h>
> -#include <linux/gpio.h>
> -
> -#include <mach/dma.h>
> -#include <mach/map.h>
> -#include <mach/irqs.h>
> -#include <mach/spi-clocks.h>
> -
> -#include <plat/s3c64xx-spi.h>
> -#include <plat/gpio-cfg.h>
> -
> -static char *spi_src_clks[] =3D {
> - =C2=A0 =C2=A0 =C2=A0 [S5P6440_SPI_SRCCLK_PCLK] =3D "pclk",
> - =C2=A0 =C2=A0 =C2=A0 [S5P6440_SPI_SRCCLK_SCLK] =3D "spi_epll",
> -};
> -
> -/* SPI Controller platform_devices */
> -
> -/* Since we emulate multi-cs capability, we do not touch the CS.
> - * The emulated CS is toggled by board specific mechanism, as it can
> - * be either some immediate GPIO or some signal out of some other
> - * chip in between ... or some yet another way.
> - * We simply do not assume anything about CS.
> - */
> -static int s5p6440_spi_cfg_gpio(struct platform_device *pdev)
> -{
> - =C2=A0 =C2=A0 =C2=A0 switch (pdev->id) {
> - =C2=A0 =C2=A0 =C2=A0 case 0:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(0), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(1), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(2), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(0), S3C_GPIO_PULL_UP);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(1), S3C_GPIO_PULL_UP);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(2), S3C_GPIO_PULL_UP);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> -
> - =C2=A0 =C2=A0 =C2=A0 case 1:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(4), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(5), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(6), S3C_GPIO_SFN(2));
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(4), S3C_GPIO_PULL_UP);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(5), S3C_GPIO_PULL_UP);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(6), S3C_GPIO_PULL_UP);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> -
> - =C2=A0 =C2=A0 =C2=A0 default:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "Invalid SPI Controller number!");
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 return 0;
> -}
> -
> -static struct resource s5p6440_spi0_resource[] =3D {
> - =C2=A0 =C2=A0 =C2=A0 [0] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D S5P6440=
_PA_SPI0,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D S5=
P6440_PA_SPI0 + 0x100 - 1,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_MEM,
> - =C2=A0 =C2=A0 =C2=A0 },
> - =C2=A0 =C2=A0 =C2=A0 [1] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D DMACH_S=
PI0_TX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D DM=
ACH_SPI0_TX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_DMA,
> - =C2=A0 =C2=A0 =C2=A0 },
> - =C2=A0 =C2=A0 =C2=A0 [2] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D DMACH_S=
PI0_RX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D DM=
ACH_SPI0_RX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_DMA,
> - =C2=A0 =C2=A0 =C2=A0 },
> - =C2=A0 =C2=A0 =C2=A0 [3] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D IRQ_SPI=
0,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D IR=
Q_SPI0,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_IRQ,
> - =C2=A0 =C2=A0 =C2=A0 },
> -};
> -
> -static struct s3c64xx_spi_info s5p6440_spi0_pdata =3D {
> - =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =3D s5p6440_spi_cfg_gpio,
> - =C2=A0 =C2=A0 =C2=A0 .fifo_lvl_mask =3D 0x1ff,
> - =C2=A0 =C2=A0 =C2=A0 .rx_lvl_offset =3D 15,
> -};
> -
> -static u64 spi_dmamask =3D DMA_BIT_MASK(32);
> -
> -struct platform_device s5p6440_device_spi0 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D "s3c64xx-spi",
> - =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D 0,
> - =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0 =C2=A0=3D ARRAY_SIZE(s5p=
6440_spi0_resource),
> - =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s5p6=
440_spi0_resource,
> - =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .dma_mask =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &spi_dmamask,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .coherent_dma_mask=
 =C2=A0 =C2=A0 =C2=A0=3D DMA_BIT_MASK(32),
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s5p6440_spi0_pdata,
> - =C2=A0 =C2=A0 =C2=A0 },
> -};
> -
> -static struct resource s5p6440_spi1_resource[] =3D {
> - =C2=A0 =C2=A0 =C2=A0 [0] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D S5P6440=
_PA_SPI1,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D S5=
P6440_PA_SPI1 + 0x100 - 1,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_MEM,
> - =C2=A0 =C2=A0 =C2=A0 },
> - =C2=A0 =C2=A0 =C2=A0 [1] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D DMACH_S=
PI1_TX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D DM=
ACH_SPI1_TX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_DMA,
> - =C2=A0 =C2=A0 =C2=A0 },
> - =C2=A0 =C2=A0 =C2=A0 [2] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D DMACH_S=
PI1_RX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D DM=
ACH_SPI1_RX,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_DMA,
> - =C2=A0 =C2=A0 =C2=A0 },
> - =C2=A0 =C2=A0 =C2=A0 [3] =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =3D IRQ_SPI=
1,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =3D IR=
Q_SPI1,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =3D IORESOU=
RCE_IRQ,
> - =C2=A0 =C2=A0 =C2=A0 },
> -};
> -
> -static struct s3c64xx_spi_info s5p6440_spi1_pdata =3D {
> - =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =3D s5p6440_spi_cfg_gpio,
> - =C2=A0 =C2=A0 =C2=A0 .fifo_lvl_mask =3D 0x7f,
> - =C2=A0 =C2=A0 =C2=A0 .rx_lvl_offset =3D 15,
> -};
> -
> -struct platform_device s5p6440_device_spi1 =3D {
> - =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =3D "s3c64xx-spi",
> - =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =3D 1,
> - =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0 =C2=A0=3D ARRAY_SIZE(s5p=
6440_spi1_resource),
> - =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D s5p6=
440_spi1_resource,
> - =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .dma_mask =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &spi_dmamask,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .coherent_dma_mask=
 =C2=A0 =C2=A0 =C2=A0=3D DMA_BIT_MASK(32),
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s5p6440_spi1_pdata,
> - =C2=A0 =C2=A0 =C2=A0 },
> -};
> -
> -void __init s5p6440_spi_set_info(int cntrlr, int src_clk_nr, int num=
_cs)
> -{
> - =C2=A0 =C2=A0 =C2=A0 struct s3c64xx_spi_info *pd;
> -
> - =C2=A0 =C2=A0 =C2=A0 /* Reject invalid configuration */
> - =C2=A0 =C2=A0 =C2=A0 if (!num_cs || src_clk_nr < 0
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 || src_clk_nr > S5P6440_SPI_SRCCLK_SCLK) {
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%=
s: Invalid SPI configuration\n", __func__);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 switch (cntrlr) {
> - =C2=A0 =C2=A0 =C2=A0 case 0:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pd =3D &s5p6440_sp=
i0_pdata;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> - =C2=A0 =C2=A0 =C2=A0 case 1:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pd =3D &s5p6440_sp=
i1_pdata;
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> - =C2=A0 =C2=A0 =C2=A0 default:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%=
s: Invalid SPI controller(%d)\n",
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, cntrlr);
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> - =C2=A0 =C2=A0 =C2=A0 }
> -
> - =C2=A0 =C2=A0 =C2=A0 pd->num_cs =3D num_cs;
> - =C2=A0 =C2=A0 =C2=A0 pd->src_clk_nr =3D src_clk_nr;
> - =C2=A0 =C2=A0 =C2=A0 pd->src_clk_name =3D spi_src_clks[src_clk_nr];
> -}
> diff --git a/arch/arm/mach-s5p6440/include/mach/spi-clocks.h b/arch/a=
rm/mach-s5p6440/include/mach/spi-clocks.h
> deleted file mode 100644
> index 5fbca50..0000000
> --- a/arch/arm/mach-s5p6440/include/mach/spi-clocks.h
> +++ /dev/null
> @@ -1,17 +0,0 @@
> -/* linux/arch/arm/mach-s5p6440/include/mach/spi-clocks.h
> - *
> - * Copyright (C) 2010 Samsung Electronics Co. Ltd.
> - * =C2=A0 =C2=A0 Jaswinder Singh <jassi.brar@samsung.com>
> - *
> - * This program is free software; you can redistribute it and/or mod=
ify
> - * it under the terms of the GNU General Public License version 2 as
> - * published by the Free Software Foundation.
> - */
> -
> -#ifndef __S5P6440_PLAT_SPI_CLKS_H
> -#define __S5P6440_PLAT_SPI_CLKS_H __FILE__
> -
> -#define S5P6440_SPI_SRCCLK_PCLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00
> -#define S5P6440_SPI_SRCCLK_SCLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A01
> -
> -#endif /* __S5P6440_PLAT_SPI_CLKS_H */
> diff --git a/arch/arm/mach-s5p64x0/dev-audio.c b/arch/arm/mach-s5p64x=
0/dev-audio.c
> new file mode 100644
> index 0000000..ac7cfce
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/dev-audio.c
> @@ -0,0 +1,164 @@
> +/* linux/arch/arm/mach-s5p64x0/dev-audio.c
> + *
> + * Copyright (c) 2010 Samsung Electronics Co. Ltd
> + * =C2=A0 =C2=A0 Jaswinder Singh <jassi.brar@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
> +
> +#include <plat/gpio-cfg.h>
> +#include <plat/audio.h>
> +
> +#include <mach/map.h>
> +#include <mach/dma.h>
> +#include <mach/irqs.h>
> +
> +static int s5p6440_cfg_i2s(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 /* configure GPIO for i2s port */
> + =C2=A0 =C2=A0 =C2=A0 switch (pdev->id) {
> + =C2=A0 =C2=A0 =C2=A0 case -1:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(4), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(5), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(6), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(7), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(8), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(13), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(14), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> +
> + =C2=A0 =C2=A0 =C2=A0 default:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "I=
nvalid Device %d\n", pdev->id);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static int s5p6450_cfg_i2s(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 /* configure GPIO for i2s port */
> + =C2=A0 =C2=A0 =C2=A0 switch (pdev->id) {
> + =C2=A0 =C2=A0 =C2=A0 case -1:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPB(4), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPR(4), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPR(5), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPR(6), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPR(7), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPR(8), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPR(13), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPR(14), S3C_GPIO_SFN(5));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> +
> + =C2=A0 =C2=A0 =C2=A0 default:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "I=
nvalid Device %d\n", pdev->id);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}

S5P6450 has 2 I2S_v2 and 1 I2S_v4, the first two are missing.
Also missing are 3 PCM device definitions.


> +
> +static struct s3c_audio_pdata s5p6440_i2s_pdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =3D s5p6440_cfg_i2s,
> +};
> +
> +static struct s3c_audio_pdata s5p6450_i2s_pdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =3D s5p6450_cfg_i2s,
> +};
> +
> +static struct resource s5p64x0_iis0_resource[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 [0] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D S=
5P64X0_PA_I2S,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D S5P64X0_PA_I2S + 0x100 - 1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_MEM,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 [1] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D D=
MACH_I2S0_TX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D DMACH_I2S0_TX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_DMA,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 [2] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D D=
MACH_I2S0_RX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D DMACH_I2S0_RX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_DMA,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +struct platform_device s5p6440_device_iis =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "=
s3c64x0-iis-v4",

The assigned name is wrong. It should be "s3c64xx-iis-v4"


> + =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D -1,
> + =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0=3D ARRAY_SIZE(s5p64x0_ii=
s0_resource),
> + =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =3D s5p64x0_iis=
0_resource,
> + =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s5p6440_i2s_pdata,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +struct platform_device s5p6450_device_iis0 =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "=
s3c64x0-iis-v4",

The assigned name is wrong. It should be "s3c64xx-iis-v4"

> + =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D -1,
> + =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0=3D ARRAY_SIZE(s5p64x0_ii=
s0_resource),
> + =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =3D s5p64x0_iis=
0_resource,
> + =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s5p6450_i2s_pdata,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +/* PCM Controller platform_devices */
> +
> +static int s5p6440_pcm_cfg_gpio(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 switch (pdev->id) {
> + =C2=A0 =C2=A0 =C2=A0 case 0:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(7), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(13), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(14), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(8), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPR(6), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> +
> + =C2=A0 =C2=A0 =C2=A0 default:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_DEBUG =
"Invalid PCM Controller number!");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static struct s3c_audio_pdata s5p6440_pcm_pdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =3D s5p6440_pcm_cfg_gpio,
> +};
> +
> +static struct resource s5p6440_pcm0_resource[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 [0] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D S=
5P64X0_PA_PCM,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D S5P64X0_PA_PCM + 0x100 - 1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_MEM,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 [1] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D D=
MACH_PCM0_TX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D DMACH_PCM0_TX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_DMA,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 [2] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D D=
MACH_PCM0_RX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D DMACH_PCM0_RX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_DMA,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +struct platform_device s5p6440_device_pcm =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "=
samsung-pcm",
> + =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 0,
> + =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0=3D ARRAY_SIZE(s5p6440_pc=
m0_resource),
> + =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =3D s5p6440_pcm=
0_resource,
> + =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s5p6440_pcm_pdata,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> diff --git a/arch/arm/mach-s5p64x0/dev-spi.c b/arch/arm/mach-s5p64x0/=
dev-spi.c
> new file mode 100644
> index 0000000..7303d3a
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/dev-spi.c
> @@ -0,0 +1,275 @@
> +/* linux/arch/arm/mach-s5p64x0/dev-spi.c
> + *
> + * Copyright (C) 2010 Samsung Electronics Co. Ltd.
> + * =C2=A0 =C2=A0 Jaswinder Singh <jassi.brar@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#include <linux/platform_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/gpio.h>
> +
> +#include <mach/dma.h>
> +#include <mach/map.h>
> +#include <mach/irqs.h>
> +#include <mach/spi-clocks.h>
> +
> +#include <plat/s3c64x0-spi.h>
> +#include <plat/gpio-cfg.h>
> +
> +static char *s5p6440_spi_src_clks[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 [S5P64X0_SPI_SRCCLK_PCLK] =3D "pclk",
> + =C2=A0 =C2=A0 =C2=A0 [S5P64X0_SPI_SRCCLK_SCLK] =3D "spi_epll",
> +};
> +
> +static char *s5p6450_spi_src_clks[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 [S5P64X0_SPI_SRCCLK_PCLK] =3D "pclk",
> + =C2=A0 =C2=A0 =C2=A0 [S5P64X0_SPI_SRCCLK_SCLK] =3D "sclk_spi",
> +};

Maybe we can drop one and call the other s5p64x0_spi_src_clks
The second clock is the same but only named differently.

> +
> +/* SPI Controller platform_devices */
> +
> +/* Since we emulate multi-cs capability, we do not touch the CS.
> + * The emulated CS is toggled by board specific mechanism, as it can
> + * be either some immediate GPIO or some signal out of some other
> + * chip in between ... or some yet another way.
> + * We simply do not assume anything about CS.
> + */
> +static int s5p6440_spi_cfg_gpio(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 switch (pdev->id) {
> + =C2=A0 =C2=A0 =C2=A0 case 0:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(0), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(1), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(2), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(0), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(1), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(2), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> +
> + =C2=A0 =C2=A0 =C2=A0 case 1:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(4), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(5), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6440_GPC(6), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(4), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(5), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6440_GPC(6), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> +
> + =C2=A0 =C2=A0 =C2=A0 default:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "Invalid SPI Controller number!");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static int s5p6450_spi_cfg_gpio(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 switch (pdev->id) {
> + =C2=A0 =C2=A0 =C2=A0 case 0:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPC(0), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPC(1), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPC(2), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6450_GPC(0), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6450_GPC(1), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6450_GPC(2), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> +
> + =C2=A0 =C2=A0 =C2=A0 case 1:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPC(4), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPC(5), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_cfgpin(S5=
P6450_GPC(6), S3C_GPIO_SFN(2));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6450_GPC(4), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6450_GPC(5), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s3c_gpio_setpull(S=
5P6450_GPC(6), S3C_GPIO_PULL_UP);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> +
> + =C2=A0 =C2=A0 =C2=A0 default:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "Invalid SPI Controller number!");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static struct resource s5p64x0_spi0_resource[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 [0] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D S=
5P64X0_PA_SPI0,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D S5P64X0_PA_SPI0 + 0x100 - 1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_MEM,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 [1] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D D=
MACH_SPI0_TX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D DMACH_SPI0_TX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_DMA,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 [2] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D D=
MACH_SPI0_RX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D DMACH_SPI0_RX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_DMA,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 [3] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D I=
RQ_SPI0,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D IRQ_SPI0,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_IRQ,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +static struct s3c64x0_spi_info s5p6440_spi0_pdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =C2=A0 =C2=A0 =C2=A0 =3D s5p6440_spi=
_cfg_gpio,
> + =C2=A0 =C2=A0 =C2=A0 .fifo_lvl_mask =C2=A0=3D 0x1ff,
> + =C2=A0 =C2=A0 =C2=A0 .rx_lvl_offset =C2=A0=3D 15,
> +};

I think you forgot to compile check in hurry ?
There is no s3c64x0_spi_info, but only s3c64xx_spi_info

> +
> +static struct s3c64x0_spi_info s5p6450_spi0_pdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =C2=A0 =C2=A0 =C2=A0 =3D s5p6450_spi=
_cfg_gpio,
> + =C2=A0 =C2=A0 =C2=A0 .fifo_lvl_mask =C2=A0=3D 0x1ff,
> + =C2=A0 =C2=A0 =C2=A0 .rx_lvl_offset =C2=A0=3D 15,
> +};
> +
> +static u64 spi_dmamask =3D DMA_BIT_MASK(32);
> +
> +struct platform_device s5p6440_device_spi0 =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "=
s3c64x0-spi",

%s/64xx/64x0 ? :)
The device name should be kept same "s3c64xx-spi"

> + =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 0,
> + =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0=3D ARRAY_SIZE(s5p64x0_sp=
i0_resource),
> + =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =3D s5p64x0_spi=
0_resource,
> + =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .dma_mask =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &spi_dmamask,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .coherent_dma_mask=
 =C2=A0 =C2=A0 =C2=A0=3D DMA_BIT_MASK(32),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s5p6440_spi0_pdata,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +struct platform_device s5p6450_device_spi0 =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "=
s3c64x0-spi",

same here

> + =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 0,
> + =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0=3D ARRAY_SIZE(s5p64x0_sp=
i0_resource),
> + =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =3D s5p64x0_spi=
0_resource,
> + =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .dma_mask =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &spi_dmamask,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .coherent_dma_mask=
 =C2=A0 =C2=A0 =C2=A0=3D DMA_BIT_MASK(32),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s5p6450_spi0_pdata,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +static struct resource s5p64x0_spi1_resource[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 [0] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D S=
5P64X0_PA_SPI1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D S5P64X0_PA_SPI1 + 0x100 - 1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_MEM,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 [1] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D D=
MACH_SPI1_TX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D DMACH_SPI1_TX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_DMA,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 [2] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D D=
MACH_SPI1_RX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D DMACH_SPI1_RX,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_DMA,
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 [3] =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .start =C2=A0=3D I=
RQ_SPI1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .end =C2=A0 =C2=A0=
=3D IRQ_SPI1,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .flags =C2=A0=3D I=
ORESOURCE_IRQ,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +static struct s3c64x0_spi_info s5p6440_spi1_pdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =C2=A0 =C2=A0 =C2=A0 =3D s5p6440_spi=
_cfg_gpio,
> + =C2=A0 =C2=A0 =C2=A0 .fifo_lvl_mask =C2=A0=3D 0x7f,
> + =C2=A0 =C2=A0 =C2=A0 .rx_lvl_offset =C2=A0=3D 15,
> +};
> +
> +static struct s3c64x0_spi_info s5p6450_spi1_pdata =3D {
> + =C2=A0 =C2=A0 =C2=A0 .cfg_gpio =C2=A0 =C2=A0 =C2=A0 =3D s5p6450_spi=
_cfg_gpio,
> + =C2=A0 =C2=A0 =C2=A0 .fifo_lvl_mask =C2=A0=3D 0x7f,
> + =C2=A0 =C2=A0 =C2=A0 .rx_lvl_offset =C2=A0=3D 15,
> +};
> +
> +struct platform_device s5p6440_device_spi1 =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "=
s3c64x0-spi",

same here...

> + =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 1,
> + =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0=3D ARRAY_SIZE(s5p64x0_sp=
i1_resource),
> + =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =3D s5p64x0_spi=
1_resource,
> + =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .dma_mask =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &spi_dmamask,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .coherent_dma_mask=
 =C2=A0 =C2=A0 =C2=A0=3D DMA_BIT_MASK(32),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s5p6440_spi1_pdata,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +struct platform_device s5p6450_device_spi1 =3D {
> + =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D "=
s3c64x0-spi",

same here ....

> + =C2=A0 =C2=A0 =C2=A0 .id =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 1,
> + =C2=A0 =C2=A0 =C2=A0 .num_resources =C2=A0=3D ARRAY_SIZE(s5p64x0_sp=
i1_resource),
> + =C2=A0 =C2=A0 =C2=A0 .resource =C2=A0 =C2=A0 =C2=A0 =3D s5p64x0_spi=
1_resource,
> + =C2=A0 =C2=A0 =C2=A0 .dev =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .dma_mask =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &spi_dmamask,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .coherent_dma_mask=
 =C2=A0 =C2=A0 =C2=A0=3D DMA_BIT_MASK(32),
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .platform_data =3D=
 &s5p6450_spi1_pdata,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +void __init s5p6440_spi_set_info(int cntrlr, int src_clk_nr, int num=
_cs)

maybe we could call it s5p64x0_spi_set_info, and remove other other one=
 ?

> +{
> + =C2=A0 =C2=A0 =C2=A0 struct s3c64x0_spi_info *pd;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Reject invalid configuration */
> + =C2=A0 =C2=A0 =C2=A0 if (!num_cs || src_clk_nr < 0
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 || src_clk_nr > S5P6440_SPI_SRCCLK_SCLK) {
 you need to change all references to S5P6440_SPI_SRCCLK_..... as well.

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%=
s: Invalid SPI configuration\n", __func__);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 switch (cntrlr) {
> + =C2=A0 =C2=A0 =C2=A0 case 0:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pd =3D &s5p6440_sp=
i0_pdata;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 case 1:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pd =3D &s5p6440_sp=
i1_pdata;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 default:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%=
s: Invalid SPI controller(%d)\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, cntrlr);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 pd->num_cs =3D num_cs;
> + =C2=A0 =C2=A0 =C2=A0 pd->src_clk_nr =3D src_clk_nr;
> + =C2=A0 =C2=A0 =C2=A0 pd->src_clk_name =3D s5p6440_spi_src_clks[src_=
clk_nr];
> +}
> +
> +void __init s5p6450_spi_set_info(int cntrlr, int src_clk_nr, int num=
_cs)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct s3c64x0_spi_info *pd;
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Reject invalid configuration */
> + =C2=A0 =C2=A0 =C2=A0 if (!num_cs || src_clk_nr < 0
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 || src_clk_nr > S5P6450_SPI_SRCCLK_SCLK) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%=
s: Invalid SPI configuration\n", __func__);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 switch (cntrlr) {
> + =C2=A0 =C2=A0 =C2=A0 case 0:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pd =3D &s5p6450_sp=
i0_pdata;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 case 1:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pd =3D &s5p6450_sp=
i1_pdata;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 default:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printk(KERN_ERR "%=
s: Invalid SPI controller(%d)\n",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __func__, cntrlr);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 pd->num_cs =3D num_cs;
> + =C2=A0 =C2=A0 =C2=A0 pd->src_clk_nr =3D src_clk_nr;
> + =C2=A0 =C2=A0 =C2=A0 pd->src_clk_name =3D s5p6450_spi_src_clks[src_=
clk_nr];
> +}
> diff --git a/arch/arm/mach-s5p64x0/include/mach/spi-clocks.h b/arch/a=
rm/mach-s5p64x0/include/mach/spi-clocks.h
> new file mode 100644
> index 0000000..170a20a
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/include/mach/spi-clocks.h
> @@ -0,0 +1,20 @@
> +/* linux/arch/arm/mach-s5p64x0/include/mach/spi-clocks.h
> + *
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com

           ^^^  This notice is redundant

> + *
> + * Copyright (C) 2010 Samsung Electronics Co. Ltd.
> + * =C2=A0 =C2=A0 Jaswinder Singh <jassi.brar@samsung.com>
> + *
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> +*/
> +
> +#ifndef __ASM_ARCH_SPI_CLKS_H
> +#define __ASM_ARCH_SPI_CLKS_H __FILE__
> +
> +#define S5P64X0_SPI_SRCCLK_PCLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A00
> +#define S5P64X0_SPI_SRCCLK_SCLK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A01
> +
> +#endif /* __ASM_ARCH_SPI_CLKS_H */
> diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/pla=
t-samsung/include/plat/devs.h
> index 85f6f23..10d0d3c 100644
> --- a/arch/arm/plat-samsung/include/plat/devs.h
> +++ b/arch/arm/plat-samsung/include/plat/devs.h
> @@ -67,6 +67,8 @@ extern struct platform_device s5pv210_device_spi0;
> =C2=A0extern struct platform_device s5pv210_device_spi1;
> =C2=A0extern struct platform_device s5p6440_device_spi0;
> =C2=A0extern struct platform_device s5p6440_device_spi1;
> +extern struct platform_device s5p6450_device_spi0;
> +extern struct platform_device s5p6450_device_spi1;
>
> =C2=A0extern struct platform_device s3c_device_hwmon;
>
> @@ -95,6 +97,9 @@ extern struct platform_device s5p6442_device_spi;
> =C2=A0extern struct platform_device s5p6440_device_pcm;
> =C2=A0extern struct platform_device s5p6440_device_iis;
>
> +extern struct platform_device s5p6450_device_iis0;
> +extern struct platform_device s5p6450_device_pcm0;
> +
> =C2=A0extern struct platform_device s5pc100_device_ac97;
> =C2=A0extern struct platform_device s5pc100_device_pcm0;
> =C2=A0extern struct platform_device s5pc100_device_pcm1;
> --
> 1.6.2.5

just to say the least.
