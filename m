From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v3 2/2] ARM: exynos_defconfig: Remove old non-working MIPI
 driver
Date: Fri, 16 Sep 2016 10:32:40 +0200
Message-ID: <1474014760-23173-2-git-send-email-k.kozlowski@samsung.com>
References: <1474014760-23173-1-git-send-email-k.kozlowski@samsung.com>
 <CGME20160916083252eucas1p12f57a9bc08176e10b8e07c3b421bb0ad@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40443 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753973AbcIPIc5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Sep 2016 04:32:57 -0400
In-reply-to: <1474014760-23173-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-fbdev@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Donghwa Lee <dh09.lee@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

The Exynos MIPI driver does not work anymore (it is board file only) so
it is removed.  Remove also config options.

Cc: Inki Dae <inki.dae@samsung.com>
Cc: Donghwa Lee <dh09.lee@samsung.com>
Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---

This does not really depend on patch #1. The driver is dysfunctional and
it does not work so defconfig change can be applied separately.

Changes since v2:
1. Remove also EXYNOS_MIPI_DSI, pointed out by Tomi Valkeinen.

Changes since v1:
1. New patch.
---
 arch/arm/configs/exynos_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 4e484f406419..c58f6841f8aa 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -168,8 +168,6 @@ CONFIG_DRM_PANEL_SAMSUNG_LD9040=y
 CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
 CONFIG_DRM_NXP_PTN3460=y
 CONFIG_DRM_PARADE_PS8622=y
-CONFIG_EXYNOS_VIDEO=y
-CONFIG_EXYNOS_MIPI_DSI=y
 CONFIG_LCD_CLASS_DEVICE=y
 CONFIG_LCD_PLATFORM=y
 CONFIG_BACKLIGHT_PWM=y
-- 
1.9.1
