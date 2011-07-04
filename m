From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 0/7] ARM: S5P: Use generic DMA APIs
Date: Mon,  4 Jul 2011 21:18:28 +0900
Message-ID: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:45682 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754850Ab1GDM3d (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Jul 2011 08:29:33 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

This patch makes EXYNOS4210 SoC use generic DMA APIs instead of
Samsung specific DMA APIs. The DMA client drivers such as spi and
sound are requried to change the usage for it.

NOTE: We will also apply this on other S5P SoCs soon so we can
remove s3c-pl330 specific driver at the same time.

[PATCH 1/7] DMA: PL330: Add support runtime PM for PL330 DMAC
[PATCH 2/7] DMA: PL330: Update PL330 DMA API driver
[PATCH 3/7] DMA: PL330: Add DMA capabilities
[PATCH 4/7] ARM: SAMSUNG: Update to use PL330-DMA driver
[PATCH 5/7] ARM: EXYNOS4: Use generic DMA PL330 driver
[PATCH 6/7] spi/s3c64xx: Add support DMA engine API
[PATCH 7/7] ASoC: Samsung: Update DMA interface
