From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 2/2] ARM: multi_v7_defconfig: Enable Exynos bus and memory frequency scaling (devfreq)
Date: Tue,  8 Oct 2019 18:02:34 +0200
Message-ID: <20191008160234.3106-2-krzk@kernel.org>
References: <20191008160234.3106-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191008160234.3106-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Simon Horman <horms+renesas@verge.net.au>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-samsung-soc@vger.kernel.org

Enable devfreq events along with drivers for scaling frequency and
voltages of Exynos buses and Dynamic Memory Controller (DMC).  This
usually brings energy saving benefits.

So far devfreq was disabled because it was causing hangs during system
reboot (voltage not matching reset frequency). This was already fixed.

Occasionally, devfreq might negatively impact performance of certain SoC
blocks, e.g. when a bus is scaled down but some block (like Mixer with
two Full HD windows) wants to perform high-throughput DMA operations.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes since v1:
None
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index d576845acd6f..55fcc53a677a 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -978,11 +978,14 @@ CONFIG_ARCH_TEGRA_2x_SOC=y
 CONFIG_ARCH_TEGRA_3x_SOC=y
 CONFIG_ARCH_TEGRA_114_SOC=y
 CONFIG_ARCH_TEGRA_124_SOC=y
+CONFIG_ARM_EXYNOS_BUS_DEVFREQ=m
 CONFIG_ARM_TEGRA_DEVFREQ=m
+CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=m
 CONFIG_EXTCON_MAX14577=m
 CONFIG_EXTCON_MAX77693=m
 CONFIG_EXTCON_MAX8997=m
 CONFIG_TI_AEMIF=y
+CONFIG_EXYNOS5422_DMC=m
 CONFIG_IIO=y
 CONFIG_IIO_SW_TRIGGER=y
 CONFIG_ASPEED_ADC=m
-- 
2.17.1
