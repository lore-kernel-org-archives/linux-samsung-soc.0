From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 14/17] drivers: i2c: s3c2410-i2c also on S5PC1XX platform
Date: Tue, 13 Oct 2009 09:57:09 +0200
Message-ID: <1255420632-21116-15-git-send-email-m.szyprowski@samsung.com>
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
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:14740 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933664AbZJMILj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 13 Oct 2009 04:11:39 -0400
Received: from eu_spt1 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0KRG00G770V2VO@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:26 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0KRG00E2V0V2TT@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 13 Oct 2009 08:59:26 +0100 (BST)
In-reply-to: <1255420632-21116-14-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.arm.linux.org.uk, linux-samsung-soc@vger.kernel.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, bhmin@samsung.com

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
1.6.4
