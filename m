From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 1/4] ARM: multi_v7_defconfig: Enable CPU idle for Exynos
Date: Fri, 15 May 2015 21:48:59 +0900
Message-ID: <1431694142-32141-2-git-send-email-k.kozlowski.k@gmail.com>
References: <1431694142-32141-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431694142-32141-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Current Exynos CPU idle driver supports entering AFTR (Arm Off, Top
Running) mode on Exynos3250, Exynos4210 (coupled), Exynos4x12 and
Exynos5250. Enable it in default configuration to reduce energy
consumption.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 76cbb81cbaa3..d524d2e9633c 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -117,6 +117,7 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT_DETAILS=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_CPU_IDLE=y
+CONFIG_ARM_EXYNOS_CPUIDLE=y
 CONFIG_NEON=y
 CONFIG_KERNEL_MODE_NEON=y
 CONFIG_ARM_ZYNQ_CPUIDLE=y
-- 
2.1.4
