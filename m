From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH v2 3/3] ARM: exynos_defconfig: Enable NTC Thermistors support
Date: Thu, 16 Jul 2015 08:39:44 +0200
Message-ID: <1437028784-22189-4-git-send-email-javier@osg.samsung.com>
References: <1437028784-22189-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1437028784-22189-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, Kevin Hilman <khilman@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5420 Peach Pit and Exynos5800 Peach Pi Chromebooks have
IIO based ADC thermistors. Enable built-in support for its driver.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

Changes in v2:
- Add Krzysztof Kozlowski Reviewed-by tag in patch #3.

 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 9504e7790288..e5d7d4476a80 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -94,6 +94,7 @@ CONFIG_CHARGER_MAX14577=y
 CONFIG_CHARGER_MAX77693=y
 CONFIG_CHARGER_TPS65090=y
 CONFIG_SENSORS_LM90=y
+CONFIG_SENSORS_NTC_THERMISTOR=y
 CONFIG_SENSORS_PWM_FAN=y
 CONFIG_SENSORS_INA2XX=y
 CONFIG_THERMAL=y
-- 
2.4.3
