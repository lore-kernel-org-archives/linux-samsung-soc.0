From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC PATCH v2 3/3] drivers: mfd: Add support for Exynos PMU
 driver
Date: Mon, 28 Apr 2014 12:21:53 +0100
Message-ID: <20140428112153.GT21279@lee--X1>
References: <1396427085-4696-1-git-send-email-pankaj.dubey@samsung.com>
 <1398431131-5946-1-git-send-email-pankaj.dubey@samsung.com>
 <1398431131-5946-4-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398431131-5946-4-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, b.zolnierkie@samsung.com, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

On Fri, 25 Apr 2014, Pankaj Dubey wrote:

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
>  arch/arm/mach-exynos/Kconfig  |    2 +
>  arch/arm/mach-exynos/Makefile |    2 -
>  arch/arm/mach-exynos/pmu.c    |  521 -------------------------------=
----------
>  drivers/mfd/Kconfig           |    9 +
>  drivers/mfd/Makefile          |    1 +
>  drivers/mfd/exynos-pmu.c      |  521 +++++++++++++++++++++++++++++++=
++++++++++
>  6 files changed, 533 insertions(+), 523 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/pmu.c
>  create mode 100644 drivers/mfd/exynos-pmu.c

Same with this patch, `git format-patch -M`.

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
