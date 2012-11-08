From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/1] ARM: EXYNOS: Make combiner_of_init function static
Date: Thu, 08 Nov 2012 13:52:55 +0900
Message-ID: <0cef01cdbd6c$eae869b0$c0b93d10$%kim@samsung.com>
References: <1352282058-13868-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:19365 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754944Ab2KHEw4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Nov 2012 23:52:56 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MD5007HYK84V8H0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 13:52:56 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.199])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MD500BKVK87G400@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 08 Nov 2012 13:52:55 +0900 (KST)
In-reply-to: <1352282058-13868-1-git-send-email-sachin.kamat@linaro.org>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Sachin Kamat' <sachin.kamat@linaro.org>, linux-samsung-soc@vger.kernel.org
Cc: patches@linaro.org

Sachin Kamat wrote:
> 
> Silences the following warning:
> arch/arm/mach-exynos/common.c:576:12: warning:
> symbol 'combiner_of_init' was not declared. Should it be static?
> 
> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
> ---
>  arch/arm/mach-exynos/common.c |    3 ++-
>  1 files changed, 2 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
> index 4e577f6..5b35d71 100644
> --- a/arch/arm/mach-exynos/common.c
> +++ b/arch/arm/mach-exynos/common.c
> @@ -573,7 +573,8 @@ static void __init combiner_init(void __iomem
> *combiner_base,
>  }
> 
>  #ifdef CONFIG_OF
> -int __init combiner_of_init(struct device_node *np, struct device_node
> *parent)
> +static int __init combiner_of_init(struct device_node *np,
> +				   struct device_node *parent)
>  {
>  	void __iomem *combiner_base;
> 
> --
> 1.7.4.1

Applied, thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
