From: Kukjin Kim <kgene.kim@samsung.com>
Subject: RE: [PATCH 1/2] ARM: S3C2410: H1940: Adapt h1940-bluetooth to gpiolib
 changes
Date: Tue, 16 Nov 2010 18:20:05 +0900
Message-ID: <010b01cb856f$77c05ab0$67411010$%kim@samsung.com>
References: <1289248308-21272-1-git-send-email-anarsoul@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:12926 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934022Ab0KPJTp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 16 Nov 2010 04:19:45 -0500
Received: from epmmp1 (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LBZ00EI30KV0880@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Nov 2010 18:19:43 +0900 (KST)
Received: from DOKGENEKIM02 ([12.23.103.104])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LBZ00BSN0KVY0@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 16 Nov 2010 18:19:43 +0900 (KST)
In-reply-to: <1289248308-21272-1-git-send-email-anarsoul@gmail.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Vasily Khoruzhick' <anarsoul@gmail.com>, 'Ben Dooks' <ben-linux@fluff.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Vasily Khoruzhick wrote:
> 
> Replace in s3c_gpio_cfgpull with s3c_gpio_setpull.
> 
> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> ---
>  arch/arm/mach-s3c2410/h1940-bluetooth.c |    8 ++++----
>  1 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/mach-s3c2410/h1940-bluetooth.c b/arch/arm/mach-
> s3c2410/h1940-bluetooth.c
> index 8aa2f19..6b86a72 100644
> --- a/arch/arm/mach-s3c2410/h1940-bluetooth.c
> +++ b/arch/arm/mach-s3c2410/h1940-bluetooth.c
> @@ -77,13 +77,13 @@ static int __devinit h1940bt_probe(struct
platform_device
> *pdev)
> 
>  	/* Configures BT serial port GPIOs */
>  	s3c_gpio_cfgpin(S3C2410_GPH(0), S3C2410_GPH0_nCTS0);
> -	s3c_gpio_cfgpull(S3C2410_GPH(0), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPH(0), S3C_GPIO_PULL_NONE);
>  	s3c_gpio_cfgpin(S3C2410_GPH(1), S3C2410_GPIO_OUTPUT);
> -	s3c_gpio_cfgpull(S3C2410_GPH(1), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPH(1), S3C_GPIO_PULL_NONE);
>  	s3c_gpio_cfgpin(S3C2410_GPH(2), S3C2410_GPH2_TXD0);
> -	s3c_gpio_cfgpull(S3C2410_GPH(2), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPH(2), S3C_GPIO_PULL_NONE);
>  	s3c_gpio_cfgpin(S3C2410_GPH(3), S3C2410_GPH3_RXD0);
> -	s3c_gpio_cfgpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
> +	s3c_gpio_setpull(S3C2410_GPH(3), S3C_GPIO_PULL_NONE);
> 
> 
>  	rfk = rfkill_alloc(DRV_NAME, &pdev->dev, RFKILL_TYPE_BLUETOOTH,
> --

You're right..will apply.

Thanks.

Best regards,
Kgene.
--
Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
SW Solution Development Team, Samsung Electronics Co., Ltd.
