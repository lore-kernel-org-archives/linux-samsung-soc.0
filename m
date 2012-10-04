From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 7/8] arm: exynos: add exynos5 drm framework platform device
Date: Thu, 04 Oct 2012 21:44:27 +0530
Message-ID: <1349367268-32553-8-git-send-email-rahul.sharma@samsung.com>
References: <1349367268-32553-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51374 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932089Ab2JDH4j (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Oct 2012 03:56:39 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0MBC00L0CZD1ZVS0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Oct 2012 16:56:25 +0900 (KST)
Received: from localhost.localdomain ([107.108.73.106])
 by mmp1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTPA id <0MBC00ERUZCY1M40@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Oct 2012 16:56:25 +0900 (KST)
In-reply-to: <1349367268-32553-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, sw0312.kim@samsung.com, inki.dae@samsung.com, jy0922.shim@samsung.com, kyungmin.park@samsung.com, prashanth.g@samsung.com, joshi@samsung.com, s.shirish@samsung.com, fahad.k@samsung.com, l.krishna@samsung.com, r.sh.open@gmail.com, rahul.sharma@samsung.com

This patch adds drm framework platform device. This device is a
software device, hence not made part of device tree file.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 arch/arm/mach-exynos/mach-exynos5-dt.c |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 9a6d569..db3447c 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -17,6 +17,7 @@
 #include <asm/hardware/gic.h>
 #include <mach/map.h>
 
+#include <plat/devs.h>
 #include <plat/cpu.h>
 #include <plat/regs-serial.h>
 #include <plat/gpio-cfg.h>
@@ -77,6 +78,9 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 	{},
 };
 
+static struct platform_device *exynos5_devices[] __initdata = {
+	&exynos_device_drm,
+};
 static void __init exynos5250_dt_map_io(void)
 {
 	exynos_init_io(NULL, 0);
@@ -94,6 +98,7 @@ static void __init exynos5250_dt_machine_init(void)
 	of_platform_populate(NULL, of_default_bus_match_table,
 				exynos5250_auxdata_lookup, NULL);
 	smdk_hpd_setup();
+	platform_add_devices(exynos5_devices, ARRAY_SIZE(exynos5_devices));
 }
 
 static char const *exynos5250_dt_compat[] __initdata = {
-- 
1.7.0.4
