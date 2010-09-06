From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/4] ARM: S5PC110: use common FIMC clock setup code
Date: Mon, 06 Sep 2010 05:50:44 +0200
Message-ID: <1283745044-15514-5-git-send-email-m.szyprowski@samsung.com>
References: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:18163 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755201Ab0IFDut (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 5 Sep 2010 23:50:49 -0400
Received: from eu_spt1 ([210.118.77.13]) by mailout3.w1.samsung.com
 (Sun Java(tm) System Messaging Server 6.3-8.04 (built Jul 29 2009; 32bit))
 with ESMTP id <0L8B000IC40NZO30@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 04:50:47 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0L8B00IN340MPV@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 06 Sep 2010 04:50:47 +0100 (BST)
In-reply-to: <1283745044-15514-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: m.szyprowski@samsung.com, kyungmin.park@samsung.com, kgene.kim@samsung.com, ben-linux@fluff.org

On Aquila and GONI the bootloader doesn't set FIMC parent clocks
correctly. Use common FIMC setup code to fix this during machne boot.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-s5pv210/Kconfig       |    2 ++
 arch/arm/mach-s5pv210/mach-aquila.c |    3 +++
 arch/arm/mach-s5pv210/mach-goni.c   |    2 ++
 3 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 48489bb..7b5e816 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -79,6 +79,7 @@ config MACH_AQUILA
 	select S3C_DEV_HSMMC2
 	select S5PC110_DEV_ONENAND
 	select S5PV210_SETUP_FB_24BPP
+	select S5PV210_SETUP_FIMC
 	select S5PV210_SETUP_SDHCI
 	help
 	  Machine support for the Samsung Aquila target based on S5PC110 SoC
@@ -96,6 +97,7 @@ config MACH_GONI
 	select S3C_DEV_HSMMC2
 	select S5PC110_DEV_ONENAND
 	select S5PV210_SETUP_FB_24BPP
+	select S5PV210_SETUP_FIMC
 	select S5PV210_SETUP_SDHCI
 	help
 	  Machine support for Samsung GONI board
diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 0dda801..65f616b 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -35,7 +35,9 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/fb.h>
+#include <plat/fimc.h>
 #include <plat/fimc-core.h>
+
 #include <plat/sdhci.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
@@ -510,6 +512,7 @@ static void __init aquila_machine_init(void)
 	s3c_fb_set_platdata(&aquila_lcd_pdata);
 
 	platform_add_devices(aquila_devices, ARRAY_SIZE(aquila_devices));
+	s5pv210_fimc_setup_clks();
 }
 
 MACHINE_START(AQUILA, "Aquila")
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 53754d7..9f3b52d 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -35,6 +35,7 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/fb.h>
+#include <plat/fimc.h>
 #include <plat/sdhci.h>
 
 /* Following are default values for UCON, ULCON and UFCON UART registers */
@@ -487,6 +488,7 @@ static void __init goni_machine_init(void)
 	s3c_fb_set_platdata(&goni_lcd_pdata);
 
 	platform_add_devices(goni_devices, ARRAY_SIZE(goni_devices));
+	s5pv210_fimc_setup_clks();
 }
 
 MACHINE_START(GONI, "GONI")
-- 
1.7.2.2
