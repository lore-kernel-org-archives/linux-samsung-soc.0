From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESUBMIT RFC PATCH v2 3/3] drivers: mfd: Add support for Exynos
 PMU driver
Date: Mon, 28 Apr 2014 13:18:53 +0100
Message-ID: <20140428121853.GE21279@lee--X1>
References: <1398687607-4554-1-git-send-email-pankaj.dubey@samsung.com>
 <1398687607-4554-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f177.google.com ([209.85.212.177]:51327 "EHLO
	mail-wi0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755394AbaD1MS6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 08:18:58 -0400
Received: by mail-wi0-f177.google.com with SMTP id cc10so5540431wib.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2014 05:18:57 -0700 (PDT)
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

[...]

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

The help should be indented. Take a look at the other entries.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
