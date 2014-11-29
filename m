From: Kukjin Kim <kgene@kernel.org>
Subject: RE: [PATCH v5 2/6] drivers: soc: Add support for Exynos PMU driver
Date: Sun, 30 Nov 2014 08:24:48 +0900
Message-ID: <029c01d00c2b$aaeab560$00c02020$@kernel.org>
References: <1417270508-11174-1-git-send-email-amit.daniel@samsung.com>
 <1417270508-11174-3-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28846 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751762AbaK2XYv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 29 Nov 2014 18:24:51 -0500
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0NFT007T2QDCMV10@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sun, 30 Nov 2014 08:24:48 +0900 (KST)
In-reply-to: <1417270508-11174-3-git-send-email-amit.daniel@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: b.zolnierkie@samsung.com, pankaj.dubey@samsung.com

Amit Daniel Kachhap wrote:
> 
> This patch moves Exynos PMU driver implementation from "arm/mach-exynos"
> to "drivers/soc/samsung". This driver is mainly used for setting misc
> bits of register from PMU IP of Exynos SoC which will be required to
> configure before Suspend/Resume. Currently all these settings are done
> in "arch/arm/mach-exynos/pmu.c" but moving ahead for ARM64 based SoC
> support, there is a need of this PMU driver in driver/* folder.
> 
> This driver uses existing DT binding information and there should
> be no functionality change in the supported platforms.
> 
> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
>  arch/arm/mach-exynos/Makefile                      |    2 +-
>  drivers/soc/Kconfig                                |    1 +
>  drivers/soc/Makefile                               |    1 +
>  drivers/soc/samsung/Kconfig                        |   20 ++++++++++++++++++++
>  drivers/soc/samsung/Makefile                       |    1 +
>  .../pmu.c => drivers/soc/samsung/exynos-pmu.c      |    0
>  6 files changed, 24 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/soc/samsung/Kconfig
>  create mode 100644 drivers/soc/samsung/Makefile
>  rename arch/arm/mach-exynos/pmu.c => drivers/soc/samsung/exynos-pmu.c (100%)
> 
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
> index bcefb54..b91b382 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -9,7 +9,7 @@ ccflags-$(CONFIG_ARCH_MULTIPLATFORM) += -I$(srctree)/$(src)/include -I$(srctree)
> 
>  # Core
> 
> -obj-$(CONFIG_ARCH_EXYNOS)	+= exynos.o pmu.o exynos-smc.o firmware.o
> +obj-$(CONFIG_ARCH_EXYNOS)	+= exynos.o exynos-smc.o firmware.o
> 
>  obj-$(CONFIG_EXYNOS_CPU_SUSPEND) += pm.o sleep.o
>  obj-$(CONFIG_PM_SLEEP)		+= suspend.o
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index 76d6bd4..90f33b9 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -3,5 +3,6 @@ menu "SOC (System On Chip) specific Drivers"
>  source "drivers/soc/qcom/Kconfig"
>  source "drivers/soc/ti/Kconfig"
>  source "drivers/soc/versatile/Kconfig"
> +source "drivers/soc/samsung/Kconfig"

Alphabetical order?

[...]

- Kukjin
