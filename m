From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: Re: [PATCH 6/6] ARM: S3C64XX: Modified according to SPI
 consolidation work.
Date: Fri, 4 Nov 2011 10:57:11 +0000
Message-ID: <20111104105710.GA12134@opensource.wolfsonmicro.com>
References: <1320410634-10788-1-git-send-email-padma.v@samsung.com>
 <1320410634-10788-7-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:57984 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750938Ab1KDK5N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Nov 2011 06:57:13 -0400
Content-Disposition: inline
In-Reply-To: <1320410634-10788-7-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: padma.kvr@gmail.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, linux@arm.linux.org.uk, ian@opensource.wolfsonmicro.com, dp@opensource.wolfsonmicro.com, jassisinghbrar@gmail.com

On Fri, Nov 04, 2011 at 08:43:54AM -0400, Padmavathi Venna wrote:

> +#ifdef CONFIG_S3C64XX_DEV_SPI0
> +static struct s3c64xx_spi_info crag6410_spi0_pdata __initdata = {
> +	.cfg_gpio       = s3c64xx_spi0_cfg_gpio,
> +	.fifo_lvl_mask  = 0x7f,
> +	.rx_lvl_offset  = 13,
> +	.tx_st_done     = 21,
> +};
> +#endif

It seems like a step backwards to have all this stuff in the individual
machines - most of this (everything except cfg_gpio pretty much) is a
property of the SoC silicon so should be somewhere central for the SoC.
