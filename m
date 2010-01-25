From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] ARM: SAMSUNG: Fix null pointer dereference in ADC
	driver
Date: Mon, 25 Jan 2010 01:35:50 +0000
Message-ID: <20100125013550.GM26562@trinity.fluff.org>
References: <b2e8f9f71001221429l5ea24cd8j3046e7a24546320a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:40786 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750877Ab0AYBfv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 24 Jan 2010 20:35:51 -0500
Content-Disposition: inline
In-Reply-To: <b2e8f9f71001221429l5ea24cd8j3046e7a24546320a@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Maurus Cuelenaere <mcuelenaere@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>

On Fri, Jan 22, 2010 at 11:29:16PM +0100, Maurus Cuelenaere wrote:
> ARM: SAMSUNG: Fix null pointer dereference in ADC driver
> 
> Use struct adc_device instead of relying on client (which could be
> NULL) when checking for SoC type.

ok, will apply this to next-samsung tree.
 
> Signed-off-by: Maurus Cuelenaere <mcuelenaere@gmail.com>
> ---
>  arch/arm/plat-samsung/adc.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/adc.c b/arch/arm/plat-samsung/adc.c
> index 120b790..c7659b7 100644
> --- a/arch/arm/plat-samsung/adc.c
> +++ b/arch/arm/plat-samsung/adc.c
> @@ -295,7 +295,7 @@ static irqreturn_t s3c_adc_irq(int irq, void *pw)
>  	}
> 
>  exit:
> -	if (platform_get_device_id(client->pdev)->driver_data == TYPE_S3C64XX) {
> +	if (platform_get_device_id(adc->pdev)->driver_data == TYPE_S3C64XX) {
>  		/* Clear ADC interrupt */
>  		writel(0, adc->regs + S3C64XX_ADCCLRINT);
>  	}
> -- 
> 1.6.6.1
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
