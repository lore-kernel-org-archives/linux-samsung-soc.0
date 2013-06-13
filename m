From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH V2 1/2] ARM: SAMSUNG: Add SAMSUNG_PM config option to
 select pm
Date: Thu, 13 Jun 2013 21:42:18 +0900
Message-ID: <151101ce6833$70efaf20$52cf0d60$%kim@samsung.com>
References: <1371036526-16589-1-git-send-email-amit.daniel@samsung.com>
 <1371036526-16589-2-git-send-email-amit.daniel@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:21102 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752864Ab3FMMmU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 08:42:20 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOC003N80MGKHA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jun 2013 21:42:19 +0900 (KST)
In-reply-to: <1371036526-16589-2-git-send-email-amit.daniel@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.abraham@linaro.org>, 'Abhilash Kesavan' <a.kesavan@samsung.com>

Amit Daniel wrote:
> 
> This patch enables the selection of samsung pm related stuffs
> when SAMSUNG_PM config is enabled and not just when generic PM
> config is enabled. Power management for s3c64XX and s3c24XX
> is enabled by default and for other platform depends on S5P_PM.
> This patch also fixes the following compilation error's when compiling
> a platform like exynos5440 which does not select pm stuffs.
> 
> arch/arm/mach-exynos/built-in.o: In function `__virt_to_phys':
> linux/arch/arm/include/asm/memory.h:175: undefined reference to
> `s3c_cpu_resume'
> linux/arch/arm/include/asm/memory.h:175: undefined reference to
> `s3c_cpu_resume'
> linux/arch/arm/include/asm/memory.h:175: undefined reference to
> `s3c_cpu_resume'
> linux/arch/arm/include/asm/memory.h:175: undefined reference to
> `s3c_cpu_resume'
> arch/arm/mach-exynos/built-in.o: In function `exynos5_init_irq':
> linux/arch/arm/mach-exynos/common.c:492: undefined reference to
> `s3c_irq_wake'
> linux/arch/arm/mach-exynos/common.c:492: undefined reference to
> `s3c_irq_wake'
> arch/arm/mach-exynos/built-in.o: In function `exynos4_init_irq':
> linux/arch/arm/mach-exynos/common.c:476: undefined reference to
> `s3c_irq_wake'
> linux/arch/arm/mach-exynos/common.c:476: undefined reference to
> `s3c_irq_wake'
> arch/arm/plat-samsung/built-in.o: In function `s3c_irqext_wake':
> linux/arch/arm/plat-samsung/pm.c:144: undefined reference to
> `s3c_irqwake_eintallow'
> linux/arch/arm/plat-samsung/pm.c:144: undefined reference to
> `s3c_irqwake_eintallow'
> arch/arm/plat-samsung/built-in.o: In function `s3c_pm_enter':
> linux/arch/arm/plat-samsung/pm.c:263: undefined reference to
> `s3c_irqwake_intallow'
> linux/arch/arm/plat-samsung/pm.c:263: undefined reference to
> `s3c_irqwake_intallow'
> linux/arch/arm/plat-samsung/pm.c:264: undefined reference to
> `s3c_irqwake_eintallow'
> linux/arch/arm/plat-samsung/pm.c:264: undefined reference to
> `s3c_irqwake_eintallow'
> linux/arch/arm/plat-samsung/pm.c:275: undefined reference to
> `s3c_pm_save_core'
> linux/arch/arm/plat-samsung/pm.c:279: undefined reference to
> `s3c_pm_configure_extint'
> linux/arch/arm/plat-samsung/pm.c:310: undefined reference to
> `s3c_pm_restore_core'
> make: *** [vmlinux] Error 1
> 
> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
> ---
>  arch/arm/mach-exynos/Makefile           |    2 +-
>  arch/arm/mach-exynos/common.c           |    2 +-
>  arch/arm/mach-exynos/common.h           |    1 -
>  arch/arm/mach-exynos/cpuidle.c          |    1 +
>  arch/arm/plat-samsung/Kconfig           |    7 +++++++
>  arch/arm/plat-samsung/Makefile          |    3 +--
>  arch/arm/plat-samsung/include/plat/pm.h |    8 ++++----
>  7 files changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Makefile b/arch/arm/mach-exynos/Makefile
> index 9811f87..3fa277a 100644
> --- a/arch/arm/mach-exynos/Makefile
> +++ b/arch/arm/mach-exynos/Makefile
> @@ -14,7 +14,7 @@ obj-				:=
> 
>  obj-$(CONFIG_ARCH_EXYNOS)	+= common.o
> 
> -obj-$(CONFIG_PM)		+= pm.o
> +obj-$(CONFIG_S5P_PM)		+= pm.o
>  obj-$(CONFIG_PM_GENERIC_DOMAINS) += pm_domains.o
>  obj-$(CONFIG_CPU_IDLE)		+= cpuidle.o
> 
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 9834357..d2b4f54 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -799,7 +799,7 @@ static struct irq_chip exynos_irq_eint = {
>  	.irq_mask_ack	= exynos_irq_eint_maskack,
>  	.irq_ack	= exynos_irq_eint_ack,
>  	.irq_set_type	= exynos_irq_eint_set_type,
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_S5P_PM

The 'S5P_PM' is used for plat-samsung/s5p-pm.c and s5p-irq-pm.c for s5pv210.

So there is no problem to use same name for exynos and s5pv210?...

- Kukjin
