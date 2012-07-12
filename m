From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: EXYNOS: Make combiner_init function static
Date: Thu, 12 Jul 2012 18:10:09 +0900
Message-ID: <0faa01cd600e$22d2ee70$6878cb50$%kim@samsung.com>
References: <1341574743-3897-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28588 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932960Ab2GLJKK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Jul 2012 05:10:10 -0400
Received: from epcpsbgm1.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M71008YHISSQTW0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:10:09 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M71004P0ISXPI30@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Jul 2012 18:10:09 +0900 (KST)
In-reply-to: <1341574743-3897-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Fixes the following warning:
> arch/arm/mach-exynos/common.c:543:13:
> warning: symbol 'combiner_init' was not declared. Should it be static?
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/common.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 0ec1a91..66d71ba 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -540,7 +540,8 @@ static struct irq_domain_ops combiner_irq_domain_ops =
> {
>  	.map	= combiner_irq_domain_map,
>  };
> 
> -void __init combiner_init(void __iomem *combiner_base, struct device_node
> *np)
> +static void __init combiner_init(void __iomem *combiner_base,
> +				struct device_node *np)
>  {
>  	int i, irq, irq_base;
>  	unsigned int max_nr, nr_irq;
> --
> 1.7.4.1

OK, applied.
Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
