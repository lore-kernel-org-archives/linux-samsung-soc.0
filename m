From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH RFC 7/8] ARM: EXYNOS: Enable exynos-asv driver for
 ARCH_EXYNOS
Date: Thu, 04 Apr 2019 19:17:34 +0200
Message-ID: <20190404171735.12815-8-s.nawrocki@samsung.com>
References: <20190404171735.12815-1-s.nawrocki@samsung.com>
        <CGME20190404172252epcas2p284b7e2e9e7102f6f95c982d547ed9d64@epcas2p2.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <20190404171735.12815-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, myungjoo.ham@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, pankaj.dubey@samsung.com, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Enable exynos-asv driver for Exynos 32-bit SoCs.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/mach-exynos/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index e3e63aa5d60a..fe306a85228c 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -13,6 +13,7 @@ menuconfig ARCH_EXYNOS
 	select ARM_AMBA
 	select ARM_GIC
 	select COMMON_CLK_SAMSUNG
+	select EXYNOS_ASV
 	select EXYNOS_CHIPID
 	select EXYNOS_THERMAL
 	select EXYNOS_PMU
-- 
2.17.1
