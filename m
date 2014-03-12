From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH v5 1/3] ARM: EXYNOS: initial board support for exynos5260 SoC
Date: Wed, 12 Mar 2014 20:46:32 +0530
Message-ID: <1394637394-3960-2-git-send-email-rahul.sharma@samsung.com>
References: <1394637394-3960-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:32545 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754916AbaCLPR2 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Mar 2014 11:17:28 -0400
In-reply-to: <1394637394-3960-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, joshi@samsung.com, r.sh.open@gmail.com, pankaj.dubey@samsung.com, Rahul Sharma <rahul.sharma@samsung.com>

From: Pankaj Dubey <pankaj.dubey@samsung.com>

This patch add basic arch side support for exynos5260 SoC.

Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-exynos/Kconfig           |    4 ++++
 arch/arm/mach-exynos/mach-exynos5-dt.c |    1 +
 2 files changed, 5 insertions(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 54162ef..69c00ca 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -29,6 +29,7 @@ config ARCH_EXYNOS5
 	bool "SAMSUNG EXYNOS5"
 	default y
 	select SOC_EXYNOS5250
+	select SOC_EXYNOS5260
 	select SOC_EXYNOS5420
 	select USB_ARCH_HAS_XHCI
 	help
@@ -65,6 +66,9 @@ config SOC_EXYNOS4412
 config SOC_EXYNOS5250
 	bool
 
+config SOC_EXYNOS5260
+	bool
+
 config SOC_EXYNOS5420
 	bool
 
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index 37ea261..790009e 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -51,6 +51,7 @@ static void __init exynos5_dt_machine_init(void)
 
 static char const *exynos5_dt_compat[] __initdata = {
 	"samsung,exynos5250",
+	"samsung,exynos5260",
 	"samsung,exynos5420",
 	"samsung,exynos5440",
 	NULL
-- 
1.7.9.5
