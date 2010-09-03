From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH] regulators: add support max8952 regulator
Date: Fri, 3 Sep 2010 10:42:01 +0100
Message-ID: <20100903094200.GC8381@sirena.org.uk>
References: <1283476524-12820-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cassiel.sirena.org.uk ([80.68.93.111]:53757 "EHLO
	cassiel.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751250Ab0ICJmD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Sep 2010 05:42:03 -0400
Content-Disposition: inline
In-Reply-To: <1283476524-12820-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Changhwan Youn <chaos.youn@samsung.com>, lrg@slimlogic.co.uk

On Fri, Sep 03, 2010 at 10:15:24AM +0900, Kukjin Kim wrote:

> +	ret2 = max8649_reg_read(info->i2c, MAX8649_CHIP_ID2);
> +	if (ret2 < 0) {
> +		dev_err(info->dev, "Failed to detect ID of %s:%d\n",
> +			id->name, ret2);
>  		goto out;
>  	}

If the read fails you'll not set an error code when you jump to out so
the probe will report success.  It might be clearer to have separate id
variables which you store the read values into if they're OK, just from
a legibility point of view.

> -	dev_info(info->dev, "Detected MAX8649 (ID:%x)\n", ret);
> +	dev_info(info->dev, "Detected %s (ID:%x %x)\n", id->name, ret, ret2);
> +
> +	info->type = id->driver_data;

It'd be nice to check that the type that was supplied matches the ID
read from the chip in case the user got things wrong, just for
defensiveness.
