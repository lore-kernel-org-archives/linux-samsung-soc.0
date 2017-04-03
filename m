From: Andrzej Hajda <a.hajda@samsung.com>
Subject: Re: [PATCH] i2c: exynos5: use core helper to get driver data
Date: Mon, 03 Apr 2017 12:07:31 +0200
Message-ID: <01e0c360-81a4-9533-a024-f6ce716c322c@samsung.com>
References: <CGME20170224133606eucas1p2c3c6afb60b9e39ad501c1ddbdbfc180f@eucas1p2.samsung.com>
 <1487943360-6421-1-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:48757 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751933AbdDCKHg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 06:07:36 -0400
In-reply-to: <1487943360-6421-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Wolfram Sang <wsa@the-dreams.de>, Krzysztof Kozlowski <krzk@kernel.org>, Javier Martinez Canillas <javier@osg.samsung.com>, linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>

Hi Wolfram,

Gently ping.

Regards
Andrzej


On 24.02.2017 14:36, Andrzej Hajda wrote:
> Driver core provides of_device_get_match_data which can be used
> to get driver data instead of custom helper.
>
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index bc2b5db..de3b6af 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -22,6 +22,7 @@
>  #include <linux/slab.h>
>  #include <linux/io.h>
>  #include <linux/of_address.h>
> +#include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/spinlock.h>
>  
> @@ -201,7 +202,7 @@ struct exynos5_i2c {
>  	unsigned int		op_clock;
>  
>  	/* Version of HS-I2C Hardware */
> -	struct exynos_hsi2c_variant	*variant;
> +	const struct exynos_hsi2c_variant *variant;
>  };
>  
>  /**
> @@ -247,15 +248,6 @@ static const struct of_device_id exynos5_i2c_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
>  
> -static inline struct exynos_hsi2c_variant *exynos5_i2c_get_variant
> -					(struct platform_device *pdev)
> -{
> -	const struct of_device_id *match;
> -
> -	match = of_match_node(exynos5_i2c_match, pdev->dev.of_node);
> -	return (struct exynos_hsi2c_variant *)match->data;
> -}
> -
>  static void exynos5_i2c_clr_pend_irq(struct exynos5_i2c *i2c)
>  {
>  	writel(readl(i2c->regs + HSI2C_INT_STATUS),
> @@ -773,8 +765,7 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>  		goto err_clk;
>  	}
>  
> -	/* Need to check the variant before setting up. */
> -	i2c->variant = exynos5_i2c_get_variant(pdev);
> +	i2c->variant = of_device_get_match_data(&pdev->dev);
>  
>  	ret = exynos5_hsi2c_clock_setup(i2c);
>  	if (ret)
