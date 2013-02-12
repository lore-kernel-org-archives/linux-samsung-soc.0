From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V4 0/5] Add generic DMA DT binding support
Date: Tue, 12 Feb 2013 06:49:50 -0800
Message-ID: <20130212144950.GJ3789@intel.com>
References: <1360571905-15285-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:51667 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1761034Ab3BLPOc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 12 Feb 2013 10:14:32 -0500
Content-Disposition: inline
In-Reply-To: <1360571905-15285-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org, robherring2@gmail.com

On Mon, Feb 11, 2013 at 02:08:20PM +0530, Padmavathi Venna wrote:

This looks fine, I have only question. The code seems to assume that pl330 dma
controller always uses DT. But I dont see that as dependency for pl330.

Something tells me withot OF the driver may not build, have you checked it?

> This patch set adds support for generic dma device tree bindings for
> Samsung platforms and is dependent on the following patches from
> Vinod Koul next branch
> 1)of: Add generic device tree DMA helpers
> 2)dmaengine: add helper function to request a slave DMA channel
> 
> This patch set is made based Mark Brown next branch
Is this targetted for ASoC tree, if so why? It would fail to build if applied
there

--
~Vinod
> 
> Padmavathi Venna (5):
>   DMA: PL330: Add new pl330 filter for DT case.
>   DMA: PL330: Add xlate function
>   DMA: PL330: Register the DMA controller with the generic DMA helpers
>   ARM: dts: pl330: Add #dma-cells for generic dma binding support
>   ARM: SAMSUNG: dma: Remove unnecessary code
> 
>  .../devicetree/bindings/dma/arm-pl330.txt          |   21 +++++--
>  arch/arm/boot/dts/exynos5250.dtsi                  |   12 ++++
>  arch/arm/mach-s3c24xx/include/mach/dma.h           |    1 -
>  arch/arm/mach-s3c64xx/include/mach/dma.h           |    1 -
>  arch/arm/plat-samsung/dma-ops.c                    |   10 +---
>  arch/arm/plat-samsung/include/plat/dma-ops.h       |    1 -
>  arch/arm/plat-samsung/include/plat/dma-pl330.h     |    1 -
>  drivers/dma/pl330.c                                |   64 +++++++++++++++----
>  8 files changed, 79 insertions(+), 32 deletions(-)
> 
> -- 
> 1.7.4.4
> 
