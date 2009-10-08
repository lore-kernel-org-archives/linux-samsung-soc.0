From: thomas.ab@samsung.com
Subject: [PATCH 2/7] S3C64XX: Add MEM_SYS_CFG register definition.
Date: Thu,  8 Oct 2009 15:35:29 +0900
Message-ID: <1254983729-17317-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:50768 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751590AbZJHGlV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 8 Oct 2009 02:41:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Abhilash Kesavan <a.kesavan@samsung.com>

From: Thomas Abraham <thomas.ab@samsung.com>

This patch adds the definition of MEM_SYS_CFG register for
S3C64xx platform.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/plat-s3c64xx/include/plat/regs-clock.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s3c64xx/include/plat/regs-clock.h b/arch/arm/plat-s3c64xx/include/plat/regs-clock.h
index 2c3224c..ad0823e 100644
--- a/arch/arm/plat-s3c64xx/include/plat/regs-clock.h
+++ b/arch/arm/plat-s3c64xx/include/plat/regs-clock.h
@@ -15,6 +15,8 @@
 #ifndef __PLAT_REGS_CLOCK_H
 #define __PLAT_REGS_CLOCK_H __FILE__
 
+#include <plat/map-base.h>
+
 #define S3C_CLKREG(x)		(S3C_VA_SYS + (x))
 
 #define S3C_APLL_LOCK		S3C_CLKREG(0x00)
@@ -34,6 +36,7 @@
 #define S3C_SCLK_GATE		S3C_CLKREG(0x38)
 #define S3C_MEM0_GATE		S3C_CLKREG(0x3C)
 #define S3C_OTHERS		S3C_CLKREG(0x900)
+#define S3C_MEM_SYS_CFG         S3C_CLKREG(0x120)
 
 /* CLKDIV0 */
 #define S3C6400_CLKDIV0_MFC_MASK	(0xf << 28)
-- 
1.5.3.4

