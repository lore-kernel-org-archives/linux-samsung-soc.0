From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Disable big.LITTLE switcher
Date: Thu, 28 Apr 2016 16:44:45 +0200
Message-ID: <1493315.8NlXQFsEtt@amdc1976>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7Bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:38965 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751801AbcD1Oq3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 28 Apr 2016 10:46:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Kukjin Kim <kgene@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Disable big.LITTLE switcher in order to allow automatic usage of
cpufreq-dt driver on Exynos542x/Exynos5800 SoCs based boards.

This change should not cause any problems as arm_big_little[_dt]
driver (which is using big.LITTLE switcher support to do the "real"
big.LITTLE switching work) is not used on any Exynos SoC based
board currently.

Signed-off-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index a8cf295..07d4168 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -13,8 +13,6 @@ CONFIG_ARCH_EXYNOS3=y
 CONFIG_EXYNOS5420_MCPM=y
 CONFIG_SMP=y
 CONFIG_BIG_LITTLE=y
-CONFIG_BL_SWITCHER=y
-CONFIG_BL_SWITCHER_DUMMY_IF=y
 CONFIG_NR_CPUS=8
 CONFIG_PREEMPT=y
 CONFIG_AEABI=y
-- 
1.9.1
