From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/2] ARM: multi_v7_defconfig: Enable CPU idle for Exynos
Date: Wed, 25 Feb 2015 09:48:23 +0100
Message-ID: <1424854103-11028-2-git-send-email-k.kozlowski@samsung.com>
References: <1424854103-11028-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1424854103-11028-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Current Exynos CPU idle driver supports entering AFTR (Arm Off, Top
Running) mode on Exynos 4210 (coupled), Exynos 4x12 and Exynos 5250.
Enable it in default configuration to reduce energy consumption.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index e1f9a79651ca..7708bb82b0d0 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -96,6 +96,7 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT_DETAILS=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_CPU_IDLE=y
+CONFIG_ARM_EXYNOS_CPUIDLE=y
 CONFIG_NEON=y
 CONFIG_ARM_ZYNQ_CPUIDLE=y
 CONFIG_NET=y
-- 
1.9.1
