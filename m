From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] GPIO: Samsung: fix broken configuration for Exynos4 GPIO
 banks
Date: Thu, 22 Sep 2011 11:05:56 -0600
Message-ID: <20110922170556.GH17168@ponder.secretlab.ca>
References: <1316685759-14401-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:51635 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751901Ab1IVRGB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Sep 2011 13:06:01 -0400
Received: by ywb5 with SMTP id 5so2115653ywb.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 22 Sep 2011 10:06:00 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1316685759-14401-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Angus Ainslie <angus.ainslie@linaro.org>

On Thu, Sep 22, 2011 at 12:02:39PM +0200, Marek Szyprowski wrote:
> Commit 1b39d5f2cc introduced new common gpio driver for all Samsung GPIO
> SoCs. The new driver doesn't work correctly on Samsung Exynos4 SoC. It
> fails to set configuration for all but external interrupt pins. This
> patch fixes this issue.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
>  drivers/gpio/gpio-samsung.c |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung.c
> index 36f3675..be13580 100644
> --- a/drivers/gpio/gpio-samsung.c
> +++ b/drivers/gpio/gpio-samsung.c
> @@ -446,6 +446,8 @@ static struct samsung_gpio_cfg s3c24xx_gpiocfg_banka = {
>  static struct samsung_gpio_cfg exynos4_gpio_cfg = {
>  	.set_pull	= exynos4_gpio_setpull,
>  	.get_pull	= exynos4_gpio_getpull,
> +	.set_config	= samsung_gpio_setcfg_4bit,
> +	.get_config	= samsung_gpio_getcfg_4bit,
>  };
>  
>  static struct samsung_gpio_cfg s5p64x0_gpio_cfg_rbank = {
> -- 
> 1.7.1.569.g6f426
> 
