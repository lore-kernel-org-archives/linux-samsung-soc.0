From: Vinod Koul <vinod.koul@intel.com>
Subject: Re: [PATCH 0/4] Add generic DMA DT binding support
Date: Mon, 28 Jan 2013 05:43:06 -0800
Message-ID: <20130128134305.GU26562@intel.com>
References: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:16090 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756320Ab3A1OIa (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 28 Jan 2013 09:08:30 -0500
Content-Disposition: inline
In-Reply-To: <1358508824-20352-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Padmavathi Venna <padma.v@samsung.com>, arnd@arndb.de
Cc: padma.kvr@gmail.com, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org, devicetree-discuss@lists.ozlabs.org, sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, grant.likely@secretlab.ca, swarren@nvidia.com, boojin.kim@samsung.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, thomas.abraham@linaro.org

On Fri, Jan 18, 2013 at 05:03:40PM +0530, Padmavathi Venna wrote:
> This patch set adds support for generic dma device tree bindings for
> Samsung platforms and is dependent on the following patches from
> Vinod Koul next branch
> 1)of: Add generic device tree DMA helpers
> 2)dmaengine: add helper function to request a slave DMA channel
Changes look fairly decent. I need somone with better knowldge of DT to akc this
before this is applied. Arnd...?
> 
> This patch set is made based Kukjin Kim for-next branch
> 
> Padmavathi Venna (4):
>   DMA: PL330: Add xlate function
>   DMA: PL330: Register the DMA controller with the generic DMA helpers
>   ARM: dts: Add #dma-cells for generic dma binding support
>   DMA: PL330: Modify pl330 filter based on new generic dma dt bindings.
> 
>  .../devicetree/bindings/dma/arm-pl330.txt          |    9 +++-
>  arch/arm/boot/dts/exynos5250.dtsi                  |    4 ++
>  drivers/dma/pl330.c                                |   48 ++++++++++++++++----
>  3 files changed, 49 insertions(+), 12 deletions(-)
> 
> -- 
> 1.7.4.4
> 
