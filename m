From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: Re: [PATCH 1/2] i2c-s3c2410: Convert to devm_kzalloc()
Date: Sat, 21 Jan 2012 16:59:15 +0100
Message-ID: <4F1AE0D3.6010803@gmail.com>
References: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:39792 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752328Ab2AUP7S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 21 Jan 2012 10:59:18 -0500
In-Reply-To: <1327152527-11364-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Jean Delvare <khali@linux-fr.org>, Wolfram Sang <w.sang@pengutronix.de>, Ben Dooks <ben-linux@fluff.org>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, linux-i2c@vger.kernel.org

On 01/21/2012 02:28 PM, Mark Brown wrote:
> Saves remembering to call kfree(). There's some kfree()s used by the
> resource still, these will be removed in 3.3 using the newly added
> devm_request_and_ioremap().
> 
> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

> ---
>   drivers/i2c/busses/i2c-s3c2410.c |    4 +---
>   1 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 4c17180..e6f982b 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -890,7 +890,7 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>   		}
>   	}
> 
> -	i2c = kzalloc(sizeof(struct s3c24xx_i2c), GFP_KERNEL);
> +	i2c = devm_kzalloc(&pdev->dev, sizeof(struct s3c24xx_i2c), GFP_KERNEL);
>   	if (!i2c) {
>   		dev_err(&pdev->dev, "no memory for state\n");
>   		return -ENOMEM;
> @@ -1035,7 +1035,6 @@ static int s3c24xx_i2c_probe(struct platform_device *pdev)
>   	clk_put(i2c->clk);
> 
>    err_noclk:
> -	kfree(i2c);
>   	return ret;
>   }
> 
> @@ -1061,7 +1060,6 @@ static int s3c24xx_i2c_remove(struct platform_device *pdev)
>   	release_resource(i2c->ioarea);
>   	s3c24xx_i2c_dt_gpio_free(i2c);
>   	kfree(i2c->ioarea);
> -	kfree(i2c);
> 
>   	return 0;
>   }

-- 

Thanks!
Sylwester
