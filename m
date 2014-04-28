From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC PATCH v2 2/3] ARM: EXYNOS: Move pmu specific header files
 under "linux/mfd/samsung"
Date: Mon, 28 Apr 2014 12:21:01 +0100
Message-ID: <20140428112101.GS21279@lee--X1>
References: <1396427085-4696-1-git-send-email-pankaj.dubey@samsung.com>
 <1398431131-5946-1-git-send-email-pankaj.dubey@samsung.com>
 <1398431131-5946-3-git-send-email-pankaj.dubey@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:42373 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754760AbaD1LVH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Apr 2014 07:21:07 -0400
Received: by mail-wi0-f172.google.com with SMTP id hi2so5474769wib.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Apr 2014 04:21:06 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1398431131-5946-3-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Pankaj Dubey <pankaj.dubey@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, b.zolnierkie@samsung.com, Sangbeom Kim <sbkim73@samsung.com>, Samuel Ortiz <sameo@linux.intel.com>

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
>  arch/arm/mach-exynos/cpuidle.c              |    4 +-
>  arch/arm/mach-exynos/exynos-pmu.h           |   31 ---
>  arch/arm/mach-exynos/exynos.c               |    2 +-
>  arch/arm/mach-exynos/hotplug.c              |    2 +-
>  arch/arm/mach-exynos/platsmp.c              |    2 +-
>  arch/arm/mach-exynos/pm.c                   |    4 +-
>  arch/arm/mach-exynos/pmu.c                  |    5 +-
>  arch/arm/mach-exynos/regs-pmu.h             |  308 -----------------=
----------
>  include/linux/mfd/samsung/exynos-pmu.h      |   31 +++
>  include/linux/mfd/samsung/exynos-regs-pmu.h |  308 +++++++++++++++++=
++++++++++
>  10 files changed, 348 insertions(+), 349 deletions(-)
>  delete mode 100644 arch/arm/mach-exynos/exynos-pmu.h
>  delete mode 100644 arch/arm/mach-exynos/regs-pmu.h
>  create mode 100644 include/linux/mfd/samsung/exynos-pmu.h
>  create mode 100644 include/linux/mfd/samsung/exynos-regs-pmu.h

Can you resubmit this using the -M option for format-patch please?

--=20
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org =E2=94=82 Open source software for ARM SoCs
=46ollow Linaro: Facebook | Twitter | Blog
