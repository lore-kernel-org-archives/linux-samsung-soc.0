From: thomas.ab@samsung.com
Subject: [PATCH 1/7] S3C64XX: Add physical address definition for Compact Flash controller.
Date: Thu,  8 Oct 2009 15:32:17 +0900
Message-ID: <1254983537-30077-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:47147 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753398AbZJHGgU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Oct 2009 02:36:20 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

This patch adds the physical address definition and length of address
space for Compact Flash controller (IDE) module.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/mach-s3c6400/include/mach/map.h |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c6400/include/mach/map.h b/arch/arm/mach-s3c6400/include/mach/map.h
index fc8b223..c1f3dd5 100644
--- a/arch/arm/mach-s3c6400/include/mach/map.h
+++ b/arch/arm/mach-s3c6400/include/mach/map.h
@@ -80,4 +80,8 @@
 #define S3C_PA_USBHOST		S3C64XX_PA_USBHOST
 #define S3C_PA_USB_HSOTG	S3C64XX_PA_USB_HSOTG
 
+/* CF controller */
+#define S3C64XX_PA_CFCON	(0x70300000)
+#define S3C64XX_SZ_CFCON	SZ_1M
+
 #endif /* __ASM_ARCH_6400_MAP_H */
-- 
1.5.3.4

