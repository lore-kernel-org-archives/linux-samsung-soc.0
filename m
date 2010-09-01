From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 02/13] ARM: S5P64X0: Update Kconfig and Makefile
Date: Wed, 1 Sep 2010 18:47:37 +0900
Message-ID: <AANLkTin_aQvv_U9z7VxGM-3VWMj-iWdS928aB30sETWp@mail.gmail.com>
References: <1283324960-21629-1-git-send-email-kgene.kim@samsung.com>
	<1283324960-21629-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:56326 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752767Ab0IAJri convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 1 Sep 2010 05:47:38 -0400
Received: by wyb35 with SMTP id 35so9024958wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Sep 2010 02:47:37 -0700 (PDT)
In-Reply-To: <1283324960-21629-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Wed, Sep 1, 2010 at 4:09 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> This patch updates the Kconfig and Makefile for the S5P6440 and S5P64=
50
> machines. It also updates arch/arm/ Kconfig and Makefile to include f=
or
> support ARCH_S5P64X0 with one kernel image.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 | =A0 16 +++---
> =A0arch/arm/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0arch/arm/mach-s5p6440/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 33 ------------
> =A0arch/arm/mach-s5p6440/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 25 ---------
> =A0arch/arm/mach-s5p64x0/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0| =A0 55 ++++++++++++++++++++
> =A0arch/arm/mach-s5p64x0/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0 30 +++++++++++
> =A0.../{mach-s5p6440 =3D> mach-s5p64x0}/Makefile.boot =A0 | =A0 =A00
> =A0arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0| =A0 =A04 +-
> =A08 files changed, 95 insertions(+), 70 deletions(-)
> =A0delete mode 100644 arch/arm/mach-s5p6440/Kconfig
> =A0delete mode 100644 arch/arm/mach-s5p6440/Makefile
> =A0create mode 100644 arch/arm/mach-s5p64x0/Kconfig
> =A0create mode 100644 arch/arm/mach-s5p64x0/Makefile
> =A0rename arch/arm/{mach-s5p6440 =3D> mach-s5p64x0}/Makefile.boot (10=
0%)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index a7ed21f..40e75b3 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -679,17 +679,15 @@ config ARCH_S3C64XX
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Samsung S3C64XX series based systems
>
> -config ARCH_S5P6440
> - =A0 =A0 =A0 bool "Samsung S5P6440"
> +config ARCH_S5P64X0
> + =A0 =A0 =A0 bool "Samsung S5P6440 S5P6450"
> =A0 =A0 =A0 =A0select CPU_V6
> =A0 =A0 =A0 =A0select GENERIC_GPIO
> =A0 =A0 =A0 =A0select HAVE_CLK
> - =A0 =A0 =A0 select HAVE_S3C2410_WATCHDOG
> =A0 =A0 =A0 =A0select ARCH_USES_GETTIMEOFFSET
> - =A0 =A0 =A0 select HAVE_S3C2410_I2C
> - =A0 =A0 =A0 select HAVE_S3C_RTC

Why HAVE_* is deleted?

> =A0 =A0 =A0 =A0help
> - =A0 =A0 =A0 =A0 Samsung S5P6440 CPU based systems
> + =A0 =A0 =A0 =A0 Samsung S5P64X0 CPU based systems, such as the Sams=
ung SMDK6440,
> + =A0 =A0 =A0 =A0 SMDK6450.
>
> =A0config ARCH_S5P6442
> =A0 =A0 =A0 =A0bool "Samsung S5P6442"
> @@ -929,7 +927,7 @@ if ARCH_S3C64XX
> =A0source "arch/arm/mach-s3c64xx/Kconfig"
> =A0endif
>
> -source "arch/arm/mach-s5p6440/Kconfig"
> +source "arch/arm/mach-s5p64x0/Kconfig"
>
> =A0source "arch/arm/mach-s5p6442/Kconfig"
>
> @@ -1232,7 +1230,7 @@ source kernel/Kconfig.preempt
>
> =A0config HZ
> =A0 =A0 =A0 =A0int
> - =A0 =A0 =A0 default 200 if ARCH_EBSA110 || ARCH_S3C2410 || ARCH_S5P=
6440 || \
> + =A0 =A0 =A0 default 200 if ARCH_EBSA110 || ARCH_S3C2410 || ARCH_S5P=
64X0 || \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH_S5P6442 || ARCH_S5PV210 || ARCH_S=
5PV310
> =A0 =A0 =A0 =A0default OMAP_32K_TIMER_HZ if ARCH_OMAP && OMAP_32K_TIM=
ER
> =A0 =A0 =A0 =A0default AT91_TIMER_HZ if ARCH_AT91
> @@ -1609,7 +1607,7 @@ config ZRELADDR
> =A0 =A0 =A0 =A0default 0x10008000 if ARCH_MSM ||\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH_OMAP1 ||\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH_RPC
> - =A0 =A0 =A0 default 0x20008000 if ARCH_S5P6440 ||\
> + =A0 =A0 =A0 default 0x20008000 if ARCH_S5P64X0 ||\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH_S5P6442 ||\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH_S5PC100 ||\
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARCH_S5PV210
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index 59c1ce8..8420f21 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -173,7 +173,7 @@ machine-$(CONFIG_ARCH_RPC) =A0 =A0 =A0 =A0 =A0:=3D=
 rpc
> =A0machine-$(CONFIG_ARCH_S3C2410) =A0 =A0 =A0 =A0 :=3D s3c2410 s3c240=
0 s3c2412 s3c2416 s3c2440 s3c2443
> =A0machine-$(CONFIG_ARCH_S3C24A0) =A0 =A0 =A0 =A0 :=3D s3c24a0
> =A0machine-$(CONFIG_ARCH_S3C64XX) =A0 =A0 =A0 =A0 :=3D s3c64xx
> -machine-$(CONFIG_ARCH_S5P6440) =A0 =A0 =A0 =A0 :=3D s5p6440
> +machine-$(CONFIG_ARCH_S5P64X0) =A0 =A0 =A0 =A0 :=3D s5p64x0
> =A0machine-$(CONFIG_ARCH_S5P6442) =A0 =A0 =A0 =A0 :=3D s5p6442
> =A0machine-$(CONFIG_ARCH_S5PC100) =A0 =A0 =A0 =A0 :=3D s5pc100
> =A0machine-$(CONFIG_ARCH_S5PV210) =A0 =A0 =A0 =A0 :=3D s5pv210
> diff --git a/arch/arm/mach-s5p6440/Kconfig b/arch/arm/mach-s5p6440/Kc=
onfig
> deleted file mode 100644
> index 6a4af7f..0000000
> --- a/arch/arm/mach-s5p6440/Kconfig
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -# arch/arm/mach-s5p6440/Kconfig
> -#
> -# Copyright (c) 2009 Samsung Electronics Co., Ltd.
> -# =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.samsung.com/
> -#
> -# Licensed under GPLv2
> -
> -if ARCH_S5P6440
> -
> -config CPU_S5P6440
> - =A0 =A0 =A0 bool
> - =A0 =A0 =A0 select S3C_PL330_DMA
> - =A0 =A0 =A0 help
> - =A0 =A0 =A0 =A0 Enable S5P6440 CPU support
> -
> -config S5P6440_SETUP_I2C1
> - =A0 =A0 =A0 bool
> - =A0 =A0 =A0 help
> - =A0 =A0 =A0 =A0 Common setup code for i2c bus 1.
> -
> -config MACH_SMDK6440
> - =A0 =A0 =A0 bool "SMDK6440"
> - =A0 =A0 =A0 select CPU_S5P6440
> - =A0 =A0 =A0 select S3C_DEV_I2C1
> - =A0 =A0 =A0 select S3C_DEV_RTC
> - =A0 =A0 =A0 select S3C_DEV_WDT
> - =A0 =A0 =A0 select SAMSUNG_DEV_ADC
> - =A0 =A0 =A0 select SAMSUNG_DEV_TS
> - =A0 =A0 =A0 select S5P6440_SETUP_I2C1
> - =A0 =A0 =A0 help
> - =A0 =A0 =A0 =A0 Machine support for the Samsung SMDK6440
> -
> -endif
> diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440/M=
akefile
> deleted file mode 100644
> index c3fe4d3..0000000
> --- a/arch/arm/mach-s5p6440/Makefile
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -# arch/arm/mach-s5p6440/Makefile
> -#
> -# Copyright (c) 2009 Samsung Electronics Co., Ltd.
> -# =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.samsung.com/
> -#
> -# Licensed under GPLv2
> -
> -obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D
> -obj-m =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D
> -obj-n =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D
> -obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 :=3D
> -
> -# Core support for S5P6440 system
> -
> -obj-$(CONFIG_CPU_S5P6440) =A0 =A0 =A0+=3D cpu.o init.o clock.o gpio.=
o dma.o
> -obj-$(CONFIG_CPU_S5P6440) =A0 =A0 =A0+=3D setup-i2c0.o
> -
> -# machine support
> -
> -obj-$(CONFIG_MACH_SMDK6440) =A0 =A0+=3D mach-smdk6440.o
> -
> -# device support
> -obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D dev-au=
dio.o
> -obj-$(CONFIG_S3C64XX_DEV_SPI) =A0+=3D dev-spi.o
> -obj-$(CONFIG_S5P6440_SETUP_I2C1) =A0 =A0 =A0 +=3D setup-i2c1.o
> diff --git a/arch/arm/mach-s5p64x0/Kconfig b/arch/arm/mach-s5p64x0/Kc=
onfig
> new file mode 100644
> index 0000000..488375c
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/Kconfig
> @@ -0,0 +1,55 @@
> +# arch/arm/mach-s5p64x0/Kconfig
> +#
> +# Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> +# =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.samsung.com/
> +#
> +# Licensed under GPLv2
> +
> +if ARCH_S5P64X0
> +
> +config CPU_S5P6440
> + =A0 =A0 =A0 bool
> + =A0 =A0 =A0 select PLAT_S5P
> + =A0 =A0 =A0 select S3C_PL330_DMA
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Enable S5P6440 CPU support
> +
> +config CPU_S5P6450
> + =A0 =A0 =A0 bool
> + =A0 =A0 =A0 select PLAT_S5P
> + =A0 =A0 =A0 select S3C_PL330_DMA
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Enable S5P6450 CPU support
> +
> +config S5P64X0_SETUP_I2C1
> + =A0 =A0 =A0 bool
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Common setup code for i2c bus 1.
> +
> +# machine support
> +
> +config MACH_SMDK6440
> + =A0 =A0 =A0 bool "SMDK6440"
> + =A0 =A0 =A0 select CPU_S5P6440
> + =A0 =A0 =A0 select S3C_DEV_I2C1
> + =A0 =A0 =A0 select S3C_DEV_RTC
> + =A0 =A0 =A0 select S3C_DEV_WDT
> + =A0 =A0 =A0 select SAMSUNG_DEV_ADC
> + =A0 =A0 =A0 select SAMSUNG_DEV_TS
> + =A0 =A0 =A0 select S5P64X0_SETUP_I2C1
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Machine support for the Samsung SMDK6440
> +
> +config MACH_SMDK6450
> + =A0 =A0 =A0 bool "SMDK6450"
> + =A0 =A0 =A0 select CPU_S5P6450
> + =A0 =A0 =A0 select S3C_DEV_I2C1
> + =A0 =A0 =A0 select S3C_DEV_RTC
> + =A0 =A0 =A0 select S3C_DEV_WDT
> + =A0 =A0 =A0 select SAMSUNG_DEV_ADC
> + =A0 =A0 =A0 select SAMSUNG_DEV_TS
> + =A0 =A0 =A0 select S5P64X0_SETUP_I2C1
> + =A0 =A0 =A0 help
> + =A0 =A0 =A0 =A0 Machine support for the Samsung SMDK6450

In most case SMDK has almost same functionality. make a common select
e.g., SMDK_COMMON and each board just select it.
> +
> +endif
> diff --git a/arch/arm/mach-s5p64x0/Makefile b/arch/arm/mach-s5p64x0/M=
akefile
> new file mode 100644
> index 0000000..2655829
> --- /dev/null
> +++ b/arch/arm/mach-s5p64x0/Makefile
> @@ -0,0 +1,30 @@
> +# arch/arm/mach-s5p64x0/Makefile
> +#
> +# Copyright (c) 2009-2010 Samsung Electronics Co., Ltd.
> +# =A0 =A0 =A0 =A0 =A0 =A0 =A0http://www.samsung.com
> +#
> +# Licensed under GPLv2
> +
> +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D
> +obj-m =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D
> +obj-n =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0:=3D
> +obj- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 :=3D
> +
> +# Core support for S5P64X0 system
> +
> +obj-$(CONFIG_ARCH_S5P64X0) =A0 =A0 +=3D cpu.o init.o clock.o dma.o
> +obj-$(CONFIG_ARCH_S5P64X0) =A0 =A0 +=3D setup-i2c0.o
> +obj-$(CONFIG_CPU_S5P6440) =A0 =A0 =A0+=3D clock-s5p6440.o gpio.o
> +obj-$(CONFIG_CPU_S5P6450) =A0 =A0 =A0+=3D clock-s5p6450.o
> +
> +# machine support
> +
> +obj-$(CONFIG_MACH_SMDK6440) =A0 =A0+=3D mach-smdk6440.o
> +obj-$(CONFIG_MACH_SMDK6450) =A0 =A0+=3D mach-smdk6450.o
Are there difference between smdk6440 and smdk6450 except the SOC?
If no, how about to make a single file as pxa or omap does?

Thank you,
Kyungmin Park
> +
> +# device support
> +
> +obj-y =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0+=3D dev-au=
dio.o
> +obj-$(CONFIG_S3C64XX_DEV_SPI) =A0+=3D dev-spi.o
> +
> +obj-$(CONFIG_S5P64X0_SETUP_I2C1) =A0 =A0 =A0 +=3D setup-i2c1.o
> diff --git a/arch/arm/mach-s5p6440/Makefile.boot b/arch/arm/mach-s5p6=
4x0/Makefile.boot
> similarity index 100%
> rename from arch/arm/mach-s5p6440/Makefile.boot
> rename to arch/arm/mach-s5p64x0/Makefile.boot
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index c6a855d..90f97d6 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -7,7 +7,7 @@
>
> =A0config PLAT_S5P
> =A0 =A0 =A0 =A0bool
> - =A0 =A0 =A0 depends on (ARCH_S5P6440 || ARCH_S5P6442 || ARCH_S5PC10=
0 || ARCH_S5PV210 || ARCH_S5PV310)
> + =A0 =A0 =A0 depends on (ARCH_S5P64X0 || ARCH_S5P6442 || ARCH_S5PC10=
0 || ARCH_S5PV210 || ARCH_S5PV310)
> =A0 =A0 =A0 =A0default y
> =A0 =A0 =A0 =A0select ARM_VIC if !ARCH_S5PV310
> =A0 =A0 =A0 =A0select ARM_GIC if ARCH_S5PV310
> @@ -30,7 +30,7 @@ config S5P_EXT_INT
> =A0 =A0 =A0 =A0bool
> =A0 =A0 =A0 =A0help
> =A0 =A0 =A0 =A0 =A0Use the external interrupts (other than GPIO inter=
rupts.)
> - =A0 =A0 =A0 =A0 Note: Do not choose this for S5P6440.
> + =A0 =A0 =A0 =A0 Note: Do not choose this for S5P6440 and S5P6450.
>
> =A0config S5P_DEV_FIMC0
> =A0 =A0 =A0 =A0bool
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
