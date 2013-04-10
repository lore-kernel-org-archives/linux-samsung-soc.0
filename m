From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH] rtc: rtc-s3c: use clk_prepare_enable and
 clk_disable_unprepare
Date: Wed, 10 Apr 2013 11:50:28 +0200
Message-ID: <516535E4.5060308@samsung.com>
References: <1365517660-9322-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:42950 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751622Ab3DJJub (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Apr 2013 05:50:31 -0400
In-reply-to: <1365517660-9322-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: rtc-linux@googlegroups.com, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, a.zummo@towertech.it, kgene.kim@samsung.com, thomas.ab@samsung.com, dianders@chromium.org, Thomas Abraham <thomas.abraham@linaro.org>

On 04/09/2013 04:27 PM, Vivek Gautam wrote:
> From: Thomas Abraham <thomas.abraham@linaro.org>
> 
> Convert clk_enable/clk_disable to clk_prepare_enable/clk_disable_unprepare
> calls as required by common clock framework.
> 
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>

Thanks Vivek.

Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
> 
> The v1 of this patch is pretty old, but the change needs to be merged to
> avoid getting those needless WARN_ON() dumps on console.
> 
> Changes from v1:
>  - Not using clk_disable_unprepare() at the end of s3c_rtc_probe(), since
>    this will unprepare the rtc clock which is again getting used in other
>    funtions later.
>  - Using clk_unprepare() at the remove() instead to fix things up.
> 
>  drivers/rtc/rtc-s3c.c |    5 +++--
>  1 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index fb994e9..e3528c9 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -430,6 +430,7 @@ static int s3c_rtc_remove(struct platform_device *dev)
>  
>  	s3c_rtc_setaie(&dev->dev, 0);
>  
> +	clk_unprepare(rtc_clk);
>  	rtc_clk = NULL;
>  
>  	return 0;
> @@ -498,7 +499,7 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	clk_enable(rtc_clk);
> +	clk_prepare_enable(rtc_clk);
>  
>  	/* check to see if everything is setup correctly */
>  
> @@ -578,7 +579,7 @@ static int s3c_rtc_probe(struct platform_device *pdev)
>  
>   err_nortc:
>  	s3c_rtc_enable(pdev, 0);
> -	clk_disable(rtc_clk);
> +	clk_disable_unprepare(rtc_clk);
>  
>  	return ret;
>  }
