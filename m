From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] S3C: SDHCI: Add platform data parameters for GPIO
	external interrupts.
Date: Tue, 4 May 2010 08:15:57 +0100
Message-ID: <20100504071557.GE26401@trinity.fluff.org>
References: <1268141825-10828-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:45188 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751217Ab0EDHP6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 May 2010 03:15:58 -0400
Content-Disposition: inline
In-Reply-To: <1268141825-10828-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

On Tue, Mar 09, 2010 at 07:07:05PM +0530, Thomas Abraham wrote:
> This patch adds platform parameters for external GPIO support for card
> insertion/removal events. This is used for S3C SDHCI controllers that
> does not use the SDCD pin for card detection.
> 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/plat-samsung/include/plat/sdhci.h |    7 ++++++
>  drivers/mmc/host/sdhci-s3c.c               |   30 ++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
> index 7d07cd7..b0a0528 100644
> --- a/arch/arm/plat-samsung/include/plat/sdhci.h
> +++ b/arch/arm/plat-samsung/include/plat/sdhci.h
> @@ -29,6 +29,9 @@ struct mmc_ios;
>   *            is necessary the controllers and/or GPIO blocks require the
>   *	      changing of driver-strength and other controls dependant on
>   *	      the card and speed of operation.
> + * @cfg_ext_cd: Configure external interrupt line.
> + * @is_card_present: Returns status of card availability.
> + * @ext_cd: The external GPIO interrupt number to be used.

Do you really need cfg_ext_cd?

>   * Initialisation data specific to either the machine or the platform
>   * for the device driver to use or call-back when configuring gpio or
> @@ -45,6 +48,10 @@ struct s3c_sdhci_platdata {
>  			    void __iomem *regbase,
>  			    struct mmc_ios *ios,
>  			    struct mmc_card *card);
> +
> +	void		(*cfg_ext_cd)(void);
> +	unsigned int	(*is_card_present)(void);
> +	unsigned int	ext_cd;
>  };
>  
>  /**
> diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
> index ebb17ac..073b56f 100644
> --- a/drivers/mmc/host/sdhci-s3c.c
> +++ b/drivers/mmc/host/sdhci-s3c.c
> @@ -212,6 +212,20 @@ static void sdhci_s3c_set_clock(struct sdhci_host *host, unsigned int clock)
>  	}
>  }
>  
> +static irqreturn_t s3c_sdhci_irq_extcd(int irq, void *dev_id)
> +{
> +	struct sdhci_s3c *sc = dev_id;
> +	u32 present = sc->pdata->is_card_present();
> +
> +	if (present)
> +		sc->host->flags &= ~SDHCI_DEVICE_DEAD;
> +	else
> +		sc->host->flags |= SDHCI_DEVICE_DEAD;
> +
> +	tasklet_schedule(&sc->host->card_tasklet);
> +	return IRQ_HANDLED;
> +}
> +
>  static struct sdhci_ops sdhci_s3c_ops = {
>  	.get_max_clock		= sdhci_s3c_get_max_clk,
>  	.get_timeout_clock	= sdhci_s3c_get_timeout_clk,
> @@ -346,14 +360,30 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
>  	host->quirks |= (SDHCI_QUIRK_32BIT_DMA_ADDR |
>  			 SDHCI_QUIRK_32BIT_DMA_SIZE);
>  
> +	if (pdata->cfg_ext_cd) {
> +		pdata->cfg_ext_cd();
> +		if (!pdata->is_card_present())
> +			host->flags |= SDHCI_DEVICE_DEAD;
> +	}
> +
>  	ret = sdhci_add_host(host);
>  	if (ret) {
>  		dev_err(dev, "sdhci_add_host() failed\n");
>  		goto err_add_host;
>  	}
>  
> +	if (pdata->cfg_ext_cd) {
> +		ret = request_irq(pdata->ext_cd, s3c_sdhci_irq_extcd,
> +			IRQF_SHARED, mmc_hostname(host->mmc), sc);
> +		if (ret)
> +			goto err_req_cdirq;
> +	}
> +
>  	return 0;
>  
> + err_req_cdirq:
> +	sdhci_remove_host(host, 0);
> +
>   err_add_host:
>  	release_resource(sc->ioarea);
>  	kfree(sc->ioarea);
> -- 
> 1.6.6.rc2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

-- 
-- 
Ben

Q:      What's a light-year?
A:      One-third less calories than a regular year.
