From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 17/17] drivers: MMC: enable SDHCI-S3C on S5PC1XX platform
Date: Tue, 13 Oct 2009 09:57:12 +0200
Message-ID: <1255420632-21116-18-git-send-email-m.szyprowski@samsung.com>
References: <1255420632-21116-1-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-2-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-3-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-4-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-5-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-6-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-7-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-8-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-9-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-10-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-11-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-12-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-13-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-14-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-15-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-16-git-send-email-m.szyprowski@samsung.com>
 <1255420632-21116-17-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:11613 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933760AbZJMINN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2009 04:13:13 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0KRG00BM80V2A980@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:27 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KRG0052M0V2CO@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:26 +0100 (BST)
In-reply-to: <1255420632-21116-17-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

Samsung S5PC100 SoC has SDHCI controller compatible to the one known from
S3C64xx SoCs. Enable support for sdhci-s3c driver also on S5PC1xx platform.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/mmc/host/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 432ae83..faddf82 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -96,7 +96,7 @@ config MMC_SDHCI_PLTFM
 
 config MMC_SDHCI_S3C
 	tristate "SDHCI support on Samsung S3C SoC"
-	depends on MMC_SDHCI && (PLAT_S3C24XX || PLAT_S3C64XX)
+	depends on MMC_SDHCI && (PLAT_S3C24XX || PLAT_S3C64XX || PLAT_S5PC1XX)
 	help
 	  This selects the Secure Digital Host Controller Interface (SDHCI)
 	  often referrered to as the HSMMC block in some of the Samsung S3C
-- 
1.6.4
