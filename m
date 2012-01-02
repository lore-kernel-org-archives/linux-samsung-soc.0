From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: S5PV210: Add G2D to mach-s5pv210
Date: Mon,  2 Jan 2012 15:01:57 +0530
Message-ID: <1325496717-11115-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-iy0-f174.google.com ([209.85.210.174]:35431 "EHLO
	mail-iy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751119Ab2ABJfg (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jan 2012 04:35:36 -0500
Received: by iaeh11 with SMTP id h11so29026728iae.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jan 2012 01:35:36 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: sachin.kamat@linaro.org, kgene.kim@samsung.com, patches@linaro.org

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/include/mach/map.h |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 89c34b8..721df50 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -80,6 +80,8 @@
 
 #define S5PV210_PA_FB			0xF8000000
 
+#define S5PV210_PA_G2D			0xFA000000
+
 #define S5PV210_PA_MDMA			0xFA200000
 #define S5PV210_PA_PDMA0		0xE0900000
 #define S5PV210_PA_PDMA1		0xE0A00000
@@ -119,6 +121,7 @@
 #define S5P_PA_MIPI_CSIS0		S5PV210_PA_MIPI_CSIS
 #define S5P_PA_MFC			S5PV210_PA_MFC
 #define S5P_PA_IIC_HDMIPHY		S5PV210_PA_IIC_HDMIPHY
+#define S5P_PA_G2D			S5PV210_PA_G2D
 
 #define S5P_PA_SDO			S5PV210_PA_SDO
 #define S5P_PA_VP			S5PV210_PA_VP
-- 
1.7.4.1
