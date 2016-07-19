From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable PM_DEBUG
Date: Tue, 19 Jul 2016 13:09:14 +0200
Message-ID: <1468926554-22204-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

PM_DEBUG and PM_ADVANCED_DEBUG bring some information useful for
development and they should not cause any significant overhead.  Enable
them in default configuration so debugging would be slightly easier.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index a5aa44c56bfe..d7366891e9cf 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -35,6 +35,8 @@ CONFIG_ARM_EXYNOS_CPUIDLE=y
 CONFIG_VFP=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
+CONFIG_PM_DEBUG=y
+CONFIG_PM_ADVANCED_DEBUG=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
-- 
1.9.1
