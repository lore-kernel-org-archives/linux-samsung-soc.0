From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH v4] usb: phy: samsung: Add support to set pmu isolation
Date: Thu, 27 Dec 2012 00:26:46 +0000
Message-ID: <20121227002646.GC24604@n2100.arm.linux.org.uk>
References: <1356524912-4736-1-git-send-email-gautam.vivek@samsung.com> <1356524912-4736-2-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:37026 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751724Ab2L0A1C (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 19:27:02 -0500
Content-Disposition: inline
In-Reply-To: <1356524912-4736-2-git-send-email-gautam.vivek@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Vivek Gautam <gautam.vivek@samsung.com>
Cc: linux-usb@vger.kernel.org, l.majewski@samsung.com, linux-samsung-soc@vger.kernel.org, heiko@sntech.de, p.paneri@samsung.com, gregkh@linuxfoundation.org, devicetree-discuss@lists.ozlabs.org, broonie@opensource.wolfsonmicro.com, linux-kernel@vger.kernel.org, balbi@ti.com, dianders@chromium.org, grant.likely@secretlab.ca, kyungmin.park@samsung.com, kgene.kim@samsung.com, thomas.abraham@linaro.org, ben-linux@fluff.org, sylvester.nawrocki@gmail.com, t.figa@samsung.com, linux-arm-kernel@lists.infradead.org

On Wed, Dec 26, 2012 at 05:58:32PM +0530, Vivek Gautam wrote:
> +	if (!ret)
> +		sphy->phyctrl_pmureg = ioremap(reg[0], reg[1]);
> +
> +	of_node_put(usbphy_pmu);
> +
> +	if (IS_ERR_OR_NULL(sphy->phyctrl_pmureg)) {

No.  Learn what the error return values are from functions.  Using the
wrong ones is buggy.  ioremap() only ever returns NULL on error.  You
must check against NULL, and not use the IS_ERR stuff.

> +/*
> + * Set isolation here for phy.
> + * SOCs control this by controlling corresponding PMU registers
> + */
> +static void samsung_usbphy_set_isolation(struct samsung_usbphy *sphy, int on)
> +{
> +	u32 reg;
> +	int en_mask;
> +
> +	if (!sphy->phyctrl_pmureg) {
> +		dev_warn(sphy->dev, "Can't set pmu isolation\n");
> +		return;
> +	}
> +
> +	reg = readl(sphy->phyctrl_pmureg);
> +
> +	en_mask = sphy->drv_data->devphy_en_mask;
> +
> +	if (on)
> +		writel(reg & ~en_mask, sphy->phyctrl_pmureg);
> +	else
> +		writel(reg | en_mask, sphy->phyctrl_pmureg);

What guarantees that this read-modify-write sequence of this register safe?
And, btw, this can't be optimised very well because of the barrier inside
writel().  This would be better:

	if (on)
		reg &= ~en_mask;
	else
		reg |= en_mask;

	writel(reg, sphy->phyctrl_pmureg);

> +static inline struct samsung_usbphy_drvdata
> +*samsung_usbphy_get_driver_data(struct platform_device *pdev)
>  {
>  	if (pdev->dev.of_node) {
>  		const struct of_device_id *match;
>  		match = of_match_node(samsung_usbphy_dt_match,
>  							pdev->dev.of_node);
> -		return (int) match->data;
> +		return (struct samsung_usbphy_drvdata *) match->data;

match->data is a const void pointer.  Is there a reason you need this
cast here?  What if you made the returned pointer from this function
also const and fixed up all its users (no user should modify this
data.)

>  #ifdef CONFIG_OF
>  static const struct of_device_id samsung_usbphy_dt_match[] = {
>  	{
>  		.compatible = "samsung,s3c64xx-usbphy",
> -		.data = (void *)TYPE_S3C64XX,
> +		.data = (void *)&usbphy_s3c64xx,

Why do you need this cast?

>  	}, {
>  		.compatible = "samsung,exynos4210-usbphy",
> -		.data = (void *)TYPE_EXYNOS4210,
> +		.data = (void *)&usbphy_exynos4,

Ditto.
