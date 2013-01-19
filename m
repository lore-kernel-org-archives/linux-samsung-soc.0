From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: Re: [PATCH] i2c: s3c2410: Add quirk to exclude GPIO config for exynos5440
Date: Sat, 19 Jan 2013 11:52:44 +0100
Message-ID: <1786045.3qNF5pjnvJ@flatron>
References: <1358572323-24486-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f182.google.com ([209.85.215.182]:37554 "EHLO
	mail-ea0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751723Ab3ASKwo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 19 Jan 2013 05:52:44 -0500
In-Reply-To: <1358572323-24486-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org, Wolfram Sang <w.sang@pengutronix.de>, Giridhar Maruthy <giridhar.m@samsung.com>

Hi Kukjin,

You should also add the new compatible value to the documentation of 
device tree bindings for i2c-s3c2410.

(Documentation/devicetree/bindings/i2c/i2c-s3c2410.txt)

Best regards,
Tomasz Figa

On Friday 18 of January 2013 21:12:03 Kukjin Kim wrote:
> From: Giridhar Maruthy <giridhar.m@samsung.com>
> 
> Signed-off-by: Giridhar Maruthy <giridhar.m@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c
> b/drivers/i2c/busses/i2c-s3c2410.c index a290d08..ec141b4 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -109,6 +109,8 @@ MODULE_DEVICE_TABLE(platform, s3c24xx_driver_ids);
>  static const struct of_device_id s3c24xx_i2c_match[] = {
>  	{ .compatible = "samsung,s3c2410-i2c", .data = (void *)0 },
>  	{ .compatible = "samsung,s3c2440-i2c", .data = (void *)QUIRK_S3C2440
> }, +	{ .compatible = "samsung,exynos5440-i2c",
> +	  .data = (void *)(QUIRK_S3C2440 | QUIRK_NO_GPIO) },
>  	{ .compatible = "samsung,s3c2440-hdmiphy-i2c",
>  	  .data = (void *)(QUIRK_S3C2440 | QUIRK_HDMIPHY | QUIRK_NO_GPIO) },
>  	{},
