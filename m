From: "HeungJun, Kim" <riverful.kim@samsung.com>
Subject: RE: Exynos4: Fix the I2C.0 platform device's ID to 0 in the devs.c
Date: Tue, 15 May 2012 13:04:03 +0900
Message-ID: <002a01cd324f$c4384680$4ca8d380$%kim@samsung.com>
References: <1335785096-5430-1-git-send-email-riverful.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27025 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750767Ab2EOEEJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 15 May 2012 00:04:09 -0400
Received: from epcpsbgm2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M4100EWMPYLUM00@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 13:04:08 +0900 (KST)
Received: from NORIVERFULK04 ([165.213.219.118])
 by mmp2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0M4100GI6PYWLHD0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 15 May 2012 13:04:08 +0900 (KST)
In-reply-to: <1335785096-5430-1-git-send-email-riverful.kim@samsung.com>
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: "'HeungJun, Kim'" <riverful.kim@samsung.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, 'Kyungmin Park' <kyungmin.park@samsung.com>

and Ping again?

> -----Original Message-----
> From: HeungJun, Kim [mailto:riverful.kim@samsung.com]
> Sent: Monday, April 30, 2012 8:25 PM
> To: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org; HeungJun, Kim; Kyungmin Park
> Subject: ARM: Exynos4: Fix the I2C.0 platform device's ID to 0 in the devs.c
> 
> From: "HeungJun, Kim" <riverful.kim@samsung.com>
> 
> The #ifdef of CONFIG_S3C_DEV_I2C1 in devs.c, occurs to fail to get I2C0
adapter.
> So, this patch removes #ifdef, and fixes 0 when I2C0 devices.
> 
> Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  arch/arm/plat-samsung/devs.c |    4 ----
>  1 files changed, 0 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
> index db32ec5..964a866 100644
> --- a/arch/arm/plat-samsung/devs.c
> +++ b/arch/arm/plat-samsung/devs.c
> @@ -491,11 +491,7 @@ static struct resource s3c_i2c0_resource[] = {
> 
>  struct platform_device s3c_device_i2c0 = {
>  	.name		= "s3c2410-i2c",
> -#ifdef CONFIG_S3C_DEV_I2C1
>  	.id		= 0,
> -#else
> -	.id		= -1,
> -#endif
>  	.num_resources	= ARRAY_SIZE(s3c_i2c0_resource),
>  	.resource	= s3c_i2c0_resource,
>  };
> --
> 1.7.5.4
