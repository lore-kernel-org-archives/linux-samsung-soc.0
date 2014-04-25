From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v2 01/10] ARM: EXYNOS: Make exynos machine_ops as static
Date: Fri, 25 Apr 2014 21:32:37 +0900
Message-ID: <1398429166-5539-2-git-send-email-pankaj.dubey@samsung.com>
References: <1396425058-4012-1-git-send-email-pankaj.dubey@samsung.com>
 <1398429166-5539-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43278 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752737AbaDYMPE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Apr 2014 08:15:04 -0400
In-reply-to: <1398429166-5539-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk, t.figa@samsung.com, chow.kim@samsung.com, yg1004.jang@samsung.com, vikas.sajjan@samsung.com, s.nawrocki@samsung.com, b.zolnierkie@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>

As machine function ops are used only in this file let's make
them static.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
---
 arch/arm/mach-exynos/exynos.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index b32a907..2388ee4 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -198,7 +198,7 @@ static struct map_desc exynos5_iodesc[] __initdata = {
 	},
 };
 
-void exynos_restart(enum reboot_mode mode, const char *cmd)
+static void exynos_restart(enum reboot_mode mode, const char *cmd)
 {
 	struct device_node *np;
 	u32 val = 0x1;
@@ -235,7 +235,7 @@ void __init exynos_cpufreq_init(void)
 	platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
 }
 
-void __init exynos_init_late(void)
+static void __init exynos_init_late(void)
 {
 	if (of_machine_is_compatible("samsung,exynos5440"))
 		/* to be supported later */
@@ -296,7 +296,7 @@ static void __init exynos_map_io(void)
 		iotable_init(exynos5250_iodesc, ARRAY_SIZE(exynos5250_iodesc));
 }
 
-void __init exynos_init_io(void)
+static void __init exynos_init_io(void)
 {
 	debug_ll_io_init();
 
-- 
1.7.10.4
