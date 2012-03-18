From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH 1/3] i2c-s3c2410: Drop unused define
Date: Sun, 18 Mar 2012 20:49:37 +0000
Message-ID: <20120318204937.0F6AB3E07BF@localhost>
References: <1331657679-31302-1-git-send-email-k.lewandowsk@samsung.com> <1331657679-31302-2-git-send-email-k.lewandowsk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f172.google.com ([209.85.212.172]:41638 "EHLO
	mail-wi0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753067Ab2CRUtl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 18 Mar 2012 16:49:41 -0400
Received: by wibhj6 with SMTP id hj6so3020531wib.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 18 Mar 2012 13:49:40 -0700 (PDT)
In-Reply-To: <1331657679-31302-2-git-send-email-k.lewandowsk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org
Cc: thomas.abraham@linaro.org, m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-samsung-soc@vger.kernel.org, t.stanislaws@samsung.com, Karol Lewandowski <k.lewandowsk@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

On Tue, 13 Mar 2012 17:54:37 +0100, Karol Lewandowski <k.lewandowsk@samsung.com> wrote:
> Use standard of_match_ptr() to avoid defining variable unused
> in non device tree builds.
> 
> Signed-off-by: Karol Lewandowski <k.lewandowsk@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>

Acked-by: Grant Likely <grant.likely@secretlab.ca>

> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    4 +---
>  1 files changed, 1 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 737f721..85e3664 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -1128,8 +1128,6 @@ static const struct of_device_id s3c24xx_i2c_match[] = {
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, s3c24xx_i2c_match);
> -#else
> -#define s3c24xx_i2c_match NULL
>  #endif
>  
>  static struct platform_driver s3c24xx_i2c_driver = {
> @@ -1140,7 +1138,7 @@ static struct platform_driver s3c24xx_i2c_driver = {
>  		.owner	= THIS_MODULE,
>  		.name	= "s3c-i2c",
>  		.pm	= S3C24XX_DEV_PM_OPS,
> -		.of_match_table = s3c24xx_i2c_match,
> +		.of_match_table = of_match_ptr(s3c24xx_i2c_match),
>  	},
>  };
>  
> -- 
> 1.7.9
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/

-- 
Grant Likely, B.Sc, P.Eng.
Secret Lab Technologies,Ltd.
