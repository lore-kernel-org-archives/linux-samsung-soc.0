From: Paul Bolle <pebolle@tiscali.nl>
Subject: Re: [PATCH v2.1 3/9] ARM: S3C24XX: enable usage of common dclk if
 common clock framework is enabled
Date: Fri, 09 May 2014 18:49:41 +0200
Message-ID: <1399654181.19276.2.camel@x220>
References: <2104342.rkElQpXtvM@phil> <3888936.TSFL3ZW3mv@phil>
	 <3835735.0k9HAgQHzN@phil>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews04.kpnxchange.com ([213.75.39.7]:55487 "EHLO
	cpsmtpb-ews04.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756779AbaEIQto (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 9 May 2014 12:49:44 -0400
In-Reply-To: <3835735.0k9HAgQHzN@phil>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, t.figa@samsung.com, mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

On Wed, 2014-04-23 at 22:09 +0200, Heiko St=C3=BCbner wrote:
> Add platform device and select the correct implementation automatical=
ly
> depending on wether the old samsung_clock or the common clock framewo=
rk
> is enabled.
>=20
> This is only done for machines already using the old dclk implementat=
ion,
> as everybody else should move to use dt anyway.
>=20
> The machine-specific settings for the external clocks will have to be=
 set
> by somebody with knowledge about the specific hardware.
>=20
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Tomasz Figa <t.figa@samsung.com>

It seems this one just hit linux-next (in next-20140509).

> --- a/arch/arm/mach-s3c24xx/Kconfig
> +++ b/arch/arm/mach-s3c24xx/Kconfig
> @@ -18,6 +18,13 @@ config PLAT_S3C24XX
>  	help
>  	  Base platform code for any Samsung S3C24XX device
> =20
> +config S3C2410_COMMON_DCLK
> +	bool
> +	select REGMAP_MMIO
> +	help
> +	  Temporary symbol to build the dclk driver based on the common clo=
ck
> +	  framework.
> +
>  menu "SAMSUNG S3C24XX SoCs Support"
> =20
>  comment "S3C24XX SoCs"
> @@ -264,7 +271,8 @@ config ARCH_BAST
>  	select ISA
>  	select MACH_BAST_IDE
>  	select S3C2410_IOTIMING if ARM_S3C2410_CPUFREQ
> -	select S3C24XX_DCLK
> +	select S3C24XX_DCLK if SAMSUNG_CLOCK
> +	select S3C2410_COMMON_DCLK if COMMON_CLK
>  	select S3C24XX_SIMTEC_NOR
>  	select S3C24XX_SIMTEC_PM if PM
>  	select S3C24XX_SIMTEC_USB
> @@ -345,7 +353,8 @@ config MACH_TCT_HAMMER
>  config MACH_VR1000
>  	bool "Thorcom VR1000"
>  	select MACH_BAST_IDE
> -	select S3C24XX_DCLK
> +	select S3C24XX_DCLK if SAMSUNG_CLOCK
> +	select S3C2410_COMMON_DCLK if COMMON_CLK
>  	select S3C24XX_SIMTEC_NOR
>  	select S3C24XX_SIMTEC_PM if PM
>  	select S3C24XX_SIMTEC_USB
> @@ -530,7 +539,8 @@ config MACH_ANUBIS
>  	bool "Simtec Electronics ANUBIS"
>  	select HAVE_PATA_PLATFORM
>  	select S3C2440_XTAL_12000000
> -	select S3C24XX_DCLK
> +	select S3C24XX_DCLK if SAMSUNG_CLOCK
> +	select S3C2410_COMMON_DCLK if COMMON_CLK
>  	select S3C24XX_SIMTEC_PM if PM
>  	select S3C_DEV_USB_HOST
>  	help
> @@ -571,7 +581,8 @@ config MACH_OSIRIS
>  	bool "Simtec IM2440D20 (OSIRIS) module"
>  	select S3C2410_IOTIMING if ARM_S3C2440_CPUFREQ
>  	select S3C2440_XTAL_12000000
> -	select S3C24XX_DCLK
> +	select S3C24XX_DCLK if SAMSUNG_CLOCK
> +	select S3C2410_COMMON_DCLK if COMMON_CLK
>  	select S3C24XX_SIMTEC_PM if PM
>  	select S3C_DEV_NAND
>  	select S3C_DEV_USB_HOST
> @@ -643,7 +654,8 @@ config MACH_RX1950
>  	select PM_H1940 if PM
>  	select S3C2410_IOTIMING if ARM_S3C2440_CPUFREQ
>  	select S3C2440_XTAL_16934400
> -	select S3C24XX_DCLK
> +	select S3C24XX_DCLK if SAMSUNG_CLOCK
> +	select S3C24XX_COMMON_DCLK if COMMON_CLK

This looks like a typo. Did you mean S3C2410_COMMON_DCLK?

>  	select S3C24XX_PWM
>  	select S3C_DEV_NAND
>  	help


Paul Bolle
