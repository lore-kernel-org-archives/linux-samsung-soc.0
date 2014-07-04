From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Fix the check for non-smp configuration
Date: Fri, 04 Jul 2014 17:32:52 +0900
Message-ID: <032801cf9762$8be518b0$a3af4a10$@samsung.com>
References: <1404363812-26307-1-git-send-email-a.kesavan@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10158 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750999AbaGDIcy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Jul 2014 04:32:54 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N8600BJIIESU6A0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 04 Jul 2014 17:32:52 +0900 (KST)
In-reply-to: <1404363812-26307-1-git-send-email-a.kesavan@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Abhilash Kesavan' <a.kesavan@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: olof@lixom.net, arnd@arndb.de, kesavan.abhilash@gmail.com

Abhilash Kesavan wrote:
> 
> Commit 1754c42e3db5("ARM: exynos: move sysram info to exynos.c") missed
> out the CONFIG_ prefix causing exynos_sysram_init() to get called twice
> for SMP configurations.
> 
> Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
> ---
>  arch/arm/mach-exynos/exynos.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
> index f38cf7c..95cad25 100644
> --- a/arch/arm/mach-exynos/exynos.c
> +++ b/arch/arm/mach-exynos/exynos.c
> @@ -297,7 +297,7 @@ static void __init exynos_dt_machine_init(void)
>  	 * This is called from smp_prepare_cpus if we've built for SMP, but
>  	 * we still need to set it up for PM and firmware ops if not.
>  	 */
> -	if (!IS_ENABLED(SMP))
> +	if (!IS_ENABLED(CONFIG_SMP))
>  		exynos_sysram_init();
> 
>  	exynos_cpuidle_init();
> --
> 1.7.9.5

Oh, OK. will apply into fixes.

Thanks,
Kukjin
