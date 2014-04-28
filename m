From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESUBMIT RFC PATCH v2 2/3] ARM: EXYNOS: Move pmu specific
 header files under "linux/mfd/samsung"
Date: Mon, 28 Apr 2014 13:17:04 +0100
Message-ID: <20140428121704.GD21279@lee--X1>
References: <1398687607-4554-1-git-send-email-pankaj.dubey@samsung.com>
 <1398687607-4554-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1398687607-4554-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, b.zolnierkie@samsung.com, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>
List-Id: linux-samsung-soc@vger.kernel.org

> Moving Exynos PMU specific header file into "include/linux/mfd/samsun=
g"
> thus updated affected files under "mach-exynos" to use new location o=
f
> these header files.
>=20
> CC: Sangbeom Kim <sbkim73@samsung.com>
> CC: Samuel Ortiz <sameo@linux.intel.com>
> CC: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> ---
>  arch/arm/mach-exynos/cpuidle.c                                    | =
   4 ++--
>  arch/arm/mach-exynos/exynos.c                                     | =
   2 +-
>  arch/arm/mach-exynos/hotplug.c                                    | =
   2 +-
>  arch/arm/mach-exynos/platsmp.c                                    | =
   2 +-
>  arch/arm/mach-exynos/pm.c                                         | =
   4 ++--
>  arch/arm/mach-exynos/pmu.c                                        | =
   5 ++---
>  {arch/arm/mach-exynos =3D> include/linux/mfd/samsung}/exynos-pmu.h  =
|    0
>  .../regs-pmu.h =3D> include/linux/mfd/samsung/exynos-regs-pmu.h     =
|    0
>  8 files changed, 9 insertions(+), 10 deletions(-)
>  rename {arch/arm/mach-exynos =3D> include/linux/mfd/samsung}/exynos-=
pmu.h (100%)
>  rename arch/arm/mach-exynos/regs-pmu.h =3D> include/linux/mfd/samsun=
g/exynos-regs-pmu.h (100%)

Patch looks okay to me.

With an Exynos Ack I'd like to take it through the MFD tree.

Acked-by: Lee Jones <lee.jones@linaro.org>

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
