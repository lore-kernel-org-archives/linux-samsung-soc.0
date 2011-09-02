From: Boojin Kim <boojin.kim@samsung.com>
Subject: [PATCH v8 00/16] To use DMA generic APIs for Samsung DMA
Date: Fri,  2 Sep 2011 09:44:28 +0900
Message-ID: <1314924284-25554-1-git-send-email-boojin.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:42074 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932669Ab1IBIag (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 Sep 2011 04:30:36 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>, Linus Walleij <linus.walleij@linaro.org>

This patchset adds support DMA generic APIs for samsung DMA.

The changes from V7 is following:
- Divides patch file.
  : The 03 patch on V7 patchset is divided into the 03 and 04 patch on V8 patchset.
    The O3 patch is only for DMA_SLAVE_CONFIG command.
    The 04 patch is only for DMA_TERMINATE_ALL command.
- Code clean-up
  : Remove unnecessary code on 05 patch.

[PATCH v8 01/16] DMA: PL330: Add support runtime PM for PL330 DMAC
[PATCH v8 02/16] DMA: PL330: Update PL330 DMA API driver
[PATCH v8 03/16] DMA: PL330: Support DMA_SLAVE_CONFIG command
[PATCH v8 04/16] DMA: PL330: Remove the start operation for handling DMA_TERMINATE_ALL command
[PATCH v8 05/16] DMA: PL330: Add DMA_CYCLIC capability
[PATCH v8 06/16] ARM: SAMSUNG: Update to use PL330-DMA driver
[PATCH v8 07/16] ARM: SAMSUNG: Add common DMA operations
[PATCH v8 08/16] ARM: EXYNOS4: Use generic DMA PL330 driver
[PATCH v8 09/16] ARM: S5PV210: Use generic DMA PL330 driver
[PATCH v8 10/16] ARM: S5PC100: Use generic DMA PL330 driver
[PATCH v8 11/16] ARM: S5P64X0: Use generic DMA PL330 driver
[PATCH v8 12/16] ARM: SAMSUNG: Remove S3C-PL330-DMA driver
[PATCH v8 13/16] spi/s3c64xx: Add support DMA engine API
[PATCH v8 14/16] spi/s3c64xx: Merge dma control code
[PATCH v8 15/16] ASoC: Samsung: Update DMA interface
[PATCH v8 16/16] ARM: SAMSUNG: Remove Samsung specific enum type for dma direction
