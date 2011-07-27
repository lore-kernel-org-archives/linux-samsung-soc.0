From: Boojin Kim <boojin.kim@samsung.com>
Subject: [PATCH V5 00/15] To use DMA generic APIs for Samsung DMA
Date: Wed, 27 Jul 2011 14:31:22 +0900
Message-ID: <1311744697-10264-1-git-send-email-boojin.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:57816 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752667Ab1G0Fjk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 01:39:40 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>

This patchset adds support DMA generic APIs for Samsung DMA.

The changes from V4 are following:
- Change DMA cyclic capability operation on '04 patch'
	- Remove cyclic_task
	- Initialize 'cyclic' variable on channel request.
- Change pl330 data structure on '02, 07, 08, 09, 10 patches'
	- Move 'fifo_addr' and 'burst_sz' variables from 'struct dma_pl330_peri'
	  to 'struct dma_pl330_chan'
- Change some names on '02, 05 patch'
	- Change DMADEV_PL330 configuration to SAMSUNG_DMA_PL330
	- Add comment for 'burst_sz' variable
- Consider 'xxx_maxburst' on '03, 06 patch'
- Modify pl330_filter() function on '06 patch'
- Merge DMA control code on SPI driver on '13 patch'

[PATCH V5 01/15] DMA: PL330: Add support runtime PM for PL330 DMAC
[PATCH V5 02/15] DMA: PL330: Update PL330 DMA API driver
[PATCH V5 03/15] DMA: PL330: Support DMA_SLAVE_CONFIG command
[PATCH V5 04/15] DMA: PL330: Add DMA_CYCLIC capability
[PATCH V5 05/15] ARM: SAMSUNG: Update to use PL330-DMA driver
[PATCH V5 06/15] ARM: SAMSUNG: Add common DMA operations
[PATCH V5 07/15] ARM: EXYNOS4: Use generic DMA PL330 driver
[PATCH V5 08/15] ARM: S5PV210: Use generic DMA PL330 driver
[PATCH V5 09/15] ARM: S5PC100: Use generic DMA PL330 driver
[PATCH V5 10/15] ARM: S5P64X0: Use generic DMA PL330 driver
[PATCH V5 11/15] ARM: SAMSUNG: Remove S3C-PL330-DMA driver
[PATCH V5 12/15] spi/s3c64xx: Add support DMA engine API
[PATCH V5 13/15] spi/s3c64xx: Merge dma control code
[PATCH V5 14/15] ASoC: Samsung: Update DMA interface
[PATCH V5 15/15] ARM: SAMSUNG: Remove Samsung specific enum type for dma direction
