From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v5 0/6] exynos: Move pmu driver to driver/soc folder and
 add exynos7 support
Date: Mon, 01 Dec 2014 13:30:51 +0900
Message-ID: <547BEEFB.1040205@samsung.com>
References: <1417270508-11174-1-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:15913 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752598AbaLAEax (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 30 Nov 2014 23:30:53 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFV00KN6Z7F9QD0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 01 Dec 2014 13:30:51 +0900 (KST)
In-reply-to: <1417270508-11174-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Amit Daniel Kachhap <amit.daniel@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, b.zolnierkie@samsung.com, pankaj.dubey@samsung.com

Hi Pankaj,

If you possible, could you add me to mailing list on the next patchset?
because I'll support PMU for Exynos5433, too.

Best Regards,
Chanwoo Choi


On 11/29/2014 11:15 PM, Amit Daniel Kachhap wrote:
> This patch series [1 - 6] performs,
> 
> 1) Moves pmu driver to driver/soc/samsung folder. This is needed as exynos7 is
>    an arm64 based platform and hence PMU driver should be in driver folder.
>    Some discussion happened about this in the v1 version. Finally adding it in
>    driver/soc folder as it too SoC specific and not a general driver.
>    Entire discussion can be found here (A).
> 2) Add exynos7 PMU support.
> 3) Enables the driver for 32bit arm exynos platforms.
> 
> TODO: There is some suggestion to split the PMU data for 32 bit and 64 bit
> Exynos SOC. This can be implemented as a separate optimization patches.
> Submitting this version without much change from previous version as the merge
> window is near.
> 
> Change from V4:
> * Added a new configuration structure for u32 values in patch 4.
> * Rebased on Kukjin for-next tree.
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
> Amit Daniel Kachhap (6):
>   ARM: EXYNOS: Move pmu specific header files under "linux/soc/samsung"
>   ARM: EXYNOS: Move pmu specific headers under "linux/soc/samsung"
>   drivers: soc: Add support for Exynos PMU driver
>   driver: soc: exynos-pmu: Add an API to be called after wakeup
>   driver: soc: exynos-pmu: Add a new structure to allow u32 conf data
>   drivers: soc: exynos-pmu: Add support for Exynos7
>   arm: exynos: Select SOC_SAMSUNG config option
> 
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
>  .../pmu.c => drivers/soc/samsung/exynos-pmu.c      |  451 +++++++++++++++++++-
>  .../linux/soc/samsung}/exynos-pmu.h                |    1 +
>  .../linux/soc/samsung/exynos-regs-pmu.h            |  273 ++++++++++++
>  14 files changed, 750 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/soc/samsung/Kconfig
>  create mode 100644 drivers/soc/samsung/Makefile
>  rename arch/arm/mach-exynos/pmu.c => drivers/soc/samsung/exynos-pmu.c (68%)
>  rename {arch/arm/mach-exynos => include/linux/soc/samsung}/exynos-pmu.h (89%)
>  rename arch/arm/mach-exynos/regs-pmu.h => include/linux/soc/samsung/exynos-regs-pmu.h (68%)
> 
