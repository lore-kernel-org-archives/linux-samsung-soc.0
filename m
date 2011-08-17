From: alim akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 3/3] ARM: S5PC100: register the second instance of pl330 DMAC
Date: Wed, 17 Aug 2011 09:36:09 +0530
Message-ID: <1313553969-14639-4-git-send-email-alim.akhtar@samsung.com>
References: <1313553969-14639-1-git-send-email-alim.akhtar@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:31862 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756Ab1HQEF3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2011 00:05:29 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ200EWH0P2M940@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Aug 2011 13:05:28 +0900 (KST)
Received: from alim.sisodomain.com ([107.108.73.28])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ200DNO0OF9I@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Aug 2011 13:05:28 +0900 (KST)
In-reply-to: <1313553969-14639-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: boojin.kim@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>

From: Alim Akhtar <alim.akhtar@samsung.com>

Platform data is provided for two instance of pl330 DMAC,
but only one DMAC is register with amba_device.
This patch register the second instance.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/mach-s5pc100/dma.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pc100/dma.c b/arch/arm/mach-s5pc100/dma.c
index ef803e9..065a087 100644
--- a/arch/arm/mach-s5pc100/dma.c
+++ b/arch/arm/mach-s5pc100/dma.c
@@ -260,6 +260,7 @@ struct amba_device s5pc100_device_pdma1 = {
 static int __init s5pc100_dma_init(void)
 {
 	amba_device_register(&s5pc100_device_pdma0, &iomem_resource);
+	amba_device_register(&s5pc100_device_pdma1, &iomem_resource);
 
 	return 0;
 }
-- 
1.7.2.3
