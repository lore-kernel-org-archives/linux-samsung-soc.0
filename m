From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V3 0/5] Add generic DMA DT binding support
Date: Wed, 06 Feb 2013 11:48:44 +0530
Message-ID: <1360131529-2847-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:60461 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890Ab3BFGSX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Feb 2013 01:18:23 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MHS00ESTC6I63N0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 15:18:22 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MHS001KWC6CC970@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 06 Feb 2013 15:18:21 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org

Changes since V2:
	- Add new filter function for DT case as suggested by Arnd
	- Add xlate as static function
	- Use newly added filter function in xlate.
	- Add Acked-by for some of the patches

Changes since V1:
        - Address the review comments by Arnd Bergmann as below
        - Wording of the properties.
        - Pass pdmac as third parameter to of_dma_controller_register
        - Filter the dma channel based on channel number and dma_device

This patch set adds support for generic dma device tree bindings for
Samsung platforms and is dependent on the following patches from
Vinod Koul next branch
1)of: Add generic device tree DMA helpers
2)dmaengine: add helper function to request a slave DMA channel

This patch set is made based Mark Brown next branch

Padmavathi Venna (5):
  DMA: PL330: Add new pl330 filter for DT case.
  DMA: PL330: Add xlate function
  DMA: PL330: Register the DMA controller with the generic DMA helpers
  ARM: dts: Add #dma-cells for generic dma binding support
  ARM: SAMSUNG: dma: Remove unnecessary code

 .../devicetree/bindings/dma/arm-pl330.txt          |   15 ++++-
 arch/arm/boot/dts/exynos5250.dtsi                  |    4 +
 arch/arm/mach-s3c24xx/include/mach/dma.h           |    1 -
 arch/arm/mach-s3c64xx/include/mach/dma.h           |    1 -
 arch/arm/plat-samsung/dma-ops.c                    |   10 +---
 arch/arm/plat-samsung/include/plat/dma-ops.h       |    1 -
 arch/arm/plat-samsung/include/plat/dma-pl330.h     |    1 -
 drivers/dma/pl330.c                                |   64 +++++++++++++++----
 8 files changed, 66 insertions(+), 31 deletions(-)

-- 
1.7.4.4
