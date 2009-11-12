From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 15/18] drivers: i2c: s3c2410-i2c also on S5PC1XX platform
Date: Thu, 12 Nov 2009 09:21:59 +0100
Message-ID: <1258014122-18185-16-git-send-email-m.szyprowski@samsung.com>
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
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:41055 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752538AbZKLIXD (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Nov 2009 03:23:03 -0500
Received: from eu_spt2 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0KSZ003FVLYJX040@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Nov 2009 08:23:07 +0000 (GMT)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KSZ00FM2LYJW3@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 12 Nov 2009 08:23:07 +0000 (GMT)
In-reply-to: <1258014122-18185-15-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com, laforge@gnumonks.org

From: Kyungmin Park <kyungmin.park@samsung.com>

From: Kyungmin Park <kyungmin.park@samsung.com>

Samsung S5PC100 SoC has I2C controllers directly compatible to the one
known from S3C24x0 SoCs. Enable support for s3c-i2c driver also on S5PC1xx
platform.

Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/i2c/busses/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 737335f..5b173f3 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -494,7 +494,7 @@ config I2C_PXA_SLAVE
 
 config I2C_S3C2410
 	tristate "S3C2410 I2C Driver"
-	depends on ARCH_S3C2410 || ARCH_S3C64XX
+	depends on ARCH_S3C2410 || ARCH_S3C64XX || ARCH_S5PC1XX
 	help
 	  Say Y here to include support for I2C controller in the
 	  Samsung S3C2410 based System-on-Chip devices.
-- 
1.6.5
