From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH] ARM: SAMSUNG: Fixup prevent bug related to 'Unchecked
 return value'
Date: Thu, 01 Mar 2012 13:39:18 +0900
Message-ID: <077001ccf765$438ccbc0$caa66340$%kim@samsung.com>
References: <018e01cce88b$0501bd40$0f0537c0$@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:40662 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756607Ab2CAEjU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:39:20 -0500
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0M0600LN1VLHDCA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:39:19 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.119.152])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0M0600A8EVLIFB80@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Thu, 01 Mar 2012 13:39:19 +0900 (KST)
In-reply-to: <018e01cce88b$0501bd40$0f0537c0$@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Huisung Kang' <hs1218.kang@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

Huisung Kang wrote:
> 
> 
> [prevent bug]
> In s5p_pmu_init(): Value returned from a function is not checked for
> erros before being used.
> 
> Signed-off-by: Huisung Kang <hs1218.kang@samsung.com>
> ---
>  arch/arm/plat-samsung/devs.c |    9 ++++++++-
>  1 files changed, 8 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index 3e38dc4..3e6e1f2 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -1092,7 +1092,14 @@ struct platform_device s5p_device_pmu = {
> 
>  static int __init s5p_pmu_init(void)
>  {
> -	platform_device_register(&s5p_device_pmu);
> +	int ret;
> +
> +	ret = platform_device_register(&s5p_device_pmu);
> +	if (ret) {
> +		pr_warning("s5p_pmu_init: pmu device not registered.\n");
> +		return ret;
> +	}
> +
>  	return 0;
>  }
>  arch_initcall(s5p_pmu_init);
> --
> 1.7.1

I think, in this case, following can be used instead.

	return platform_device_register(&s5p_device_pmu);

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
