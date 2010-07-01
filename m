From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 2/3] arm: s5pv210: Aquila: add support for MAX8998 PMIC
Date: Thu, 1 Jul 2010 13:24:51 +0100
Message-ID: <20100701122451.GA17698@sirena.org.uk>
References: <1277964466-23891-1-git-send-email-m.szyprowski@samsung.com> <1277964466-23891-3-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:34767 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753739Ab0GAMYy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Jul 2010 08:24:54 -0400
Content-Disposition: inline
In-Reply-To: <1277964466-23891-3-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Thu, Jul 01, 2010 at 08:07:45AM +0200, Marek Szyprowski wrote:

> +static struct regulator_consumer_supply aquila_ldo3_consumers[] = {
> +	{	.supply	= "VMIPI_1.1V",	},
> +};

> +static struct regulator_consumer_supply aquila_ldo8_consumers[] = {
> +	{	.supply	= "VADC_3.3V", },
> +};

Almost all of these regulator supplies should be removed.  Except in
some exceptional cases all supplies should specify a struct device (the
only one that really exists at the minute is CPU core due to lack of
devices for CPUfreq).  In general if you're defining a supply name that
is the same as the rail on the board rather than a pin on a chip you're
not using the API correctly.

If you want to label the supply for userspace do so in the constraints.

> +	.constraints	= {
> +		.name		= "VALIVE_1.1V",
> +		.min_uV		= 1100000,
> +		.max_uV		= 1100000,
> +		.apply_uV	= 1,
> +		.always_on	= 1,
> +		.boot_on	= 0,

No need to explicitly set stuff to zero.
