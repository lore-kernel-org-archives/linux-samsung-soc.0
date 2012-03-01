From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH v2] ARM: S3C24XX: Move s3c2443-clock.c to mach-s3c24xx
Date: Thu, 01 Mar 2012 13:32:29 +0900
Message-ID: <076f01ccf764$4fedda40$efc98ec0$%kim@samsung.com>
References: <201202212221.41744.heiko@sntech.de>
 <201202221718.01137.arnd@arndb.de> <201202221828.53363.heiko@sntech.de>
 <201202231536.00015.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:44216 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757861Ab2CAEcc convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:32:32 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M06009PGV9WOU30@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:32:30 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M06001KTVA5V010@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:32:30 +0900 (KST)
In-reply-to: <201202231536.00015.heiko@sntech.de>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?iso-8859-1?Q?'Heiko_St=FCbner'?= <heiko@sntech.de>
Cc: 'Arnd Bergmann' <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 'Ben Dooks' <ben-linux@fluff.org>

Heiko St=FCbner wrote:
>=20
> S3C-SoCs starting with the S3C2443 can share a lot of functionality.
> The file can collect more common code of these SocS later on and
> therefore gets a new name to reflect this future purpose.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> for completenes sake, the patch with -M format
>=20
>  arch/arm/mach-s3c24xx/Kconfig                      |   14 ++++++++++=
++--
>  arch/arm/mach-s3c24xx/Makefile                     |    4 ++++
>  .../common-s3c2443.c}                              |   17
+++++++++++++----
>  arch/arm/plat-s3c24xx/Kconfig                      |    6 ------
>  arch/arm/plat-s3c24xx/Makefile                     |    1 -
>  5 files changed, 29 insertions(+), 13 deletions(-)
>  rename arch/arm/{plat-s3c24xx/s3c2443-clock.c =3D> mach-s3c24xx/comm=
on-
> s3c2443.c} (95%)
>=20
> diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kc=
onfig
> index e537577..506d55b 100644
> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -41,7 +41,7 @@ config CPU_S3C2416
>  	select CPU_ARM926T
>  	select CPU_LLSERIAL_S3C2440
>  	select SAMSUNG_CLKSRC
> -	select S3C2443_CLOCK
> +	select S3C2443_COMMON
>  	select S3C2416_DMA if S3C24XX_DMA
>  	select S3C2416_PM if PM
>  	help
> @@ -76,7 +76,7 @@ config CPU_S3C2443
>  	select CPU_ARM920T
>  	select CPU_LLSERIAL_S3C2440
>  	select SAMSUNG_CLKSRC
> -	select S3C2443_CLOCK
> +	select S3C2443_COMMON
>  	select S3C2443_DMA if S3C24XX_DMA
>  	help
>  	  Support for the S3C2443 SoC from the S3C24XX line
> @@ -470,6 +470,16 @@ config SMDK2440_CPU2442
>=20
>  endif	# CPU_S3C2440
>=20
> +if CPU_S3C2443 || CPU_S3C2416
> +
> +config S3C2443_COMMON
> +	bool
> +	help
> +	  Common code for the S3C2443 and similar processors, which
> includes
> +	  the S3C2416 and S3C2450.
> +
> +endif	# CPU_S3C2443 || CPU_S3C2416
> +
>  if CPU_S3C2443
>=20
>  config S3C2443_DMA
> diff --git a/arch/arm/mach-s3c24xx/Makefile b/arch/arm/mach-
> s3c24xx/Makefile
> index 08b44a3..876e5e5 100644
> --- a/arch/arm/mach-s3c24xx/Makefile
> +++ b/arch/arm/mach-s3c24xx/Makefile
> @@ -34,6 +34,10 @@ obj-$(CONFIG_S3C2440_DMA)	+=3D dma-s3c2440.o
>  obj-$(CONFIG_CPU_S3C2443)	+=3D s3c2443.o irq-s3c2443.o clock-s3c2443=
=2Eo
>  obj-$(CONFIG_S3C2443_DMA)	+=3D dma-s3c2443.o
>=20
> +# common code
> +
> +obj-$(CONFIG_S3C2443_COMMON)	+=3D common-s3c2443.o
> +
>  #
>  # machine support
>  # following is ordered alphabetically by option text.
> diff --git a/arch/arm/plat-s3c24xx/s3c2443-clock.c b/arch/arm/mach-
> s3c24xx/common-s3c2443.c
> similarity index 95%
> rename from arch/arm/plat-s3c24xx/s3c2443-clock.c
> rename to arch/arm/mach-s3c24xx/common-s3c2443.c
> index 3633060..2745616 100644
> --- a/arch/arm/plat-s3c24xx/s3c2443-clock.c
> +++ b/arch/arm/mach-s3c24xx/common-s3c2443.c
> @@ -1,9 +1,18 @@
> -/* linux/arch/arm/plat-s3c24xx/s3c2443-clock.c
> +/*
> + * Common code for SoCs starting with the S3C2443
>   *
>   * Copyright (c) 2007, 2010 Simtec Electronics
>   *	Ben Dooks <ben@simtec.co.uk>
>   *
> - * S3C2443 Clock control suport - common code
> + * This program is free software; you can redistribute it and/or mod=
ify
> + * it under the terms of the GNU General Public License as published=
 by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
>   */
>=20
>  #include <linux/init.h>
> @@ -552,7 +561,7 @@ void __init_or_cpufreq
> s3c2443_common_setup_clocks(pll_fn get_mpll)
>  	s3c24xx_setup_clocks(fclk, hclk, pclk);
>=20
>  	printk("CPU: MPLL %s %ld.%03ld MHz, cpu %ld.%03ld MHz,
> mem %ld.%03ld MHz, pclk %ld.%03ld MHz\n",
> -	       (mpllcon & S3C2443_PLLCON_OFF) ? "off":"on",
> +	       (mpllcon & S3C2443_PLLCON_OFF) ? "off" : "on",
>  	       print_mhz(pll), print_mhz(fclk),
>  	       print_mhz(hclk), print_mhz(pclk));
>=20
> @@ -567,7 +576,7 @@ void __init_or_cpufreq
> s3c2443_common_setup_clocks(pll_fn get_mpll)
>  	}
>=20
>  	printk("CPU: EPLL %s %ld.%03ld MHz, usb-bus %ld.%03ld MHz\n",
> -	       (epllcon & S3C2443_PLLCON_OFF) ? "off":"on",
> +	       (epllcon & S3C2443_PLLCON_OFF) ? "off" : "on",
>  	       print_mhz(clk_get_rate(&clk_epll)),
>  	       print_mhz(clk_get_rate(&clk_usb_bus)));
>  }
> diff --git a/arch/arm/plat-s3c24xx/Kconfig b/arch/arm/plat-s3c24xx/Kc=
onfig
> index 0c183fd..74f76e0 100644
> --- a/arch/arm/plat-s3c24xx/Kconfig
> +++ b/arch/arm/plat-s3c24xx/Kconfig
> @@ -44,12 +44,6 @@ config S3C2410_CLOCK
>  	  Clock code for the S3C2410, and similar processors which
>  	  is currently includes the S3C2410, S3C2440, S3C2442.
>=20
> -config S3C2443_CLOCK
> -	bool
> -	help
> -	  Clock code for the S3C2443 and similar processors, which includes
> -	  the S3C2416 and S3C2450.
> -
>  config S3C24XX_DCLK
>  	bool
>  	help
> diff --git a/arch/arm/plat-s3c24xx/Makefile b/arch/arm/plat-
> s3c24xx/Makefile
> index bce27ca..a7e8843 100644
> --- a/arch/arm/plat-s3c24xx/Makefile
> +++ b/arch/arm/plat-s3c24xx/Makefile
> @@ -28,7 +28,6 @@ obj-$(CONFIG_PM)		+=3D pm.o
>  obj-$(CONFIG_PM)		+=3D irq-pm.o
>  obj-$(CONFIG_PM)		+=3D sleep.o
>  obj-$(CONFIG_S3C2410_CLOCK)	+=3D s3c2410-clock.o
> -obj-$(CONFIG_S3C2443_CLOCK)	+=3D s3c2443-clock.o
>  obj-$(CONFIG_S3C24XX_DMA)	+=3D dma.o
>  obj-$(CONFIG_S3C2410_IOTIMING)	+=3D s3c2410-iotiming.o
>  obj-$(CONFIG_S3C2412_IOTIMING)	+=3D s3c2412-iotiming.o
> --
> 1.7.5.4

OK, looks good to me and will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
