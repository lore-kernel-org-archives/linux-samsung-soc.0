From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] ARM: drop "select HAVE_SCHED_CLOCK"
Date: Wed, 06 Mar 2013 11:53:51 +0100
Message-ID: <1362567231.16460.175.camel@x61.thuisdomein>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cpsmtpb-ews01.kpnxchange.com ([213.75.39.4]:64553 "EHLO
	cpsmtpb-ews01.kpnxchange.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753461Ab3CFKx4 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 6 Mar 2013 05:53:56 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

The Kconfig symbol HAVE_SCHED_CLOCK got removed in v3.4, with commit
6905a65879b51d326396e63dfea40861a30bc17f ("ARM: Make the sched_clock
framework mandatory"). Drop the last two select statements for that
symbol too. They're useless now.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
Tested with "git grep" only.

 arch/arm/Kconfig             | 1 -
 arch/arm/mach-exynos/Kconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 0c990b7..2530799 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1172,7 +1172,6 @@ config PLAT_VERSATILE
 config ARM_TIMER_SP804
 	bool
 	select CLKSRC_MMIO
-	select HAVE_SCHED_CLOCK
 
 source arch/arm/mm/Kconfig
 
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 068aeb5..acfdbcf 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -253,7 +253,6 @@ config MACH_UNIVERSAL_C210
 	select EXYNOS4_SETUP_USB_PHY
 	select EXYNOS_DEV_DMA
 	select EXYNOS_DEV_DRM
-	select HAVE_SCHED_CLOCK
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
 	select S3C_DEV_HSMMC3
-- 
1.7.11.7
