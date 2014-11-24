From: Amit Daniel Kachhap <amit.daniel@samsung.com>
Subject: [PATCH v4 5/5] arm: exynos: Select SOC_SAMSUNG config option
Date: Mon, 24 Nov 2014 07:36:15 +0530
Message-ID: <1416794775-1605-6-git-send-email-amit.daniel@samsung.com>
References: <1416794775-1605-1-git-send-email-amit.daniel@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1416794775-1605-1-git-send-email-amit.daniel@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, linux-kernel@vger.kernel.org, linux@arm.linux.org.uk, Amit Daniel Kachhap <amit.daniel@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The config option SOC_SAMSUNG is needed to enable all soc samsung
drivers inside driver/soc/samsung folder. Currently, this will be useful to
enable exynos pmu driver which is moved to that folder.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
---
 arch/arm/mach-exynos/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index b9e3f1c..17880b6 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -25,6 +25,7 @@ menuconfig ARCH_EXYNOS
 	select S5P_DEV_MFC
 	select SRAM
 	select MFD_SYSCON
+	select SOC_SAMSUNG
 	help
 	  Support for SAMSUNG EXYNOS SoCs (EXYNOS4/5)
 
-- 
1.7.9.5
