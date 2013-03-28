From: Mark Brown <broonie@opensource.wolfsonmicro.com>
Subject: [PATCH 1/2] ARM: S3C64XX: Clear DMA flags on channel request
Date: Thu, 28 Mar 2013 11:22:25 +0000
Message-ID: <1364469746-5026-1-git-send-email-broonie@opensource.wolfsonmicro.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from opensource.wolfsonmicro.com ([80.75.67.52]:50316 "EHLO
	opensource.wolfsonmicro.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752588Ab3C1LWc (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Mar 2013 07:22:32 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Charles Keepax <ckeepax@opensource.wolfsonmicro.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>

From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

This patch clears the DMA flags when a DMA channel is requested. This is
necessary because otherwise the channel may inherit incompatible
settings from its last usage.

Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
---
 arch/arm/mach-s3c64xx/dma.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c64xx/dma.c b/arch/arm/mach-s3c64xx/dma.c
index 6af1aa1..759846c 100644
--- a/arch/arm/mach-s3c64xx/dma.c
+++ b/arch/arm/mach-s3c64xx/dma.c
@@ -509,6 +509,7 @@ int s3c2410_dma_request(enum dma_ch channel,
 	chan->client = client;
 	chan->in_use = 1;
 	chan->peripheral = channel;
+	chan->flags = 0;
 
 	local_irq_restore(flags);
 
-- 
1.7.10.4
