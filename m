From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/3] ARM: multi_v7_defconfig: Enable NTC Thermistors support
Date: Wed, 15 Jul 2015 18:32:44 +0200
Message-ID: <1436977965-7078-3-git-send-email-javier@osg.samsung.com>
References: <1436977965-7078-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1436977965-7078-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5420 Peach Pit and Exynos5800 Peach Pi Chromebooks have
IIO based ADC thermistors. Enable module support for its driver
and also for the needed Exynos ADC driver.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index b07493997993..0a8aa724c5a0 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -357,6 +357,7 @@ CONFIG_POWER_RESET_KEYSTONE=y
 CONFIG_POWER_RESET_RMOBILE=y
 CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_LM95245=y
+CONFIG_SENSORS_NTC_THERMISTOR=m
 CONFIG_THERMAL=y
 CONFIG_CPU_THERMAL=y
 CONFIG_RCAR_THERMAL=y
@@ -617,6 +618,7 @@ CONFIG_MEMORY=y
 CONFIG_TI_AEMIF=y
 CONFIG_IIO=y
 CONFIG_AT91_ADC=m
+CONFIG_EXYNOS_ADC=m
 CONFIG_XILINX_XADC=y
 CONFIG_AK8975=y
 CONFIG_PWM=y
-- 
2.4.3
