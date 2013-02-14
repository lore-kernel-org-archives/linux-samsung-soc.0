From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH V4 0/4] Add generic DMA DT binding support
Date: Thu, 14 Feb 2013 20:13:49 +0530
Message-ID: <20130214144349.GH29960@intel.com>
References: <1360813208-9498-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:14541 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757824Ab3BNOox (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Feb 2013 09:44:53 -0500
Content-Disposition: inline
In-Reply-To: <1360813208-9498-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org, robherring2@gmail.com

On Thu, Feb 14, 2013 at 09:10:04AM +0530, Padmavathi Venna wrote:

Logically this should have been v5 :)

Applied all, thanks

--
~Vinod
> Changes since V3:
>         - Make dma-cells property optional as suggested by Rob Herring
>         - Add dma-requests and dma-channels properties to DMA controller
>           as suggested by Arnd for future-proof
>         - Add Acked-by for some of the patches
> 
> Changes since V2:
>         - Add new filter function for DT case as suggested by Arnd
>         - Add xlate as static function
>         - Use newly added filter function in xlate.
>         - Add Acked-by for some of the patches
> 
> Changes since V1:
>         - Address the review comments by Arnd Bergmann as below
>         - Wording of the properties.
>         - Pass pdmac as third parameter to of_dma_controller_register
>         - Filter the dma channel based on channel number and dma_device
> 
> This patch set adds support for generic dma device tree bindings for
> Samsung platforms and is dependent on the following patches from
> Vinod Koul next branch
> 1)of: Add generic device tree DMA helpers
> 2)dmaengine: add helper function to request a slave DMA channel
> 
> This patch set is made based on Vinod Koul next branch
> 
> Padmavathi Venna (4):
>   DMA: PL330: Add new pl330 filter for DT case.
>   DMA: PL330: Add xlate function
>   DMA: PL330: Register the DMA controller with the generic DMA helpers
>   ARM: dts: pl330: Add #dma-cells for generic dma binding support
> 
>  .../devicetree/bindings/dma/arm-pl330.txt          |   21 +++++--
>  arch/arm/boot/dts/exynos5250.dtsi                  |   12 ++++
>  drivers/dma/pl330.c                                |   64 +++++++++++++++----
>  3 files changed, 78 insertions(+), 19 deletions(-)
> 
> -- 
> 1.7.4.4
> 
