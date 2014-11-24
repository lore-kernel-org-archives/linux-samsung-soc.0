From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v4 0/5] exynos: Move pmu driver to driver/soc folder and
 add exynos7 support
Date: Mon, 24 Nov 2014 14:20:08 +0100
Message-ID: <36336460.BrNftCFaUT@amdc1032>
References: <1416794775-1605-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:28489 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752622AbaKXNUX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 08:20:23 -0500
In-reply-to: <1416794775-1605-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-kernel@vger.kernel.org, linux@arm.linux.org.uk


Hi,

On Monday, November 24, 2014 07:36:10 AM Amit Daniel Kachhap wrote:
> This patch series [1 - 5] performs,
> 
> 1) Moves pmu driver to driver/soc/samsung folder. This is needed as exynos7 is
>    an arm64 based platform and hence PMU driver should be in driver folder.
>    Some discussion happened about this in the v1 version. Finally adding it in
>    driver/soc folder as it too SoC specific and not a general driver.
>    Entire discussion can be found here (A).
> 2) Add exynos7 PMU support.

Some months ago (when the work on moving PMU driver out of mach-exynos
started) I asked how much code would be shared between arm32 and arm64
SoCs.  Now it seems that the code in question is minimal so I still
wonder whether it is really worth to have a common driver (please note
that in case of arm32 kernel all arm64 PMU code is just a dead code,
similarly for arm64 kernel and arm32 PMU code).  Would it be possible
to do the analysis of the additional source code needed vs saved code
in the resulting binary for the case of having separate drivers?

Could you also please take a look into fixing patch #4 to be compatible
with http://lkml.iu.edu/hypermail/linux/kernel/1407.1/00298.html ?
(It seems that just adding separate struct exynos_pmu_conf_extra for
->pmu_config_extra shold be okay.)

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> 3) Enables the driver for 32bit arm exynos platforms.
> 
> Changes from V3:
> * Fixed Kconfig as per Russell feedback
> * Rebased the series against Pankaj SoC restart consolidation patches (D) as per
>   Kukjin request.
> * Link to V3 can be found here (C)
> 
> Changes from V2:
> * Added review comment changes suggested by Pankaj.
> * Removed mfd client support in this patch series. This will be added later in
>   the power domain patch series.
> * Link to V2 can be found here (B)
> 
> Changes from V1:
> * Move pmu driver in driver/soc/samsung folder
> * Removed the power domain features. They will posted as a separate series.
> * Added exynos7 PMU support.
> * Link to v1 can be found here (A)
> 
> This complete patch series is rebased on Kukjin for-next tree.
> 
> (A) - http://www.spinics.net/lists/linux-samsung-soc/msg38442.html
> (B) - http://www.spinics.net/lists/arm-kernel/msg375910.html
> (C) - http://www.spinics.net/lists/linux-samsung-soc/msg39237.html 
> (D) - http://www.spinics.net/lists/linux-samsung-soc/msg39095.html
> 
> Amit Daniel Kachhap (5):
>   ARM: EXYNOS: Move pmu specific header files under "linux/soc/samsung"
>   drivers: soc: Add support for Exynos PMU driver
>   driver: soc: exynos-pmu: Add an API to be called after wakeup
>   drivers: soc: exynos-pmu: Add support for Exynos7
>   arm: exynos: Select SOC_SAMSUNG config option
> 
>  .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
>  arch/arm/mach-exynos/Kconfig                       |    1 +
>  arch/arm/mach-exynos/Makefile                      |    2 +-
>  arch/arm/mach-exynos/exynos.c                      |    2 +-
>  arch/arm/mach-exynos/mcpm-exynos.c                 |    2 +-
>  arch/arm/mach-exynos/platsmp.c                     |    2 +-
>  arch/arm/mach-exynos/pm.c                          |    4 +-
>  arch/arm/mach-exynos/suspend.c                     |    4 +-
>  drivers/soc/Kconfig                                |    1 +
>  drivers/soc/Makefile                               |    1 +
>  drivers/soc/samsung/Kconfig                        |   20 +
>  drivers/soc/samsung/Makefile                       |    1 +
>  .../pmu.c => drivers/soc/samsung/exynos-pmu.c      |  442 +++++++++++++++++++-
>  .../linux/soc/samsung}/exynos-pmu.h                |    1 +
>  .../linux/soc/samsung/exynos-regs-pmu.h            |  273 ++++++++++++
>  15 files changed, 744 insertions(+), 13 deletions(-)
>  create mode 100644 drivers/soc/samsung/Kconfig
>  create mode 100644 drivers/soc/samsung/Makefile
>  rename arch/arm/mach-exynos/pmu.c => drivers/soc/samsung/exynos-pmu.c (64%)
>  rename {arch/arm/mach-exynos => include/linux/soc/samsung}/exynos-pmu.h (89%)
>  rename arch/arm/mach-exynos/regs-pmu.h => include/linux/soc/samsung/exynos-regs-pmu.h (63%)
