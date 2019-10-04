From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 2/2] ARM: multi_v7_defconfig: Enable Exynos bus and memory frequency scaling (devfreq)
Date: Fri,  4 Oct 2019 17:00:40 +0200
Message-ID: <20191004150040.5833-2-krzk@kernel.org>
References: <20191004150040.5833-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191004150040.5833-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Marek Szyprowski <m.szyprowski@samsung.com>
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
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7f7978dba8ab..1296e7aaa801 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -977,11 +977,14 @@ CONFIG_ARCH_TEGRA_2x_SOC=y
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
