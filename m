From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 3/7] [media] s5p-fimc: Remove to support fimc for S5PC100
Date: Thu, 12 May 2011 11:23:35 +0200
Message-ID: <4DCBA717.3090307@samsung.com>
References: <1305162674-25860-1-git-send-email-kgene.kim@samsung.com>
 <1305162674-25860-4-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:58483 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755768Ab1ELJXi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 May 2011 05:23:38 -0400
Received: from spt2.w1.samsung.com ([210.118.77.14]) by mailout4.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0LL2000PNSRCDK50@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 May 2011 10:23:36 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0LL2006T6SRBXO@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 May 2011 10:23:35 +0100 (BST)
In-reply-to: <1305162674-25860-4-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Kyungmin Park <kyungmin.park@samsung.com>, Mauro Carvalho Chehab <mchehab@infradead.org>, Nick Pelling <nickpelling@nanodome.com>

Hi Kukjin,

Shouldn't there be some deprecation period for whole s5pc100 support removal ?
It looks a bit rude to me that suddenly whole support for the SoC is vanished.
I know at least one active user of mainline FIMC driver @ s5pc100.

On 05/12/2011 03:11 AM, Kukjin Kim wrote:
> According to removing ARCH_S5PC100, we don't need to support
> fimc for S5PC100.
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

-- 
Sylwester Nawrocki
Samsung Poland R&D Center
