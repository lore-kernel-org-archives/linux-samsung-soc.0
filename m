From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] mfd: sec-core: add missing sec_irq_init() return value
 checking
Date: Thu, 07 Aug 2014 18:48:52 +0200
Message-ID: <2156078.GxeZgK3rLH@amdc1032>
References: <2486284.NeLpWWu75g@amdc1032>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:8993 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932330AbaHGQs4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 7 Aug 2014 12:48:56 -0400
In-reply-to: <2486284.NeLpWWu75g@amdc1032>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Samuel Ortiz <sameo@linux.intel.com>
Cc: Lee Jones <lee.jones@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org


[ added missing linux-samsung-soc ML, sorry for the noise ]

On Thursday, August 07, 2014 06:44:18 PM Bartlomiej Zolnierkiewicz wrote:
> sec_irq_init() can fail if it encounters unknown device type or
> on regmap_add_irq_chip() error.  Add missing sec_irq_init() return
> value checking to sec_pmic_probe().
> 
> Tested on Insignal's Exynos4412 based Origen board.
> 
> Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Cc: Sangbeom Kim <sbkim73@samsung.com>
> Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
> patch is against next-20140804 branch of linux-next kernel
> 
>  drivers/mfd/sec-core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mfd/sec-core.c b/drivers/mfd/sec-core.c
> index dba7e2b..f498867 100644
> --- a/drivers/mfd/sec-core.c
> +++ b/drivers/mfd/sec-core.c
> @@ -353,7 +353,9 @@ static int sec_pmic_probe(struct i2c_client *i2c,
>  	if (pdata && pdata->cfg_pmic_irq)
>  		pdata->cfg_pmic_irq();
>  
> -	sec_irq_init(sec_pmic);
> +	ret = sec_irq_init(sec_pmic);
> +	if (ret)
> +		return ret;
>  
>  	pm_runtime_set_active(sec_pmic->dev);
