From: Lukasz Majewski <l.majewski@samsung.com>
Subject: [PATCH] FIX:cache:exynos: Execute the cache reconfiguration
 unconditionally for Exynos4
Date: Thu, 15 May 2014 13:34:06 +0200
Message-ID: <1400153646-827-1-git-send-email-l.majewski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:22673 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751967AbaEOLfG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 May 2014 07:35:06 -0400
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5M00KDM5IG9940@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 15 May 2014 20:35:04 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kevin Hilman <khilman@linaro.org>, "arm@kernel.org" <arm@kernel.org>, Lukasz Majewski <l.majewski@majess.pl>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 'Olof Johansson' <olof@lixom.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>

The commit 2bf73dd61a84cdf27e49f48e08739af6ba70ace1 has made the cache
configuration depending on definition of CONFIG_S5P_SLEEP Kconfig flag.
It is enabled on various S5PV210 incarnations and not available at Exynos4
family of SoCs.

The problem emerges when one wants to disable/enable core via hotplug - e.g:
echo 0 > /sys/devices/system/cpu/cpu1/online.
When CONFIG_CPU_IDLE is enabled (it is not enabled at default exynos_defconfig).

On Exynos4 based targets (Exynos4412 and Exynos4210, namely trats2 and
trats) board locks up and consumes considerable power.

This patch does nothing more than restoration of the state before the
offending commit.

Tested on top of next-20140514 at Trats board.

Signed-off-by: Lukasz Majewski <l.majewski@samsung.com>
---
 arch/arm/mach-exynos/exynos.c |    7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 1b97b93..5c8b334 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -254,10 +254,9 @@ static int __init exynos4_l2x0_cache_init(void)
 	if (ret)
 		return ret;
 
-	if (IS_ENABLED(CONFIG_S5P_SLEEP)) {
-		l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
-		clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
-	}
+	l2x0_regs_phys = virt_to_phys(&l2x0_saved_regs);
+	clean_dcache_area(&l2x0_regs_phys, sizeof(unsigned long));
+
 	return 0;
 }
 early_initcall(exynos4_l2x0_cache_init);
-- 
1.7.10.4
