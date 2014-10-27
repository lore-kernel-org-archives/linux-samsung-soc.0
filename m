From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCHv2 1/2] ARM: EXYNOS: Add EXYNOS4415 SoC ID
Date: Mon, 27 Oct 2014 10:35:58 +0900
Message-ID: <1414373759-4362-2-git-send-email-cw00.choi@samsung.com>
References: <1414373759-4362-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:22380 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751778AbaJ0BgC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 26 Oct 2014 21:36:02 -0400
In-reply-to: <1414373759-4362-1-git-send-email-cw00.choi@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, mark.rutland@arm.com, arnd@arndb.de, olof@lixom.net, tomasz.figa@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, m.szyprowski@samsung.com, yj44.cho@samsung.com, jaewon02.kim@samsung.com, ideal.song@samsung.com

This patch add Exynos4415's SoC ID. Exynos4415 is based on the 32-bit RISC
processor for Smartphone. Exynos4415 uses Cortex A9 quad-cores and has a target
speed of 1.6GHz and provides 8.5GB/s memory bandwidth.

Cc: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/mach-exynos/Kconfig  | 5 +++++
 arch/arm/mach-exynos/exynos.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 46f3c0d..349c867 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -75,6 +75,11 @@ config SOC_EXYNOS4412
 	default y
 	depends on ARCH_EXYNOS4
 
+config SOC_EXYNOS4415
+	bool "SAMSUNG EXYNOS4415"
+	default y
+	depends on ARCH_EXYNOS4
+
 config SOC_EXYNOS5250
 	bool "SAMSUNG EXYNOS5250"
 	default y
diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
index 1b46460..1da531f 100644
--- a/arch/arm/mach-exynos/exynos.c
+++ b/arch/arm/mach-exynos/exynos.c
@@ -252,6 +252,7 @@ static const struct of_device_id exynos_dt_pmu_match[] = {
 	{ .compatible = "samsung,exynos4210-pmu" },
 	{ .compatible = "samsung,exynos4212-pmu" },
 	{ .compatible = "samsung,exynos4412-pmu" },
+	{ .compatible = "samsung,exynos4415-pmu" },
 	{ .compatible = "samsung,exynos5250-pmu" },
 	{ .compatible = "samsung,exynos5260-pmu" },
 	{ .compatible = "samsung,exynos5410-pmu" },
@@ -359,6 +360,7 @@ static char const *exynos_dt_compat[] __initconst = {
 	"samsung,exynos4210",
 	"samsung,exynos4212",
 	"samsung,exynos4412",
+	"samsung,exynos4415",
 	"samsung,exynos5",
 	"samsung,exynos5250",
 	"samsung,exynos5260",
-- 
1.8.5.5
