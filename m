From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 2/9] ARM: multi_v7_defconfig: Enable max77802 regulator, rtc and clock drivers
Date: Thu, 14 May 2015 17:40:09 +0200
Message-ID: <1431618016-2087-3-git-send-email-javier.martinez@collabora.co.uk>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-kernel-owner@vger.kernel.org
To: arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>
List-Id: linux-samsung-soc@vger.kernel.org

The Maxim max77802 Power Management IC is used on many Exynos machines.
Besides a bunch of regulators, this chip has a Real-Time-Clock (RTC)
and 2-channel 32kHz clock outputs.

Enable the kernel config options to have the drivers for these devices
built as a module.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/configs/multi_v7_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2349584b6e08..080120fe5580 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -373,6 +373,7 @@ CONFIG_POWER_RESET_SYSCON=y
 CONFIG_REGULATOR_MAX8907=y
 CONFIG_REGULATOR_MAX8973=y
 CONFIG_REGULATOR_MAX77686=y
+CONFIG_REGULATOR_MAX77802=m
 CONFIG_REGULATOR_PALMAS=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_S5M8767=y
@@ -507,6 +508,7 @@ CONFIG_RTC_DRV_AS3722=y
 CONFIG_RTC_DRV_DS1307=y
 CONFIG_RTC_DRV_MAX8907=y
 CONFIG_RTC_DRV_MAX77686=y
+CONFIG_RTC_DRV_MAX77802=m
 CONFIG_RTC_DRV_RS5C372=m
 CONFIG_RTC_DRV_PALMAS=y
 CONFIG_RTC_DRV_ST_LPC=y
@@ -548,6 +550,7 @@ CONFIG_NVEC_PAZ00=y
 CONFIG_QCOM_GSBI=y
 CONFIG_COMMON_CLK_QCOM=y
 CONFIG_COMMON_CLK_MAX77686=y
+CONFIG_COMMON_CLK_MAX77802=m
 CONFIG_APQ_MMCC_8084=y
 CONFIG_MSM_GCC_8660=y
 CONFIG_MSM_MMCC_8960=y
-- 
2.1.4
