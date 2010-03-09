From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] ARM: S5P: Add SCLK SDHCI configuration functionality
Date: Tue, 9 Mar 2010 15:24:38 +0000
Message-ID: <20100309152437.GB4303@sirena.org.uk>
References: <1268141958-10910-1-git-send-email-thomas.ab@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53239 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752223Ab0CIPYj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Mar 2010 10:24:39 -0500
Content-Disposition: inline
In-Reply-To: <1268141958-10910-1-git-send-email-thomas.ab@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.ab@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

On Tue, Mar 09, 2010 at 07:09:18PM +0530, Thomas Abraham wrote:

> +#ifdef CONFIG_MMC_SDHCI_S3C
> +int s5p_setup_sdhci_sclk(struct platform_device *pdev, struct clk *parent)
> +{
> +	struct s3c_sdhci_platdata *pdata = pdev->dev.platform_data;
> +	struct device *dev = &pdev->dev;
> +	struct clk *sclk_mmc;
> +
> +	sclk_mmc = clk_get(dev, "mmc_bus");
> +	if (IS_ERR(sclk_mmc)) {
> +		dev_err(dev, "failed to get mmc_bus clock\n");
> +		return PTR_ERR(sclk_mmc);
> +	}

There doesn't seem to be a matching clk_put for this.

> +	sclk_mmc->ops->set_parent(sclk_mmc, parent);

Given that the user of this API needs to know enough about the clock
structure of the chip to know which parent clock to set (and already
have that parent clock) it's not clear to me what this API is intended
to do - as far as I can see it would live as well in the SDHCI driver as
it is at present.
