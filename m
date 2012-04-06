From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/4] ARM: Exynos4: set fix xusbxti clock for NURI and
 Universal210 boards
Date: Fri, 06 Apr 2012 09:43:25 +0200
Message-ID: <1333698206-12348-4-git-send-email-m.szyprowski@samsung.com>
References: <1333698206-12348-1-git-send-email-m.szyprowski@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:46891 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752933Ab2DFHnf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 6 Apr 2012 03:43:35 -0400
Received: from euspt1 (mailout1.w1.samsung.com [210.118.77.11])
 by mailout1.w1.samsung.com
 (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTP id <0M2100BGHS372Y@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 08:42:43 +0100 (BST)
Received: from linux.samsung.com ([106.116.38.10])
 by spt1.w1.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14
 2004)) with ESMTPA id <0M2100FZ8S4KK4@spt1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 06 Apr 2012 08:43:32 +0100 (BST)
In-reply-to: <1333698206-12348-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

On some versions of NURI and UniversalC210 boards, camera clocks are
routed directly to xusbxti clock source. This patch sets the correct
value for this clock to let usb and camera sensors to work correctly and
avoid division by zero on driver's probe.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/mach-nuri.c           |    2 +-
 arch/arm/mach-exynos/mach-universal_c210.c |    2 ++
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-nuri.c b/arch/arm/mach-exynos/mach-nuri.c
index 88a3b5c3..d55298d 100644
--- a/arch/arm/mach-exynos/mach-nuri.c
+++ b/arch/arm/mach-exynos/mach-nuri.c
@@ -1348,6 +1348,7 @@ static struct platform_device *nuri_devices[] __initdata = {
 
 static void __init nuri_map_io(void)
 {
+	clk_xusbxti.rate = 24000000;
 	exynos_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(nuri_uartcfgs, ARRAY_SIZE(nuri_uartcfgs));
@@ -1380,7 +1381,6 @@ static void __init nuri_machine_init(void)
 	nuri_camera_init();
 
 	nuri_ehci_init();
-	clk_xusbxti.rate = 24000000;
 
 	/* Last */
 	platform_add_devices(nuri_devices, ARRAY_SIZE(nuri_devices));
diff --git a/arch/arm/mach-exynos/mach-universal_c210.c b/arch/arm/mach-exynos/mach-universal_c210.c
index e10c87f..a6f13ce 100644
--- a/arch/arm/mach-exynos/mach-universal_c210.c
+++ b/arch/arm/mach-exynos/mach-universal_c210.c
@@ -29,6 +29,7 @@
 #include <asm/mach-types.h>
 
 #include <plat/regs-serial.h>
+#include <plat/clock.h>
 #include <plat/cpu.h>
 #include <plat/devs.h>
 #include <plat/iic.h>
@@ -1058,6 +1059,7 @@ static struct platform_device *universal_devices[] __initdata = {
 
 static void __init universal_map_io(void)
 {
+	clk_xusbxti.rate = 24000000;
 	exynos_init_io(NULL, 0);
 	s3c24xx_init_clocks(24000000);
 	s3c24xx_init_uarts(universal_uartcfgs, ARRAY_SIZE(universal_uartcfgs));
-- 
1.7.1.569.g6f426
