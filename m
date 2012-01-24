From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: Exynos4: fix non-SMP builds
Date: Tue, 24 Jan 2012 21:41:20 +0900
Message-ID: <02f201ccda95$796e8450$6c4b8cf0$%kim@samsung.com>
References: <1327311688-5856-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36776 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753247Ab2AXMl0 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Jan 2012 07:41:26 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LYA00AJYZ8T2G40@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 24 Jan 2012 21:41:24 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LYA00K6YZ8WHXB0@mmp2.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Tue, 24 Jan 2012 21:41:22 +0900 (KST)
In-reply-to: <1327311688-5856-1-git-send-email-m.szyprowski@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Marek Szyprowski' <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Kyungmin Park' <kyungmin.park@samsung.com>

Marek Szyprowski wrote:
> 
> This patch fixes the following build issue, which happens only if SMP
> has been disabled:
> 
> arch/arm/mach-exynos/built-in.o: In function `exynos4_pm_resume':
> arch/arm/mach-exynos/pm.c:387: undefined reference to `scu_enable'
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/mach-exynos/pm.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/pm.c b/arch/arm/mach-exynos/pm.c
> index 9a13af5..7a737c6 100644
> --- a/arch/arm/mach-exynos/pm.c
> +++ b/arch/arm/mach-exynos/pm.c
> @@ -388,7 +388,9 @@ static void exynos4_pm_resume(void)
> 
>  	exynos4_restore_pll();
> 
> +#ifdef CONFIG_SMP
>  	scu_enable(S5P_VA_SCU);
> +#endif
> 
>  #ifdef CONFIG_CACHE_L2X0
>  	s3c_pm_do_restore_core(exynos4_l2cc_save, ARRAY_SIZE(exynos4_l2cc_save));
> --
> 1.7.1.569.g6f426

OK, will apply.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
