From: Ben Dooks <ben-linux@fluff.org>
Subject: Re: [PATCH] S3C: SDHCI: Add platform data parameters for clock
	configuration
Date: Tue, 4 May 2010 08:15:07 +0100
Message-ID: <20100504071507.GD26401@trinity.fluff.org>
References: <1268141937-10878-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:45154 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751217Ab0EDHPJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 May 2010 03:15:09 -0400
Content-Disposition: inline
In-Reply-To: <1268141937-10878-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

On Tue, Mar 09, 2010 at 07:08:57PM +0530, Thomas Abraham wrote:
> This patch adds two additional parameters in the S3C SDHCI platform
> data structure for SDHCI SCLK clock configuration. This patch also
> modifies the S3C SDHCI controller driver to use the new parameters.

I really think that this should be dealt with in the clock handling
code.
 
> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
> ---
>  arch/arm/plat-samsung/include/plat/sdhci.h |    5 +++++
>  drivers/mmc/host/sdhci-s3c.c               |    3 +++
>  2 files changed, 8 insertions(+), 0 deletions(-)
> 
> diff --git a/arch/arm/plat-samsung/include/plat/sdhci.h b/arch/arm/plat-samsung/include/plat/sdhci.h
> index b0a0528..705eee8 100644
> --- a/arch/arm/plat-samsung/include/plat/sdhci.h
> +++ b/arch/arm/plat-samsung/include/plat/sdhci.h
> @@ -29,6 +29,8 @@ struct mmc_ios;
>   *            is necessary the controllers and/or GPIO blocks require the
>   *	      changing of driver-strength and other controls dependant on
>   *	      the card and speed of operation.
> + * @sclk_mmc_freq: Clock frequency of SCLK MMC (mmc_bus).
> + * @cfg_clocks: Configure platform specific clocks.
>   * @cfg_ext_cd: Configure external interrupt line.
>   * @is_card_present: Returns status of card availability.
>   * @ext_cd: The external GPIO interrupt number to be used.
> @@ -49,6 +51,9 @@ struct s3c_sdhci_platdata {
>  			    struct mmc_ios *ios,
>  			    struct mmc_card *card);
>  
> +	unsigned int	sclk_mmc_freq;
> +	void		(*cfg_clocks)(struct platform_device *pdev);
> +
>  	void		(*cfg_ext_cd)(void);
>  	unsigned int	(*is_card_present)(void);
>  	unsigned int	ext_cd;
> diff --git a/drivers/mmc/host/sdhci-s3c.c b/drivers/mmc/host/sdhci-s3c.c
> index 073b56f..980f906 100644
> --- a/drivers/mmc/host/sdhci-s3c.c
> +++ b/drivers/mmc/host/sdhci-s3c.c
> @@ -282,6 +282,9 @@ static int __devinit sdhci_s3c_probe(struct platform_device *pdev)
>  	/* enable the local io clock and keep it running for the moment. */
>  	clk_enable(sc->clk_io);
>  
> +	if (pdata->cfg_clocks)
> +		pdata->cfg_clocks(pdev);
> +
>  	for (clks = 0, ptr = 0; ptr < MAX_BUS_CLK; ptr++) {
>  		struct clk *clk;
>  		char *name = pdata->clocks[ptr];
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
