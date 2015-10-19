From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH 6/7] ARM: exynos_defconfig: Enable generic syscon-{reboot,
 poweroff} drivers
Date: Mon, 19 Oct 2015 11:33:54 +0530
Message-ID: <1445234635-3950-7-git-send-email-alim.akhtar@samsung.com>
References: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:43471 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078AbbJSGRU (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 19 Oct 2015 02:17:20 -0400
In-reply-to: <1445234635-3950-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

Enable CONFIG_POWER_RESET_SYSCON and CONFIG_POWER_RESET_SYSCON_POWEROFF
to allow exynos SoC to make use of generic syscon based reboot/poweroff
drivers.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
---
 arch/arm/configs/exynos_defconfig |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 3349713e6c63..cbc2e96b76a3 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -95,6 +95,9 @@ CONFIG_BATTERY_MAX17042=y
 CONFIG_CHARGER_MAX14577=y
 CONFIG_CHARGER_MAX77693=y
 CONFIG_CHARGER_TPS65090=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_SYSCON=y
+CONFIG_POWER_RESET_SYSCON_POWEROFF=y
 CONFIG_SENSORS_LM90=y
 CONFIG_SENSORS_NTC_THERMISTOR=y
 CONFIG_SENSORS_PWM_FAN=y
-- 
1.7.10.4
