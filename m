From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] drm: exynos: Use proper macro definition for
 HDMI_I2S_PIN_SEL_1
Date: Mon, 05 Feb 2018 18:42:12 +0100
Message-ID: <20180205174212.10791-1-s.nawrocki@samsung.com>
References: <CGME20180205174229epcas1p1e15e6f8ef5248ee28fa2e649faa8a866@epcas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:47567 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752738AbeBERmc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Feb 2018 12:42:32 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: inki.dae@samsung.com
Cc: jy0922.shim@samsung.com, sw0312.kim@samsung.com, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Bit field [2:0] of HDMI_I2S_PIN_SEL_1 corresponds to SDATA_0,
not SDATA_2. This patch removes redefinition of HDMI_I2S_SEL_DATA2
constant and adds missing HDMI_I2S_SEL_DATA0. There is no functional
change.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 7 +++++--
 drivers/gpu/drm/exynos/regs-hdmi.h   | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index a4b75a46f946..abd84cbcf1c2 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1068,10 +1068,13 @@ static void hdmi_audio_config(struct hdmi_context *hdata)
 	/* Configuration I2S input ports. Configure I2S_PIN_SEL_0~4 */
 	hdmi_reg_writeb(hdata, HDMI_I2S_PIN_SEL_0, HDMI_I2S_SEL_SCLK(5)
 			| HDMI_I2S_SEL_LRCK(6));
-	hdmi_reg_writeb(hdata, HDMI_I2S_PIN_SEL_1, HDMI_I2S_SEL_SDATA1(1)
-			| HDMI_I2S_SEL_SDATA2(4));
+
+	hdmi_reg_writeb(hdata, HDMI_I2S_PIN_SEL_1, HDMI_I2S_SEL_SDATA1(3)
+			| HDMI_I2S_SEL_SDATA0(4));
+
 	hdmi_reg_writeb(hdata, HDMI_I2S_PIN_SEL_2, HDMI_I2S_SEL_SDATA3(1)
 			| HDMI_I2S_SEL_SDATA2(2));
+
 	hdmi_reg_writeb(hdata, HDMI_I2S_PIN_SEL_3, HDMI_I2S_SEL_DSD(0));
 
 	/* I2S_CON_1 & 2 */
diff --git a/drivers/gpu/drm/exynos/regs-hdmi.h b/drivers/gpu/drm/exynos/regs-hdmi.h
index 04be0f7e8193..4420c203ac85 100644
--- a/drivers/gpu/drm/exynos/regs-hdmi.h
+++ b/drivers/gpu/drm/exynos/regs-hdmi.h
@@ -464,7 +464,7 @@
 
 /* I2S_PIN_SEL_1 */
 #define HDMI_I2S_SEL_SDATA1(x)		(((x) & 0x7) << 4)
-#define HDMI_I2S_SEL_SDATA2(x)		((x) & 0x7)
+#define HDMI_I2S_SEL_SDATA0(x)		((x) & 0x7)
 
 /* I2S_PIN_SEL_2 */
 #define HDMI_I2S_SEL_SDATA3(x)		(((x) & 0x7) << 4)
-- 
2.14.2
