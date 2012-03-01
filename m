From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 3/4] ARM: S5PV210: Add JPEG board definition
Date: Thu,  1 Mar 2012 09:35:51 +0530
Message-ID: <1330574752-14088-4-git-send-email-sachin.kamat@linaro.org>
References: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:56907 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755583Ab2CAEM3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 29 Feb 2012 23:12:29 -0500
Received: by mail-pw0-f46.google.com with SMTP id up15so386443pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Feb 2012 20:12:28 -0800 (PST)
In-Reply-To: <1330574752-14088-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds JPEG board definition to S5PV210 machine

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s5pv210/clock.c            |    5 +++++
 arch/arm/mach-s5pv210/include/mach/map.h |    4 ++++
 2 files changed, 9 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/clock.c b/arch/arm/mach-s5pv210/clock.c
index b9ec0c3..09609d5 100644
--- a/arch/arm/mach-s5pv210/clock.c
+++ b/arch/arm/mach-s5pv210/clock.c
@@ -340,6 +340,11 @@ static struct clk init_clocks_off[] = {
 		.enable		= s5pv210_clk_ip0_ctrl,
 		.ctrlbit	= (1 << 26),
 	}, {
+		.name		= "jpeg",
+		.parent		= &clk_hclk_dsys.clk,
+		.enable		= s5pv210_clk_ip0_ctrl,
+		.ctrlbit	= (1 << 28),
+	}, {
 		.name		= "mfc",
 		.devname	= "s5p-mfc",
 		.parent		= &clk_pclk_psys.clk,
diff --git a/arch/arm/mach-s5pv210/include/mach/map.h b/arch/arm/mach-s5pv210/include/mach/map.h
index 89c34b8..b7c8a19 100644
--- a/arch/arm/mach-s5pv210/include/mach/map.h
+++ b/arch/arm/mach-s5pv210/include/mach/map.h
@@ -90,6 +90,8 @@
 #define S5PV210_PA_FIMC1		0xFB300000
 #define S5PV210_PA_FIMC2		0xFB400000
 
+#define S5PV210_PA_JPEG			0xFB600000
+
 #define S5PV210_PA_SDO			0xF9000000
 #define S5PV210_PA_VP			0xF9100000
 #define S5PV210_PA_MIXER		0xF9200000
@@ -132,6 +134,8 @@
 #define S5P_PA_SYSCON			S5PV210_PA_SYSCON
 #define S5P_PA_TIMER			S5PV210_PA_TIMER
 
+#define S5P_PA_JPEG			S5PV210_PA_JPEG
+
 #define SAMSUNG_PA_ADC			S5PV210_PA_ADC
 #define SAMSUNG_PA_CFCON		S5PV210_PA_CFCON
 #define SAMSUNG_PA_KEYPAD		S5PV210_PA_KEYPAD
-- 
1.7.4.1
