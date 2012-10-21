From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: exynos4-dt: Set .smp field of machine
 descriptor
Date: Mon, 22 Oct 2012 08:50:01 +0900
Message-ID: <04c801cdafe6$c96e2470$5c4a6d50$%kim@samsung.com>
References: <1350035378-31989-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21925 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753211Ab2JUXuG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Oct 2012 19:50:06 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout4.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MC900CQAOVEGIA0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Oct 2012 08:50:03 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MC900JFKOVE0C40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 22 Oct 2012 08:50:03 +0900 (KST)
In-reply-to: <1350035378-31989-1-git-send-email-t.figa@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Tomasz Figa' <t.figa@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, m.szyprowski@samsung.com, tomasz.figa@gmail.com, thomas.abraham@linaro.org

Tomasz Figa wrote:
> 
> This patch adds missing initializer of .smp field of machine descriptor
> of Exynos 4 DT machine.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-exynos4-dt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-
> exynos/mach-exynos4-dt.c
> index 7222e3c..d6bdcfb 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -119,6 +119,7 @@ static char const *exynos4_dt_compat[] __initdata = {
> 
>  DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device
Tree)")
>  	/* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
> +	.smp		= smp_ops(exynos_smp_ops),
>  	.init_irq	= exynos4_init_irq,
>  	.map_io		= exynos4_dt_map_io,
>  	.handle_irq	= gic_handle_irq,
> --
> 1.7.12

Yes, right. Applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
