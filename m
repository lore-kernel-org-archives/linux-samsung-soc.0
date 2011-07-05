From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH 2/7] DMA: PL330: Update PL330 DMA API driver
Date: Tue, 5 Jul 2011 08:36:29 +0100
Message-ID: <20110705073629.GM8286@n2100.arm.linux.org.uk>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com> <1309781915-31549-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:55923 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753701Ab1GEHgv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 03:36:51 -0400
Content-Disposition: inline
In-Reply-To: <1309781915-31549-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>, Vinod Koul <vinod.koul@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Grant Likely <grant.likely@secretlab.ca>, Dan Williams <dan.j.williams@intel.com>, Liam Girdwood <lrg@ti.com>

On Mon, Jul 04, 2011 at 09:18:30PM +0900, Kukjin Kim wrote:
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index 25cf327..9b7f15a 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -193,7 +193,8 @@ config ARCH_HAS_ASYNC_TX_FIND_CHANNEL
>  config PL330_DMA
>  	tristate "DMA API Driver for PL330"
>  	select DMA_ENGINE
> -	depends on PL330
> +	select ARM_AMBA

This is the wrong way around.  If your SoC supports Primecells, then you are
supposed to select ARM_AMBA from the SoC to allow the Primecell drivers to be
enabled.  Primecell drivers should then depend on ARM_AMBA.
