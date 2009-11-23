From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 6/6] SMDK6410 SPI: Added spidev support as an example
Date: Mon, 23 Nov 2009 13:23:20 +0000
Message-ID: <20091123132320.GB3987@sirena.org.uk>
References: <1258771948-14276-1-git-send-email-jassi.brar@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:47062 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752250AbZKWNXP (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Nov 2009 08:23:15 -0500
Content-Disposition: inline
In-Reply-To: <1258771948-14276-1-git-send-email-jassi.brar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jassi Brar <jassi.brar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org

On Sat, Nov 21, 2009 at 11:52:28AM +0900, Jassi Brar wrote:

> +static void smdk6410_spidev_cs_set_level(int high)
> +{
> +	u32 val;
> +
> +	val = readl(S3C64XX_GPCDAT);
> +
> +	if (high)
> +		val |= (1<<3);
> +	else
> +		val &= ~(1<<3);
> +
> +	writel(val, S3C64XX_GPCDAT);
> +}

This should be using gpiolib, I suspect.
