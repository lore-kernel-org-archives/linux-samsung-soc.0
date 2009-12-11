From: jassi brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH 1/7] ARM: S5P6440: Kconfigs and Makefiles
Date: Fri, 11 Dec 2009 22:29:46 +0900
Message-ID: <1b68c6790912110529u3256e189s8b7c9bec8d17129b@mail.gmail.com>
References: <1260525158-4106-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f197.google.com ([209.85.212.197]:47229 "EHLO
	mail-vw0-f197.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754197AbZLKN3k convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 11 Dec 2009 08:29:40 -0500
Received: by vws35 with SMTP id 35so253894vws.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Dec 2009 05:29:46 -0800 (PST)
In-Reply-To: <1260525158-4106-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Adityapratap Sharma <aditya.ps@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Atul Dahiya <atul.dahiya@samsung.com>

On Fri, Dec 11, 2009 at 6:52 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> This patch adds Kconfigs and Makefiles for S5P6440.
>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Signed-off-by: Adityapratap Sharma <aditya.ps@samsung.com>
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> ---
> =C2=A0arch/arm/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| =C2=A0 14 ++++++++++++-
> =C2=A0arch/arm/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A02 +
> =C2=A0arch/arm/mach-s5p6440/Kconfig =C2=A0 =C2=A0 =C2=A0 | =C2=A0 21 =
++++++++++++++++++++
> =C2=A0arch/arm/mach-s5p6440/Makefile =C2=A0 =C2=A0 =C2=A0| =C2=A0 19 =
++++++++++++++++++
> =C2=A0arch/arm/mach-s5p6440/Makefile.boot | =C2=A0 =C2=A02 +
> =C2=A0arch/arm/plat-s5p/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
=C2=A0 36 +++++++++++++++++++++++++++++++++++
> =C2=A0arch/arm/plat-s5p/Makefile =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
=C2=A0 25 ++++++++++++++++++++++++
> =C2=A07 files changed, 118 insertions(+), 1 deletions(-)
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/Kconfig
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/Makefile
> =C2=A0create mode 100644 arch/arm/mach-s5p6440/Makefile.boot
> =C2=A0create mode 100644 arch/arm/plat-s5p/Kconfig
> =C2=A0create mode 100644 arch/arm/plat-s5p/Makefile
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 78b6060..c9cb8ee 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -588,6 +588,13 @@ config ARCH_S3C64XX
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Samsung S3C64XX series based system=
s
>
> +config ARCH_S5P6440
> + =C2=A0 =C2=A0 =C2=A0 bool "Samsung S5P6440"
> + =C2=A0 =C2=A0 =C2=A0 select GENERIC_GPIO
> + =C2=A0 =C2=A0 =C2=A0 select HAVE_CLK
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Samsung S5P6440 CPU based systems
> +
> =C2=A0config ARCH_S5PC1XX
> =C2=A0 =C2=A0 =C2=A0 =C2=A0bool "Samsung S5PC1XX"
> =C2=A0 =C2=A0 =C2=A0 =C2=A0select GENERIC_GPIO
> @@ -707,6 +714,7 @@ source "arch/arm/plat-samsung/Kconfig"
> =C2=A0source "arch/arm/plat-s3c24xx/Kconfig"
> =C2=A0source "arch/arm/plat-s3c64xx/Kconfig"
> =C2=A0source "arch/arm/plat-s3c/Kconfig"
> +source "arch/arm/plat-s5p/Kconfig"
> =C2=A0source "arch/arm/plat-s5pc1xx/Kconfig"
Issue of s5p64xx hogging namespace might arise for s5pc1xx.
(s5p ought to be inclusive to s5pc1xx too, not just s5p64xx)

> =C2=A0if ARCH_S3C2410
> @@ -723,6 +731,10 @@ source "arch/arm/mach-s3c6400/Kconfig"
> =C2=A0source "arch/arm/mach-s3c6410/Kconfig"
> =C2=A0endif
>
> +if ARCH_S5P6440
> +source "arch/arm/mach-s5p6440/Kconfig"
> +endif
> +
> =C2=A0source "arch/arm/plat-stmp3xxx/Kconfig"
>
> =C2=A0if ARCH_S5PC1XX
> @@ -1005,7 +1017,7 @@ config PREEMPT
> =C2=A0config HZ
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default 128 if ARCH_L7200
> - =C2=A0 =C2=A0 =C2=A0 default 200 if ARCH_EBSA110 || ARCH_S3C2410
> + =C2=A0 =C2=A0 =C2=A0 default 200 if ARCH_EBSA110 || ARCH_S3C2410 ||=
 ARCH_S5P6440
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default OMAP_32K_TIMER_HZ if ARCH_OMAP && =
OMAP_32K_TIMER
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default AT91_TIMER_HZ if ARCH_AT91
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default 100
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index a026565..376da2b 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -151,6 +151,7 @@ machine-$(CONFIG_ARCH_S3C2410) =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D s3c2410 s3c2400 s3c2412 s3c2440 s3c244=
2 s3c24
> =C2=A0machine-$(CONFIG_ARCH_S3C24A0) =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D=
 s3c24a0
> =C2=A0machine-$(CONFIG_ARCH_S3C64XX) =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D=
 s3c6400 s3c6410
> =C2=A0machine-$(CONFIG_ARCH_S5PC1XX) =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D=
 s5pc100
> +machine-$(CONFIG_ARCH_S5P6440) =C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D s5p6=
440
> =C2=A0machine-$(CONFIG_ARCH_SA1100) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
:=3D sa1100
> =C2=A0machine-$(CONFIG_ARCH_SHARK) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 :=3D shark
> =C2=A0machine-$(CONFIG_ARCH_STMP378X) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0:=3D stmp378x
> @@ -170,6 +171,7 @@ plat-$(CONFIG_PLAT_PXA) =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 :=3D pxa
> =C2=A0plat-$(CONFIG_PLAT_S3C24XX) =C2=A0 =C2=A0:=3D s3c24xx s3c samsu=
ng
> =C2=A0plat-$(CONFIG_PLAT_S3C64XX) =C2=A0 =C2=A0:=3D s3c64xx s3c samsu=
ng
> =C2=A0plat-$(CONFIG_PLAT_S5PC1XX) =C2=A0 =C2=A0:=3D s5pc1xx s3c samsu=
ng
> +plat-$(CONFIG_PLAT_S5P) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0:=3D s5p samsung s3c

^^^^^^^^^^^^^^^^^
Nitpicking :)   Why not play along?        :=3D s5p s3c samsung

> =C2=A0plat-$(CONFIG_ARCH_STMP3XXX) =C2=A0 :=3D stmp3xxx
>
> =C2=A0ifeq ($(CONFIG_ARCH_EBSA110),y)
> diff --git a/arch/arm/mach-s5p6440/Kconfig b/arch/arm/mach-s5p6440/Kc=
onfig
> new file mode 100644
> index 0000000..421546b
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/Kconfig
> @@ -0,0 +1,21 @@
> +# arch/arm/mach-s5p6440/Kconfig
> +#
> +# Copyright (c) 2009 Samsung Electronics
> +# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0http://www.samsung=
=2Ecom/
> +#
> +# Licensed under GPLv2
> +
> +# Configuration options for the S5P6440 CPU
> +
> +config CPU_S5P6440
> + =C2=A0 =C2=A0 =C2=A0 bool
> + =C2=A0 =C2=A0 =C2=A0 select CPU_S5P6440_INIT
> + =C2=A0 =C2=A0 =C2=A0 select CPU_S5P6440_CLOCK
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Enable S5P6440 CPU support
> +
> +config MACH_SMDK6440
> + =C2=A0 =C2=A0 =C2=A0 bool "SMDK6440"
> + =C2=A0 =C2=A0 =C2=A0 select CPU_S5P6440
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Machine support for the Samsung SMDK644=
0
> diff --git a/arch/arm/mach-s5p6440/Makefile b/arch/arm/mach-s5p6440/M=
akefile
> new file mode 100644
> index 0000000..272e2b2
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/Makefile
> @@ -0,0 +1,19 @@
> +# arch/arm/mach-s5p6440/Makefile
> +#
> +# Copyright (c) 2009 Samsung Electronics
> +# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0http://www.samsung=
=2Ecom/
> +#
> +# Licensed under GPLv2
> +
> +obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D
> +obj-m =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D
> +obj-n =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D
> +obj- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D
> +
> +# Core support for S5P6440 system
> +
> +obj-$(CONFIG_CPU_S5P6440) =C2=A0 =C2=A0 =C2=A0+=3D cpu.o
> +
> +# machine support
> +
> +obj-$(CONFIG_MACH_SMDK6440) =C2=A0 =C2=A0+=3D mach-smdk6440.o
Shouldn't machine support come separate?

> diff --git a/arch/arm/mach-s5p6440/Makefile.boot b/arch/arm/mach-s5p6=
440/Makefile.boot
> new file mode 100644
> index 0000000..ff90aa1
> --- /dev/null
> +++ b/arch/arm/mach-s5p6440/Makefile.boot
> @@ -0,0 +1,2 @@
> + =C2=A0 zreladdr-y =C2=A0:=3D 0x20008000
> +params_phys-y =C2=A0:=3D 0x20000100
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> new file mode 100644
> index 0000000..e47240e
> --- /dev/null
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -0,0 +1,36 @@
> +# arch/arm/plat-s5p/Kconfig
> +#
> +# Copyright (c) 2009 Samsung Electronics.
> +# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0http://www.samsung=
=2Ecom/
> +#
> +# Licensed under GPLv2
> +
> +config PLAT_S5P
> + =C2=A0 =C2=A0 =C2=A0 bool
> + =C2=A0 =C2=A0 =C2=A0 depends on ARCH_S5P6440
> + =C2=A0 =C2=A0 =C2=A0 select CPU_V6
> + =C2=A0 =C2=A0 =C2=A0 select PLAT_S3C
> + =C2=A0 =C2=A0 =C2=A0 select ARM_VIC
> + =C2=A0 =C2=A0 =C2=A0 default y
> + =C2=A0 =C2=A0 =C2=A0 select NO_IOPORT
> + =C2=A0 =C2=A0 =C2=A0 select ARCH_REQUIRE_GPIOLIB
> + =C2=A0 =C2=A0 =C2=A0 select S3C_GPIO_TRACK
> + =C2=A0 =C2=A0 =C2=A0 select PLAT_SAMSUNG
> + =C2=A0 =C2=A0 =C2=A0 select SAMSUNG_CLKSRC
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Base platform code for Samsung's S5P se=
ries SoC.
> +
> +if PLAT_S5P
> +
> +# Configuration options shared by all S5P64XX implementations
> +
> +config CPU_S5P6440_INIT
> + =C2=A0 =C2=A0 =C2=A0 bool
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0Initialisation code for the S5P6440.
> +
> +config CPU_S5P6440_CLOCK
> + =C2=A0 =C2=A0 =C2=A0 bool
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 Clock support code for the S5P6440.
> +endif
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> new file mode 100644
> index 0000000..2783bf8
> --- /dev/null
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -0,0 +1,25 @@
> +# arch/arm/plat-s5p/Makefile
> +#
> +# Copyright (c) 2009 Samsung Electronics.
> +# =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0http://www.samsung=
=2Ecom/
> +#
> +# Licensed under GPLv2
> +
> +obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D
> +obj-m =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D
> +obj-n =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0:=3D dummy.o
> +obj- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 :=3D
> +
> +# Core files
> +
> +obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D dev-uart.o
> +obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D cpu.o
> +obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D clock.o
> +obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D irq.o
> +obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D time.o
> +obj-y =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D setup-i2c0.o
> +
> +# CPU support
> +
> +obj-$(CONFIG_CPU_S5P6440_INIT) +=3D s5p6440-init.o
> +obj-$(CONFIG_CPU_S5P6440_CLOCK) =C2=A0 =C2=A0 =C2=A0 =C2=A0+=3D s5p6=
440-clock.o
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =C2=A0http://vger.kernel.org/majordomo-info.ht=
ml
>
