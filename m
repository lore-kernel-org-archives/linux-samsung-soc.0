From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: exynos4_defconfig: Update for adding machines
Date: Fri, 25 Mar 2011 10:35:27 +0900
Message-ID: <1301016927-9378-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:51202 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934383Ab1CYCGf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 24 Mar 2011 22:06:35 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch adds MACH_ARMLEX4210 and MACH_NURI in exynos4_defconfig.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/configs/exynos4_defconfig |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/exynos4_defconfig b/arch/arm/configs/exynos4_defconfig
index 2ffba24..da53ff3 100644
--- a/arch/arm/configs/exynos4_defconfig
+++ b/arch/arm/configs/exynos4_defconfig
@@ -8,7 +8,9 @@ CONFIG_ARCH_EXYNOS4=y
 CONFIG_S3C_LOWLEVEL_UART_PORT=1
 CONFIG_MACH_SMDKC210=y
 CONFIG_MACH_SMDKV310=y
+CONFIG_MACH_ARMLEX4210=y
 CONFIG_MACH_UNIVERSAL_C210=y
+CONFIG_MACH_NURI=y
 CONFIG_NO_HZ=y
 CONFIG_HIGH_RES_TIMERS=y
 CONFIG_SMP=y
-- 
1.7.1
