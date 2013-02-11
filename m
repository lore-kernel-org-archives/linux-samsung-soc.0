From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V4 0/5] Add generic DMA DT binding support
Date: Mon, 11 Feb 2013 14:08:20 +0530
Message-ID: <1360571905-15285-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:63904 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751219Ab3BKIh5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Feb 2013 03:37:57 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MI1008Q7RZ7XJ60@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Feb 2013 17:37:56 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MI1001YDRZ0HC30@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 11 Feb 2013 17:37:55 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, vinod.koul@intel.com, grant.likely@secretlab.ca, jon-hunter@ti.com, boojin.kim@samsung.com, thomas.abraham@linaro.org, robherring2@gmail.com

Changes since V3:
	- Make dma-cells property optional as suggested by Rob Herring
	- Add dma-requests and dma-channels properties to DMA controller
	  as suggested by Arnd for future-proof
	- Add Acked-by for some of the patches

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
  ARM: dts: pl330: Add #dma-cells for generic dma binding support
  ARM: SAMSUNG: dma: Remove unnecessary code

 .../devicetree/bindings/dma/arm-pl330.txt          |   21 +++++--
 arch/arm/boot/dts/exynos5250.dtsi                  |   12 ++++
 arch/arm/mach-s3c24xx/include/mach/dma.h           |    1 -
 arch/arm/mach-s3c64xx/include/mach/dma.h           |    1 -
 arch/arm/plat-samsung/dma-ops.c                    |   10 +---
 arch/arm/plat-samsung/include/plat/dma-ops.h       |    1 -
 arch/arm/plat-samsung/include/plat/dma-pl330.h     |    1 -
 drivers/dma/pl330.c                                |   64 +++++++++++++++----
 8 files changed, 79 insertions(+), 32 deletions(-)

-- 
1.7.4.4
