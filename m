From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Add dp clock support for EXYNOS5
Date: Mon, 17 Sep 2012 19:41:18 +0900
Message-ID: <04f601cd94c0$f8918350$e9b489f0$%kim@samsung.com>
References: <006601cd917c$00b07930$02116b90$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41415 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753804Ab2IQKlU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Sep 2012 06:41:20 -0400
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MAH00FSKPOI2FQ0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 19:41:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MAH0025DPOVQL90@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 17 Sep 2012 19:41:19 +0900 (KST)
In-reply-to: <006601cd917c$00b07930$02116b90$%han@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Jingoo Han' <jg1.han@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

Jingoo Han wrote:
> 
> Add dp clock instance for EXYNOS5 dp controller.
> 
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> ---
>  arch/arm/mach-exynos/clock-exynos5.c |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/clock-exynos5.c b/arch/arm/mach-
> exynos/clock-exynos5.c
> index eb3f4fc..d688abe 100644
> --- a/arch/arm/mach-exynos/clock-exynos5.c
> +++ b/arch/arm/mach-exynos/clock-exynos5.c
> @@ -683,6 +683,11 @@ static struct clk exynos5_init_clocks_off[] = {
>  		.enable		= exynos5_clk_ip_disp1_ctrl,
>  		.ctrlbit	= (1 << 5),
>  	}, {
> +		.name		= "dp",
> +		.devname	= "exynos-dp",
> +		.enable		= exynos5_clk_ip_disp1_ctrl,
> +		.ctrlbit	= (1 << 4),
> +	}, {
>  		.name		= "jpeg",
>  		.enable		= exynos5_clk_ip_gen_ctrl,
>  		.ctrlbit	= (1 << 2),
> --
> 1.7.1

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
