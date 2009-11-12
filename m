From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 18/18] drivers: MMC: enable SDHCI-S3C on S5PC1XX platform
Date: Thu, 12 Nov 2009 09:22:02 +0100
Message-ID: <1258014122-18185-19-git-send-email-m.szyprowski@samsung.com>
References: <1258014122-18185-1-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-2-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-3-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-4-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-5-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-6-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-7-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-8-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-9-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-10-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-11-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-12-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-13-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-14-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-15-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-16-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-17-git-send-email-m.szyprowski@samsung.com>
 <1258014122-18185-18-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46075 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752642AbZKLIXG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2009 03:23:06 -0500
Received: from eu_spt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KSZ00LS0LYMGW@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Nov 2009 08:23:10 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KSZ00HCJLYLOC@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Nov 2009 08:23:10 +0000 (GMT)
In-reply-to: <1258014122-18185-18-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com, laforge@gnumonks.org

From: Kyungmin Park <kyungmin.park@samsung.com>

From: Kyungmin Park <kyungmin.park@samsung.com>

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
1.6.5
