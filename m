From: KyongHo Cho <pullip.cho@samsung.com>
Subject: Re: [PATCH 0/4 v2] iommu/exynos: Add IOMMU and Enhance System MMU
 driver for Exynos4
Date: Mon, 26 Sep 2011 19:24:14 +0900
Message-ID: <CAHQjnOODq2bSzSYA9QT8fZagD5sxwtgVytR7Sv2s09wYao=pVA@mail.gmail.com>
References: <CAHQjnOMCU26ELOpn7h7hcju-s970SSG5E545rPgCpw3_LkkAhA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:45775 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752282Ab1IZKYQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Sep 2011 06:24:16 -0400
In-Reply-To: <CAHQjnOMCU26ELOpn7h7hcju-s970SSG5E545rPgCpw3_LkkAhA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Linux ARM Kernel <linux-arm-kernel@lists.infradead.org>, Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>, iommu@lists.linux-foundation.org, Linux-Kernel <linux-kernel@vger.kernel.org>
Cc: Russell King <linux@arm.linux.org.uk>, Joerg Roedel <joerg.roedel@amd.com>, Sanghyun Lee <sanghyun75.lee@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Younglak Kim <younglak1004.kim@samsung.com>, Ohad Ben-Cohen <ohad@wizery.com>

I am sorry :(

My mailer converted tabs into spaces.

Moreover, git send-email is not available now.

I stopped sending patches after sending "[PATCH 1/4 v2]".

I will submit the complete patches after everything becomes OK.

Sorry for disrupting.

Regards,
Cho KyongHo.

On Mon, Sep 26, 2011 at 7:00 PM, KyongHo Cho <pullip.cho@samsung.com> w=
rote:
> This is the second try of submitting patches about IOMMU/System MMU
> driver for Exynos4 SoCs with the fixes of the following problems
> pointed by Russell King.:
> =A0- Missing unlocking a spinlock in exynos_iommu_attach_dev().
> =A0- atomic_t -> int in sysmmu_drvdata.activations
> =A0- sysmmu_platdata -> sysmmu_drvdata
> =A0- Change in error messages in irq handler
> =A0- Removed casting in format of error message
> =A0- omap_iommu_ops -> exynos_iommu_ops in the last patch.
>
> First 2 patches enhance System MMU platform device definition:
> =A0- Removed System MMU for MDMA0 in LCD block because it is not used=
=2E
> =A0Use MDMA2 in TOP block.
> =A0- Removed System MMU ID. Instead a System MMU is bound to a device=
 that
> =A0the System MMU is dedicated during machin initialization. If a dev=
ice
> =A0driver wants to handle System MMU, it must bind its device with Sy=
stem
> =A0MMU with sysmmu_set_owner().
> =A0- clkdev
> =A0- System MMU device driver is removed from arch/arm/plat-s5p to mo=
ve it
> =A0to driver/iommu directory.
> Last 2 patches implements IOMMU API:
> =A0- Implements IOMMU API and System MMU driver that is moved from
> =A0arch/arm/plat-s5p.
> =A0- Implements fault handling that is suggested by Ohad.
> =A0- Used bus_set_iommu instead of register_iommu that is suggested b=
y Joerg.
>
> Regards,
> Cho KyongHo.
>
> Diffstats:
>
> arch/arm/mach-exynos4/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A02 =
-
> arch/arm/mach-exynos4/clock.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 43 +-
> arch/arm/mach-exynos4/dev-sysmmu.c =A0 =A0 =A0 =A0 =A0| =A0270 ++----=
--
> arch/arm/mach-exynos4/include/mach/irqs.h =A0 | =A0 =A01 -
> arch/arm/mach-exynos4/include/mach/map.h =A0 =A0| =A0 =A01 -
> arch/arm/mach-exynos4/include/mach/sysmmu.h | =A0 85 ++-
> arch/arm/mach-exynos4/mach-armlex4210.c =A0 =A0 | =A0 24 +-
> arch/arm/mach-exynos4/mach-smdkv310.c =A0 =A0 =A0 | =A0 28 +-
> arch/arm/plat-s5p/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
8 -
> arch/arm/plat-s5p/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A0=
1 -
> arch/arm/plat-s5p/include/plat/sysmmu.h =A0 =A0 | =A0 95 ---
> arch/arm/plat-s5p/sysmmu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A031=
2 ---------
> drivers/iommu/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 14 +
> drivers/iommu/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A01 +
> drivers/iommu/exynos_iommu.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0933 =
+++++++++++++++++++++++++++
> 15 files changed, 1134 insertions(+), 684 deletions(-)
>
