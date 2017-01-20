From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/7] drm/exynos/hdmi: add 297MHz pixel clock support
Date: Fri, 20 Jan 2017 07:52:19 +0100
Message-ID: <1484895145-511-2-git-send-email-a.hajda@samsung.com>
References: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
 <CGME20170120065229eucas1p173d2b1844498dd3afdd9d2860cd1ee93@eucas1p1.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

297MHz is used by Ultra HD modes.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 5ed8b1e..bef8965 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -587,6 +587,15 @@ static const struct hdmiphy_config hdmiphy_5433_configs[] = {
 			0x08, 0x10, 0x01, 0x01, 0x48, 0x4a, 0x00, 0x40,
 		},
 	},
+	{
+		.pixel_clock = 297000000,
+		.conf = {
+			0x01, 0x51, 0x3E, 0x05, 0x40, 0xF0, 0x88, 0xC2,
+			0x52, 0x53, 0x44, 0x8C, 0x27, 0x00, 0x7C, 0xAC,
+			0xD6, 0x2B, 0x67, 0x00, 0x00, 0x04, 0x00, 0x30,
+			0x08, 0x10, 0x01, 0x01, 0x48, 0x40, 0x00, 0x40,
+		},
+	},
 };
 
 static const char * const hdmi_clk_gates4[] = {
-- 
2.7.4
