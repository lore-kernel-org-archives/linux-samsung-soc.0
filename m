From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH 05/10] ARM: S5PV210: Add Kconfig and Makefiles
Date: Tue, 19 Jan 2010 03:47:53 +0000
Message-ID: <20100119034753.GE3971@trinity.fluff.org>
References: <1263868079-30778-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:56389 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753084Ab0ASDry (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 18 Jan 2010 22:47:54 -0500
Content-Disposition: inline
In-Reply-To: <1263868079-30778-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Tue, Jan 19, 2010 at 11:27:59AM +0900, Kukjin Kim wrote:
> This patch adds Kconfig and Makefile for building the S5PV210 support.
> This patch also modifies the plat-s5p Makefile and Kconfig file to
> include the support for S5PV210 related files add in plat-s5p.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/Kconfig                    |   12 ++++++-
>  arch/arm/Makefile                   |    1 +
>  arch/arm/mach-s5pv210/Kconfig       |   62 +++++++++++++++++++++++++++++++++++
>  arch/arm/mach-s5pv210/Makefile      |   20 +++++++++++
>  arch/arm/mach-s5pv210/Makefile.boot |    2 +
>  arch/arm/plat-s5p/Kconfig           |   16 ++++++++-
>  arch/arm/plat-s5p/Makefile          |    2 +
>  7 files changed, 113 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm/mach-s5pv210/Kconfig
>  create mode 100644 arch/arm/mach-s5pv210/Makefile
>  create mode 100644 arch/arm/mach-s5pv210/Makefile.boot
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 3bc5169..6212c5b 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -649,6 +649,14 @@ config ARCH_S5PC1XX
>  	help
>  	  Samsung S5PC1XX series based systems
>  
> +config ARCH_S5PV210
> +	bool "Samsung S5PV210/S5PC110"
> +	select GENERIC_GPIO
> +	select HAVE_CLK
> +	select CPU_V7
> +	help
> +	  Samsung S5PV210/S5PC110 series based systems
> +
>  config ARCH_SHARK
>  	bool "Shark"
>  	select CPU_SA110
> @@ -811,6 +819,8 @@ if ARCH_S5PC1XX
>  source "arch/arm/mach-s5pc100/Kconfig"
>  endif
>  
> +source "arch/arm/mach-s5pv210/Kconfig"
> +
>  source "arch/arm/mach-lh7a40x/Kconfig"
>  
>  source "arch/arm/mach-h720x/Kconfig"
> @@ -1085,7 +1095,7 @@ source kernel/Kconfig.preempt
>  config HZ
>  	int
>  	default 128 if ARCH_L7200
> -	default 200 if ARCH_EBSA110 || ARCH_S3C2410 || ARCH_S5P6440
> +	default 200 if ARCH_EBSA110 || ARCH_S3C2410 || ARCH_S5P6440 || ARCH_S5PV210
>  	default OMAP_32K_TIMER_HZ if ARCH_OMAP && OMAP_32K_TIMER
>  	default AT91_TIMER_HZ if ARCH_AT91
>  	default 100
> diff --git a/arch/arm/Makefile b/arch/arm/Makefile
> index bbcd512..c968bde 100644
> --- a/arch/arm/Makefile
> +++ b/arch/arm/Makefile
> @@ -163,6 +163,7 @@ machine-$(CONFIG_ARCH_S3C24A0)		:= s3c24a0
>  machine-$(CONFIG_ARCH_S3C64XX)		:= s3c6400 s3c6410
>  machine-$(CONFIG_ARCH_S5P6440)		:= s5p6440
>  machine-$(CONFIG_ARCH_S5PC1XX)		:= s5pc100
> +machine-$(CONFIG_ARCH_S5PV210)		:= s5pv210
>  machine-$(CONFIG_ARCH_SA1100)		:= sa1100
>  machine-$(CONFIG_ARCH_SHARK)		:= shark
>  machine-$(CONFIG_ARCH_STMP378X)		:= stmp378x
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> new file mode 100644
> index 0000000..de3d128
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -0,0 +1,62 @@
> +# arch/arm/mach-s5pv210/Kconfig
> +#
> +# Copyright (c) 2010 Samsung Electronics Co., Ltd.
> +#		http://www.samsung.com/
> +#
> +# Licensed under GPLv2
> +
> +# Configuration options for the S5PV210/S5PC110
> +
> +if ARCH_S5PV210
> +
> +config CPU_S5PV210
> +	bool
> +	select CPU_S5PV210_INIT
> +	select CPU_S5PV210_CLOCK
> +	help
> +	  Enable S5PV210 CPU support
> +
> +choice
> +	prompt "Select machine type"
> +	depends on ARCH_S5PV210
> +	default MACH_SMDKV210
> +
> +config MACH_SMDKV210
> +	bool "SMDKV210"
> +	select CPU_S5PV210
> +	select ARCH_DISCONTIGMEM_ENABLE
> +	help
> +	  Machine support for Samsung SMDKV210
> +
> +config MACH_SMDKC110
> +	bool "SMDKC110"
> +	select CPU_S5PV210
> +	select ARCH_DISCONTIGMEM_ENABLE
> +	help
> +	  Machine support for Samsung SMDKC110
> +
> +endchoice
> +
> +choice
> +	prompt "Setup CPU Type for S5PC110"
> +	depends on MACH_SMDKC110
> +	default S5PC110_B_TYPE
> +
> +config S5PC110_B_TYPE
> +	bool "select B-Type"
> +	help
> +	  Select B-Type S5PC110 CPU
> +
> +config S5PC110_D_TYPE
> +	bool "select D-Type"
> +	help
> +	  Select D-Type S5PC110 CPU
> +
> +config S5PC110_H_TYPE
> +	bool "Select H-Type"
> +	help
> +	  Select H-Type S5PC110 CPU
> +
> +endchoice
> +
> +endif
> diff --git a/arch/arm/mach-s5pv210/Makefile b/arch/arm/mach-s5pv210/Makefile
> new file mode 100644
> index 0000000..77d2de2
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/Makefile
> @@ -0,0 +1,20 @@
> +# arch/arm/mach-s5pv210/Makefile
> +#
> +# Copyright (c) 2010 Samsung Electronics Co., Ltd.
> +# 		http://www.samsung.com/
> +#
> +# Licensed under GPLv2
> +
> +obj-y				:=
> +obj-m				:=
> +obj-n				:=
> +obj-				:=
> +
> +# Core support for S5PV210 system
> +
> +obj-$(CONFIG_CPU_S5PV210)	+= cpu.o
> +
> +# machine support
> +
> +obj-$(CONFIG_MACH_SMDKV210)	+= mach-smdkv210.o
> +obj-$(CONFIG_MACH_SMDKC110)	+= mach-smdkc110.o
> diff --git a/arch/arm/mach-s5pv210/Makefile.boot b/arch/arm/mach-s5pv210/Makefile.boot
> new file mode 100644
> index 0000000..ff90aa1
> --- /dev/null
> +++ b/arch/arm/mach-s5pv210/Makefile.boot
> @@ -0,0 +1,2 @@
> +   zreladdr-y	:= 0x20008000
> +params_phys-y	:= 0x20000100
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index 7e08b40..e331a32 100644
> --- a/arch/arm/plat-s5p/Kconfig
> +++ b/arch/arm/plat-s5p/Kconfig
> @@ -7,7 +7,7 @@
>  
>  config PLAT_S5P
>  	bool
> -	depends on ARCH_S5P6440
> +	depends on (ARCH_S5P6440 || ARCH_S5PV210)
>  	default y
>  	select PLAT_S3C
>  	select ARM_VIC
> @@ -36,3 +36,17 @@ config CPU_S5P6440_CLOCK
>  	  Clock support code for the S5P6440.
>  
>  endif
> +
> +if (PLAT_S5P && ARCH_S5PV210)
> +
> +config CPU_S5PV210_INIT
> +	bool
> +	help
> +	  Initialization code for the S5PV210.
> +
> +config CPU_S5PV210_CLOCK
> +	bool
> +	help
> +	  Clock support code for the S5PV210.
> +
> +endif
> diff --git a/arch/arm/plat-s5p/Makefile b/arch/arm/plat-s5p/Makefile
> index 92b6474..43cc8af 100644
> --- a/arch/arm/plat-s5p/Makefile
> +++ b/arch/arm/plat-s5p/Makefile
> @@ -22,3 +22,5 @@ obj-y				+= setup-i2c0.o
>  
>  obj-$(CONFIG_CPU_S5P6440_INIT)	+= s5p6440-init.o
>  obj-$(CONFIG_CPU_S5P6440_CLOCK)	+= s5p6440-clock.o
> +obj-$(CONFIG_CPU_S5PV210_INIT)	+= s5pv210-init.o
> +obj-$(CONFIG_CPU_S5PV210_CLOCK)	+= s5pv210-clock.o

Makefile and Kconfig support for the files added should live with the
files that are being added. These files aren't in this patch!

Given it seems that s5pv210-clock.c is likely to be s5pv210 specific
it would be better off placed in arch/arm/mach-s5pv210, I don' see
any point in having these in arch/arm/plat-s5p/ adding extra Kconfig
entries.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
