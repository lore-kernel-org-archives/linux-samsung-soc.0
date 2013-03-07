From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] ARM: SAMSUNG: Set clock parent if provided
Date: Thu, 07 Mar 2013 16:35:22 +0100
Message-ID: <5138B3BA.9040303@samsung.com>
References: <1362634301-9706-1-git-send-email-shaik.ameer@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:52623 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753075Ab3CGPfZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Mar 2013 10:35:25 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MJA00IRKR99QNA0@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 15:35:23 +0000 (GMT)
Received: from [106.116.147.32] by eusync3.samsung.com
 (Oracle Communications Messaging Server 7u4-23.01(7.0.4.23.0) 64bit (built Aug
 10 2011)) with ESMTPA id <0MJA005ALRAY2E90@eusync3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 07 Mar 2013 15:35:23 +0000 (GMT)
In-reply-to: <1362634301-9706-1-git-send-email-shaik.ameer@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Shaik Ameer Basha <shaik.ameer@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, shaik.samsung@gmail.com

On 03/07/2013 06:31 AM, Shaik Ameer Basha wrote:
> s3c_set_clksrc() updates the clock source as per u-boot settings.
> This patch adds the functionality to overwrite u-boot settings,
> if user provides the clock parent field. In case of wrong source
> provided by the user, it will retain the u-boot settings.
> 
> Signed-off-by: Shaik Ameer Basha <shaik.ameer@samsung.com>
> ---
>  arch/arm/plat-samsung/clock-clksrc.c |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/plat-samsung/clock-clksrc.c b/arch/arm/plat-samsung/clock-clksrc.c
> index 786a410..4fecd80 100644
> --- a/arch/arm/plat-samsung/clock-clksrc.c
> +++ b/arch/arm/plat-samsung/clock-clksrc.c
> @@ -150,7 +150,12 @@ void __init_or_cpufreq s3c_set_clksrc(struct clksrc_clk *clk, bool announce)
>  		return;
>  	}
>  
> -	clk->clk.parent = srcs->sources[clksrc];
> +	if (clk->clk.parent) {
> +		if (s3c_setparent_clksrc(&clk->clk, clk->clk.parent))
> +			clk->clk.parent = srcs->sources[clksrc];
> +	} else {
> +		clk->clk.parent = srcs->sources[clksrc];
> +	}

May I ask what do you need this for ? This code won't be used for
Exynos4 and Exynos5 SoCs starting from 3.10. And it is going to be
removed once other platforms are converted to the new Samsung clocks
driver.

Regards,
Sylwester
