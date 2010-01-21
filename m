From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH v2 05/10] ARM: S5PV210: Update Kconfig and Makefiles
Date: Thu, 21 Jan 2010 02:27:20 +0000
Message-ID: <20100121022720.GD10592@trinity.fluff.org>
References: <1264031830-2167-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33364 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751774Ab0AUC1V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2010 21:27:21 -0500
Content-Disposition: inline
In-Reply-To: <1264031830-2167-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

On Thu, Jan 21, 2010 at 08:57:10AM +0900, Kukjin Kim wrote:
> Updates arch/arm Kconfig and Makefile for building the S5PV210 support.
> Also modifies the plat-s5p Kconfig file to include the support for plat-s5p
> for S5PV210 SoC.
> 
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  arch/arm/Kconfig          |   12 +++++++++++-
>  arch/arm/Makefile         |    1 +
>  arch/arm/plat-s5p/Kconfig |    2 +-
>  3 files changed, 13 insertions(+), 2 deletions(-)
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

For fthe future, we should think about chnging this to something each
architecture can select... such as:

config HZ_DEFAULT_200
       bool

config HZ
       int
       default 128 if ARCH_L7200
       default 200 if HZ_DEFAULT_200
       ...

Note, not necessary for this round.

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
> diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
> index e7c31e7..7a91c93 100644
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

Let's change to select PLAT_S5P in all machines that need it and
remove the 'default y' statement from this.

-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
