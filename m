From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v2 1/1] ARM: exynos_defconfig: Enable SBS battery support
Date: Mon, 11 Aug 2014 19:57:17 +0200
Message-ID: <1407779837-10981-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:37723 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753439AbaHKR5V (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Aug 2014 13:57:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sachin Kamat <sachin.kamat@samsung.com>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Many Exynos5 boards (e.g: Snow, Peach Pit and Pi) have
a SBS-compliant gas gauge battery. Enable to built it
so the needed support is available for these boards.

Suggested-by: Doug Anderson <dianders@chromium.org>
Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Acked-by: Kukjin Kim <kgene.kim@samsung.com>
Reviewed-by: Doug Anderson <dianders@chromium.org>
---

Changes since v1:
 - Don't build it as a module since is the exception in exynos_defconfig.
   Suggested by Bartlomiej Zolnierkiewicz.

 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index fc7d168..c390bb9 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -77,6 +77,7 @@ CONFIG_SPI_S3C64XX=y
 CONFIG_I2C_S3C2410=y
 CONFIG_DEBUG_GPIO=y
 CONFIG_POWER_SUPPLY=y
+CONFIG_BATTERY_SBS=y
 CONFIG_CHARGER_TPS65090=y
 # CONFIG_HWMON is not set
 CONFIG_THERMAL=y
-- 
2.0.0.rc2
