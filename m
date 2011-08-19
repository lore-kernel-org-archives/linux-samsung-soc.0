From: Boojin Kim <boojin.kim@samsung.com>
Subject: [PATCH V6 00/15] To use DMA generic APIs for Samsung DMA
Date: Fri, 19 Aug 2011 17:54:42 +0900
Message-ID: <1313744097-27289-1-git-send-email-boojin.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:57721 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752203Ab1HSJLU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 05:11:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Vinod Koul <vinod.koul@intel.com>, Kukjin Kim <kgene.kim@samsung.com>, Dan Williams <dan.j.williams@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Grant Likely <grant.likely@secretlab.ca>, Russell King <linux@arm.linux.org.uk>

This patchset adds support DMA generic APIs for Samsung DMA.

V6 is to fix the build error that is occurred during merging V5 and the latest
mainline stream.
This changes from V5 is followings.
-  [PATCH v6 02/15]: Include 'linux/scatterlist.h'
-  [PATCH v6 06/15]: Include 'linux/scatterlist.h'

[PATCH v6 01/15] DMA: PL330: Add support runtime PM for PL330 DMAC
[PATCH v6 02/15] DMA: PL330: Update PL330 DMA API driver
[PATCH v6 03/15] DMA: PL330: Support DMA_SLAVE_CONFIG command
[PATCH v6 04/15] DMA: PL330: Add DMA_CYCLIC capability
[PATCH v6 05/15] ARM: SAMSUNG: Update to use PL330-DMA driver
[PATCH v6 06/15] ARM: SAMSUNG: Add common DMA operations
[PATCH v6 07/15] ARM: EXYNOS4: Use generic DMA PL330 driver
[PATCH v6 08/15] ARM: S5PV210: Use generic DMA PL330 driver
[PATCH v6 09/15] ARM: S5PC100: Use generic DMA PL330 driver
[PATCH v6 10/15] ARM: S5P64X0: Use generic DMA PL330 driver
[PATCH v6 11/15] ARM: SAMSUNG: Remove S3C-PL330-DMA driver
[PATCH v6 12/15] spi/s3c64xx: Add support DMA engine API
[PATCH v6 13/15] spi/s3c64xx: Merge dma control code
[PATCH v6 14/15] ASoC: Samsung: Update DMA interface
[PATCH v6 15/15] ARM: SAMSUNG: Remove Samsung specific enum type for dma direction
