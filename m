From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 01/11] drivers: serial: S5PC100 serial driver cleanup
Date: Tue, 18 May 2010 12:38:39 +0200
Message-ID: <1274179129-14659-2-git-send-email-m.szyprowski@samsung.com>
References: <1274179129-14659-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:12693 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751964Ab0ERKi4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 May 2010 06:38:56 -0400
Received: from eu_spt2 (mailout2.w1.samsung.com [210.118.77.12])
 by mailout2.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0L2M0007V2WTYW@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 11:38:53 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt2.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L2M00F0E2WRKI@spt2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 May 2010 11:38:52 +0100 (BST)
In-reply-to: <1274179129-14659-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, ben-linux@fluff.org, kgene.kim@samsung.com

Remove unnecessary Kconfig entry. S5PC100 has exactly the same driver as
S3C6400/S3C6410/S5P6440.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 drivers/serial/Kconfig  |   16 ++++------------
 drivers/serial/Makefile |    1 -
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/serial/Kconfig b/drivers/serial/Kconfig
index 5f3f03d..302836a 100644
--- a/drivers/serial/Kconfig
+++ b/drivers/serial/Kconfig
@@ -534,21 +534,13 @@ config SERIAL_S3C24A0
 	  Serial port support for the Samsung S3C24A0 SoC
 
 config SERIAL_S3C6400
-	tristate "Samsung S3C6400/S3C6410/S5P6440 Seria port support"
-	depends on SERIAL_SAMSUNG && (CPU_S3C6400 || CPU_S3C6410 || CPU_S5P6440)
+	tristate "Samsung S3C6400/S3C6410/S5P6440/S5PC100 Serial port support"
+	depends on SERIAL_SAMSUNG && (CPU_S3C6400 || CPU_S3C6410 || CPU_S5P6440 || CPU_S5PC100)
 	select SERIAL_SAMSUNG_UARTS_4
 	default y
 	help
-	  Serial port support for the Samsung S3C6400, S3C6410 and S5P6440
-	  SoCs
-
-config SERIAL_S5PC100
-	tristate "Samsung S5PC100 Serial port support"
-	depends on SERIAL_SAMSUNG && CPU_S5PC100
-	select SERIAL_SAMSUNG_UARTS_4
-	default y
-	help
-	  Serial port support for the Samsung S5PC100 SoCs
+	  Serial port support for the Samsung S3C6400, S3C6410, S5P6440
+	  and S5PC100 SoCs
 
 config SERIAL_S5PV210
 	tristate "Samsung S5PV210 Serial port support"
diff --git a/drivers/serial/Makefile b/drivers/serial/Makefile
index 6aa4723..328f107 100644
--- a/drivers/serial/Makefile
+++ b/drivers/serial/Makefile
@@ -44,7 +44,6 @@ obj-$(CONFIG_SERIAL_S3C2412) += s3c2412.o
 obj-$(CONFIG_SERIAL_S3C2440) += s3c2440.o
 obj-$(CONFIG_SERIAL_S3C24A0) += s3c24a0.o
 obj-$(CONFIG_SERIAL_S3C6400) += s3c6400.o
-obj-$(CONFIG_SERIAL_S5PC100) += s3c6400.o
 obj-$(CONFIG_SERIAL_S5PV210) += s5pv210.o
 obj-$(CONFIG_SERIAL_MAX3100) += max3100.o
 obj-$(CONFIG_SERIAL_IP22_ZILOG) += ip22zilog.o
-- 
1.6.4
