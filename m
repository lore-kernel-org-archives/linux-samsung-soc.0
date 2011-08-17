From: alim akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 2/3] ARM: S5PV210: register the second instance of pl330 DMAC
Date: Wed, 17 Aug 2011 09:36:08 +0530
Message-ID: <1313553969-14639-3-git-send-email-alim.akhtar@samsung.com>
References: <1313553969-14639-1-git-send-email-alim.akhtar@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:55981 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750756Ab1HQEF1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 17 Aug 2011 00:05:27 -0400
Received: from epcpsbgm1.samsung.com (mailout3.samsung.com [203.254.224.33])
 by mailout3.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LQ2000UW0OUH790@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Aug 2011 13:05:26 +0900 (KST)
Received: from alim.sisodomain.com ([107.108.73.28])
 by mmp1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LQ200DNO0OF9I@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 17 Aug 2011 13:05:27 +0900 (KST)
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
 arch/arm/mach-s5pv210/dma.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/dma.c b/arch/arm/mach-s5pv210/dma.c
index f79d0b0..86b749c 100644
--- a/arch/arm/mach-s5pv210/dma.c
+++ b/arch/arm/mach-s5pv210/dma.c
@@ -254,6 +254,7 @@ struct amba_device s5pv210_device_pdma1 = {
 static int __init s5pv210_dma_init(void)
 {
 	amba_device_register(&s5pv210_device_pdma0, &iomem_resource);
+	amba_device_register(&s5pv210_device_pdma1, &iomem_resource);
 
 	return 0;
 }
-- 
1.7.2.3
