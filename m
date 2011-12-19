From: Tushar Behera <tushar.behera@linaro.org>
Subject: Re: [PATCH] i2c-s3c2410: Fix return code of s3c24xx_i2c_parse_dt_gpio
Date: Mon, 19 Dec 2011 09:35:44 +0530
Message-ID: <4EEEB818.406@linaro.org>
References: <1323425035-11298-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:43495 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752339Ab1LSEFu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Dec 2011 23:05:50 -0500
In-Reply-To: <1323425035-11298-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, kgene.kim@samsung.com, linaro-dev@lists.linaro.org, patches@linaro.org, thomas.abraham@linaro.org

Ping

On 12/09/2011 03:33 PM, Tushar Behera wrote:
> s3c24xx_i2c_parse_dt_gpio is called when cfg_gpio is not defined
> in the platform data of the i2c device. When DT is not enabled,
> the above function always returns -EINVAL. Since there can be
> some i2c devices which don't need to configure any gpio lines,
> the probe of such devices would fail here. Changing the default
> return value to success would fix this issue.
>
> Signed-off-by: Tushar Behera<tushar.behera@linaro.org>
> ---
> This patch is rebased on Kukjin's for-next branch.
> d3d936c "Merge branch 'samsung-fixes-2' into for-next"
>
>   drivers/i2c/busses/i2c-s3c2410.c |    2 +-
>   1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 2754cef..b5caa42 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -786,7 +786,7 @@ static void s3c24xx_i2c_dt_gpio_free(struct s3c24xx_i2c *i2c)
>   #else
>   static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
>   {
> -	return -EINVAL;
> +	return 0;
>   }
>
>   static void s3c24xx_i2c_dt_gpio_free(struct s3c24xx_i2c *i2c)


-- 
Tushar Behera
