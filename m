From: Mauro Carvalho Chehab <mchehab@infradead.org>
Subject: Re: [PATCH 3/7] [media] s5p-fimc: Remove to support fimc for S5PC100
Date: Wed, 18 May 2011 08:04:43 -0300
Message-ID: <4DD3A7CB.6030408@infradead.org>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com> <1305162674-25860-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from casper.infradead.org ([85.118.1.10]:43274 "EHLO
	casper.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932619Ab1ERLEw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 May 2011 07:04:52 -0400
In-Reply-To: <1305162674-25860-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Sylwester Nawrocki <s.nawrocki@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

Em 11-05-2011 22:11, Kukjin Kim escreveu:
> According to removing ARCH_S5PC100, we don't need to support
> fimc for S5PC100.

NACK

There's nothing mentioning the removal of ARCH_S5PC100 or the
corresponding bits at feature-removal-schedule.txt:

$ grep -i s5pc100 Documentation/feature-removal-schedule.txt 
$ 

Mauro.

> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Mauro Carvalho Chehab <mchehab@infradead.org>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
>  drivers/media/video/s5p-fimc/fimc-core.c |   14 --------------
>  1 files changed, 0 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/media/video/s5p-fimc/fimc-core.c b/drivers/media/video/s5p-fimc/fimc-core.c
> index dc91a85..89d59d6 100644
> --- a/drivers/media/video/s5p-fimc/fimc-core.c
> +++ b/drivers/media/video/s5p-fimc/fimc-core.c
> @@ -1871,17 +1871,6 @@ static struct samsung_fimc_variant fimc2_variant_exynos4 = {
>  	.pix_limit	 = &s5p_pix_limit[3],
>  };
>  
> -/* S5PC100 */
> -static struct samsung_fimc_driverdata fimc_drvdata_s5p = {
> -	.variant = {
> -		[0] = &fimc0_variant_s5p,
> -		[1] = &fimc0_variant_s5p,
> -		[2] = &fimc2_variant_s5p,
> -	},
> -	.num_entities = 3,
> -	.lclk_frequency = 133000000UL,
> -};
> -
>  /* S5PV210, S5PC110 */
>  static struct samsung_fimc_driverdata fimc_drvdata_s5pv210 = {
>  	.variant = {
> @@ -1907,9 +1896,6 @@ static struct samsung_fimc_driverdata fimc_drvdata_exynos4 = {
>  
>  static struct platform_device_id fimc_driver_ids[] = {
>  	{
> -		.name		= "s5p-fimc",
> -		.driver_data	= (unsigned long)&fimc_drvdata_s5p,
> -	}, {
>  		.name		= "s5pv210-fimc",
>  		.driver_data	= (unsigned long)&fimc_drvdata_s5pv210,
>  	}, {
