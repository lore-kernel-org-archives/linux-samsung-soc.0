Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322A65588B;
	Mon,  9 Dec 2024 07:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733730921; cv=none; b=N2oz13OErPSGiUozitdjV57sSU4FX/DX3BRU4ozx6IHlrjQihrMSxU95kKA7CuHlThJnMTWtboDaW3myR3tyfNXeVSIFZqhXnOd9/eXJEotNbCaccAKiUU0t4IrP3wAbv5Cp8FIyIw+p7XC9HKk4iw3vIwXG2FrFoGejSxkwkbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733730921; c=relaxed/simple;
	bh=0t/Pxb0qevc4gl+uL0DpwiF40jJ+z0RltHyWs0l13JY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KoPNtZMD3mz3lvCt21esmN2jYVwqtxpWuArAS+twfzo8nR+5P5iT2XCekJt/GUemyNxtBIUKva6Gh3Dcwce/z6yfe7qnCNFY2Rm9RvCbFT2c3MRZITYdeDqOkvwi7Qowd/PRFePk7y9Cmb+sHZpME7MazvDC9K56T6nvBd/GvkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ol3X4T9x; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ol3X4T9x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED113C4CEDF;
	Mon,  9 Dec 2024 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733730920;
	bh=0t/Pxb0qevc4gl+uL0DpwiF40jJ+z0RltHyWs0l13JY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ol3X4T9xHkxl0hmXFzlnIo199RB6u+4z4O6GvHJ22rlidiWQxfhay4xtWBunAc+XA
	 qsfxg+mUdPwKIfV8IRwbifRYMLgZCEb+ul4SgaoXVg3b1FmWP2gPuf+NA8SOw6Gkmm
	 mNNURwL0zoDTDSbhHIuTB5SYHP+UgynJYnx8wrReIqWn7pGqb9zDLb2FtMpyFW20aE
	 o9W6sSePFMY6Kvjew67WB4pTUty1AtoyaITtF9IMnGopPndTXFq6G8p8bLHM4/lkQy
	 1TrOn5aKfKATTnGtZmMMdosj3AjHXh51v6rmuR04lWbA+Q+kCe3pARV6jtayC+b2wF
	 0RwYw6Ynf825A==
Date: Mon, 9 Dec 2024 08:55:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>
Cc: jassisinghbrar@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alim.akhtar@samsung.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
	peter.griffin@linaro.org
Subject: Re: [PATCH v3 2/3] mailbox: add samsung exynos driver
Message-ID: <c6y4nofsjpjsl7ycsxsfqoizu7qsyf5yzbeao6utu5u5avlwzl@jbl3oqhy7ehb>
References: <20241205174137.190545-1-tudor.ambarus@linaro.org>
 <20241205174137.190545-3-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205174137.190545-3-tudor.ambarus@linaro.org>

On Thu, Dec 05, 2024 at 05:41:36PM +0000, Tudor Ambarus wrote:
> The samsung exynos mailbox controller has 16 flag bits for hardware


Here, subject and other text/descriptions:
s/samsung/Samsung/
s/exynos/Exynos/


> interrupt generation and a shared register for passing mailbox messages.
> When the controller is used by the ACPM protocol the shared register is
> ignored and the mailbox controller acts as a doorbell. The controller
> just raises the interrupt to APM after the ACPM protocol has written
> the message to SRAM.

...

> +static int exynos_mbox_send_data(struct mbox_chan *chan, void *data)
> +{
> +	struct exynos_mbox *exynos_mbox = dev_get_drvdata(chan->mbox->dev);
> +	int index;
> +
> +	index = exynos_mbox_chan_index(chan);
> +	if (index < 0)
> +		return index;
> +
> +	writel_relaxed(BIT(index), exynos_mbox->regs + EXYNOS_MBOX_INTGR1);

writel()

> +
> +	return 0;
> +}
> +
> +static const struct mbox_chan_ops exynos_mbox_chan_ops = {
> +	.send_data = exynos_mbox_send_data,
> +};
> +
> +static const struct of_device_id exynos_mbox_match[] = {
> +	{ .compatible = "google,gs101-acpm-mbox" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, exynos_mbox_match);
> +
> +static int exynos_mbox_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct exynos_mbox *exynos_mbox;
> +	struct mbox_controller *mbox;
> +	struct mbox_chan *chans;
> +	int i;
> +
> +	exynos_mbox = devm_kzalloc(dev, sizeof(*exynos_mbox), GFP_KERNEL);
> +	if (!exynos_mbox)
> +		return -ENOMEM;
> +
> +	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
> +	if (!mbox)
> +		return -ENOMEM;
> +
> +	chans = devm_kcalloc(dev, EXYNOS_MBOX_CHAN_COUNT, sizeof(*chans),
> +			     GFP_KERNEL);
> +	if (!chans)
> +		return -ENOMEM;
> +
> +	exynos_mbox->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(exynos_mbox->regs))
> +		return PTR_ERR(exynos_mbox->regs);
> +
> +	exynos_mbox->pclk = devm_clk_get_enabled(dev, "pclk");
> +	if (IS_ERR(exynos_mbox->pclk))
> +		return dev_err_probe(dev, PTR_ERR(exynos_mbox->pclk),
> +				     "Failed to enable clock.\n");
> +
> +	mbox->num_chans = EXYNOS_MBOX_CHAN_COUNT;
> +	mbox->chans = chans;
> +	mbox->dev = dev;
> +	mbox->ops = &exynos_mbox_chan_ops;
> +
> +	for (i = 0; i < EXYNOS_MBOX_CHAN_COUNT; i++)
> +		chans[i].mbox = mbox;
> +
> +	exynos_mbox->dev = dev;
> +	exynos_mbox->mbox = mbox;
> +
> +	platform_set_drvdata(pdev, exynos_mbox);
> +
> +	/* Mask out all interrupts. We support just polling channels for now. */
> +	writel_relaxed(EXYNOS_MBOX_INTMR0_MASK,

writel()

> +		       exynos_mbox->regs + EXYNOS_MBOX_INTMR0);
> +
> +	return devm_mbox_controller_register(dev, mbox);
> +}
> +
> +static struct platform_driver exynos_mbox_driver = {
> +	.probe	= exynos_mbox_probe,
> +	.driver	= {
> +		.name = "exynos-acpm-mbox",
> +		.of_match_table	= of_match_ptr(exynos_mbox_match),

Drop of_match_ptr() - unused symbol warnings.

Best regards,
Krzysztof

