From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESUBMIT RFC PATCH v2 3/3] drivers: mfd: Add support for Exynos
 PMU driver
Date: Mon, 28 Apr 2014 13:26:46 +0100
Message-ID: <20140428122646.GF21279@lee--X1>
References: <1398687607-4554-1-git-send-email-pankaj.dubey@samsung.com>
 <1398687607-4554-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f43.google.com ([74.125.82.43]:62632 "EHLO
	mail-wg0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755317AbaD1M0x (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 08:26:53 -0400
Received: by mail-wg0-f43.google.com with SMTP id x12so1775496wgg.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2014 05:26:51 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1398687607-4554-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, b.zolnierkie@samsung.com, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>

> This patch moves Exynos PMU driver implementation from
> "arm/mach-exynos" to "drivers/mfd".
> This driver is mainly used for setting misc bits of register from PMU=
 IP
> of Exynos SoC which will be required to configure before Suspend/Resu=
me.
> Currently all these settings are done in "arch/arm/mach-exynos/pmu.c"=
 but
> moving ahead for ARM64 based SoC support, there is a need of DT based
> implementation of PMU driver.
> This driver uses already existing DT binding information.
>=20
> CC: Sangbeom Kim <sbkim73@samsung.com>
> CC: Samuel Ortiz <sameo@linux.intel.com>
> CC: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/Kconfig                           |    2 ++
>  arch/arm/mach-exynos/Makefile                          |    2 --
>  drivers/mfd/Kconfig                                    |    9 ++++++=
+++
>  drivers/mfd/Makefile                                   |    1 +
>  arch/arm/mach-exynos/pmu.c =3D> drivers/mfd/exynos-pmu.c |    0
>  5 files changed, 12 insertions(+), 2 deletions(-)
>  rename arch/arm/mach-exynos/pmu.c =3D> drivers/mfd/exynos-pmu.c (100=
%)

So I just took a look at the code as zero changes looks suspicious to
me. The driver can not simply be copied and pasted into the MFD
subsystem in its current state.

The fundamental question is; is this chip actually an MFD? What does
it do besides Power Management?

> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kcon=
fig
> index 2f60c90..79559b4 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -27,6 +27,7 @@ config ARCH_EXYNOS4
>  	select PM_GENERIC_DOMAINS if PM_RUNTIME
>  	select S5P_DEV_MFC
>  	select MFD_SYSCON
> +	select MFD_EXYNOS_PMU
>  	help
>  	  Samsung EXYNOS4 SoCs based systems
> =20
> @@ -38,6 +39,7 @@ config ARCH_EXYNOS5
>  	select HAVE_SMP
>  	select PINCTRL
>  	select MFD_SYSCON
> +	select MFD_EXYNOS_PMU
>  	help
>  	  Samsung EXYNOS5 (Cortex-A15) SoC based systems
> =20
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Mak=
efile
> index a656dbe..19fdf17 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -18,8 +18,6 @@ obj-$(CONFIG_PM_SLEEP)		+=3D pm.o sleep.o
>  obj-$(CONFIG_PM_GENERIC_DOMAINS) +=3D pm_domains.o
>  obj-$(CONFIG_CPU_IDLE)		+=3D cpuidle.o
> =20
> -obj-$(CONFIG_ARCH_EXYNOS)	+=3D pmu.o
> -
>  obj-$(CONFIG_SMP)		+=3D platsmp.o headsmp.o
> =20
>  obj-$(CONFIG_HOTPLUG_CPU)	+=3D hotplug.o
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 3383412..fd48870 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1203,6 +1203,15 @@ config MFD_STW481X
>  	  in various ST Microelectronics and ST-Ericsson embedded
>  	  Nomadik series.
> =20
> +config MFD_EXYNOS_PMU
> +	tristate "Support Exynos Power Managment Unit"
> +	depends on ARM || ARM64
> +	help
> +	Exynos SoC have Power Management Unit (PMU) which controls power an=
d
> +	operation state of Exynos SoC in two different ways. This driver
> +	provides impmentation of PMU driver and provides basic functionalit=
y
> +	required during these operation state.
> +
>  menu "Multimedia Capabilities Port drivers"
>  	depends on ARCH_SA1100
> =20
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2851275..7c43d07 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -166,3 +166,4 @@ obj-$(CONFIG_MFD_RETU)		+=3D retu-mfd.o
>  obj-$(CONFIG_MFD_AS3711)	+=3D as3711.o
>  obj-$(CONFIG_MFD_AS3722)	+=3D as3722.o
>  obj-$(CONFIG_MFD_STW481X)	+=3D stw481x.o
> +obj-$(CONFIG_MFD_EXYNOS_PMU)	+=3D exynos-pmu.o
> diff --git a/arch/arm/mach-exynos/pmu.c b/drivers/mfd/exynos-pmu.c
> similarity index 100%
> rename from arch/arm/mach-exynos/pmu.c
> rename to drivers/mfd/exynos-pmu.c

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
