From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: exynos4-dt: Set .smp field of machine descriptor
Date: Sun, 21 Oct 2012 09:22:55 -0700 (PDT)
Message-ID: <2064474.beoN9hr7Vi@flatron>
References: <1350035378-31989-1-git-send-email-t.figa@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:47164 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753376Ab2JUQW5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 21 Oct 2012 12:22:57 -0400
Received: by mail-wi0-f172.google.com with SMTP id hq12so1718800wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Oct 2012 09:22:56 -0700 (PDT)
In-Reply-To: <1350035378-31989-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, thomas.abraham@linaro.org

On Friday 12 of October 2012 11:49:38 Tomasz Figa wrote:
> This patch adds missing initializer of .smp field of machine descriptor
> of Exynos 4 DT machine.
> 
> Signed-off-by: Tomasz Figa <t.figa@samsung.com>
> ---
>  arch/arm/mach-exynos/mach-exynos4-dt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c
> b/arch/arm/mach-exynos/mach-exynos4-dt.c index 7222e3c..d6bdcfb 100644
> --- a/arch/arm/mach-exynos/mach-exynos4-dt.c
> +++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
> @@ -119,6 +119,7 @@ static char const *exynos4_dt_compat[] __initdata =
> {
> 
>  DT_MACHINE_START(EXYNOS4210_DT, "Samsung Exynos4 (Flattened Device
> Tree)") /* Maintainer: Thomas Abraham <thomas.abraham@linaro.org> */
> +	.smp		= smp_ops(exynos_smp_ops),
>  	.init_irq	= exynos4_init_irq,
>  	.map_io		= exynos4_dt_map_io,
>  	.handle_irq	= gic_handle_irq,

Ping. I think this should be considered a fix.

Best regards,
Tomasz Figa
