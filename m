From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH v2 3/3] ARM: EXYNOS5: save CLK_TOP_SRC3 register before
 powergating
Date: Thu, 27 Dec 2012 16:23:31 +0100
Message-ID: <1630653.cgu5QYax72@amdc1227>
References: <CAPmaG0uqkRcoUBR8Gjv_+BSJ3hwxUCz0G-YKNQX=qvx83i6QOQ@mail.gmail.com>
 <1356006378-17441-4-git-send-email-prasanna.ps@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:23676 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752932Ab2L0PXo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 27 Dec 2012 10:23:44 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MFP00IID438A9J0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 00:23:34 +0900 (KST)
Received: from amdc1227.localnet ([106.116.147.199])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MFP00BSJ4385I10@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 28 Dec 2012 00:23:34 +0900 (KST)
In-reply-to: <1356006378-17441-4-git-send-email-prasanna.ps@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Prasanna Kumar <prasanna.ps@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, thomas.abraham@linaro.org

Hi Prasanna,

On Thursday 20 of December 2012 17:56:18 Prasanna Kumar wrote:
> This patch adds a software workaround to the hardware
> problem found in exynos5 while powergating.
> 
> It is observed that CLK_TOP_SRC3 register gets modified if
> the G-Scaler/MFC devices are power gated. The clock for G-Scaler gets
> set to XXTI which results in the device running very slow .
> A big drop in performance is noticed whilerunning the video.
> This issue also occurs while powergating MFC.
> 
> The value of clock source register is restored once the powergating
> operation is completed.
> 
> Signed-off-by: Prasanna Kumar <prasanna.ps@samsung.com>
> ---
>  arch/arm/mach-exynos/pm_domains.c |   27 +++++++++++++++++++++++++++
>  1 files changed, 27 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/pm_domains.c
> b/arch/arm/mach-exynos/pm_domains.c index 9f1351d..bd8a41e 100644
> --- a/arch/arm/mach-exynos/pm_domains.c
> +++ b/arch/arm/mach-exynos/pm_domains.c
> @@ -24,6 +24,8 @@
> 
>  #include <mach/regs-pmu.h>
>  #include <plat/devs.h>
> +#include <mach/regs-clock.h>
> +#include <plat/cpu.h>
> 
>  /*
>   * Exynos specific wrapper around the generic power domain
> @@ -41,6 +43,24 @@ static int exynos_pd_power(struct generic_pm_domain
> *domain, bool power_on) void __iomem *base;
>  	u32 timeout, pwr;
>  	char *op;
> +	u32 tmp = 0;
> +
> +	/*
> +	 *It is found that the CLK SRC register in exynos5
> +	 *gets modified when power domain of gsc/mfc/isp/disp1
> +	 *is powered off.This happens only after the system is
> +	 *suspended and resumed and not before that.
> +	 *The following fix adresses this hardware issue.
> +	 *It saves the value of clock source register and
> +	 *resores it later
> +	 */
> +
> +	if (of_machine_is_compatible("samsung,exynos5250")) {
> +		if (!power_on) {
> +			/* save clock source register */
> +			tmp = __raw_readl(EXYNOS5_CLKSRC_TOP3);

I really think this problem needs more investigation, but if gating
a power domain can really change a clock source register and save/restore 
when gating is really required, then the code must be reworked so it does 
not access clock registers directly.

At the moment it is not a problem, but we are going to have Exynos support 
for Common Clock Framework merged in near future and it will remove static 
mapping of clock registers.

Best regards,
-- 
Tomasz Figa
Samsung Poland R&D Center
SW Solution Development, Linux Platform
