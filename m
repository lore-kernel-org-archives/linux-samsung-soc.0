From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 2/2] ARM: S5PV210: cleanup hsmmc clock definitions
Date: Tue, 03 Aug 2010 13:09:54 +0200
Message-ID: <1280833794-11147-3-git-send-email-m.szyprowski@samsung.com>
References: <1280833794-11147-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:58542 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755771Ab0HCLKA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Aug 2010 07:10:00 -0400
Received: from eu_spt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L6K00GDRPOMR5@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Aug 2010 12:09:58 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L6K0093NPOMD3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 03 Aug 2010 12:09:58 +0100 (BST)
In-reply-to: <1280833794-11147-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

This patch performs minor clocks cleanup for S5PV210 SoC. The duplicate
HCLK clock entry for sdhci-s3c has been disabled and the index of a reserved
entry has been fixed.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/setup-sdhci.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv210/setup-sdhci.c b/arch/arm/mach-s5pv210/setup-sdhci.c
index 51815ec..c32e202 100644
--- a/arch/arm/mach-s5pv210/setup-sdhci.c
+++ b/arch/arm/mach-s5pv210/setup-sdhci.c
@@ -26,9 +26,9 @@
 
 char *s5pv210_hsmmc_clksrcs[4] = {
 	[0] = "hsmmc",		/* HCLK */
-	[1] = "hsmmc",		/* HCLK */
+	/* [1] = "hsmmc",	- duplicate HCLK entry */
 	[2] = "sclk_mmc",	/* mmc_bus */
-	/*[4] = reserved */
+	/* [3] = NULL,		- reserved */
 };
 
 void s5pv210_setup_sdhci_cfg_card(struct platform_device *dev,
-- 
1.7.1.569.g6f426
