From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] ARM: SAMSUNG: dma: Remove unnecessary code
Date: Mon, 4 Feb 2013 17:43:54 +0000
Message-ID: <201302041743.55029.arnd@arndb.de>
References: <1359967675-624-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.8]:53460 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754070Ab3BDRoH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Feb 2013 12:44:07 -0500
In-Reply-To: <1359967675-624-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

On Monday 04 February 2013, Padmavathi Venna wrote:
> diff --git a/arch/arm/plat-samsung/dma-ops.c b/arch/arm/plat-samsung/dma-ops.c
> index 71d58dd..ec0d731 100644
> --- a/arch/arm/plat-samsung/dma-ops.c
> +++ b/arch/arm/plat-samsung/dma-ops.c
> @@ -23,23 +23,15 @@ static unsigned samsung_dmadev_request(enum dma_ch dma_ch,
>  				struct device *dev, char *ch_name)
>  {
>  	dma_cap_mask_t mask;
> -	void *filter_param;
>  
>  	dma_cap_zero(mask);
>  	dma_cap_set(param->cap, mask);
>  
> -	/*
> -	 * If a dma channel property of a device node from device tree is
> -	 * specified, use that as the fliter parameter.
> -	 */
> -	filter_param = (dma_ch == DMACH_DT_PROP) ?
> -		(void *)param->dt_dmach_prop : (void *)dma_ch;
> -
>  	if (dev->of_node)
>  		return (unsigned)dma_request_slave_channel(dev, ch_name);
>  	else
>  		return (unsigned)dma_request_channel(mask, pl330_filter,
> -							filter_param);
> +							(void *)dma_ch);
>  }

This still looks wrong to me, because the pl330_filter function now tkes
a struct dma_pl330_filter_args pointer argument, not dma_ch name.

	Arnd
