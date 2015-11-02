From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 5/7] drm/exynos/hdmi: stop programming registers with default
 values
Date: Mon, 02 Nov 2015 14:16:43 +0100
Message-ID: <1446470205-15606-6-git-send-email-a.hajda@samsung.com>
References: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32219 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752853AbbKBNSE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Nov 2015 08:18:04 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NX600EELVM2J090@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 02 Nov 2015 13:18:02 +0000 (GMT)
In-reply-to: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

There is no point in rewriting default values, as the IP is reset anyway.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 13eea02..e44e2f6 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1434,20 +1434,12 @@ static void hdmi_v13_mode_apply(struct hdmi_context *hdata)
 		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST_L, 2,
 				m->vtotal - m->vdisplay);
 		hdmi_reg_writev(hdata, HDMI_TG_VACT_SZ_L, 2, m->vdisplay);
-		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST2_L, 2, 0x248);
 	}
 
 	hdmi_reg_writev(hdata, HDMI_TG_H_FSZ_L, 2, m->htotal);
 	hdmi_reg_writev(hdata, HDMI_TG_HACT_ST_L, 2, m->htotal - m->hdisplay);
 	hdmi_reg_writev(hdata, HDMI_TG_HACT_SZ_L, 2, m->hdisplay);
 	hdmi_reg_writev(hdata, HDMI_TG_V_FSZ_L, 2, m->vtotal);
-	hdmi_reg_writev(hdata, HDMI_TG_VSYNC_L, 2, 0x1);
-	hdmi_reg_writev(hdata, HDMI_TG_VSYNC2_L, 2, 0x233);
-	hdmi_reg_writev(hdata, HDMI_TG_FIELD_CHG_L, 2, 0x233);
-	hdmi_reg_writev(hdata, HDMI_TG_VSYNC_TOP_HDMI_L, 2, 0x1);
-	hdmi_reg_writev(hdata, HDMI_TG_VSYNC_BOT_HDMI_L, 2, 0x233);
-	hdmi_reg_writev(hdata, HDMI_TG_FIELD_TOP_HDMI_L, 2, 0x1);
-	hdmi_reg_writev(hdata, HDMI_TG_FIELD_BOT_HDMI_L, 2, 0x233);
 }
 
 static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
@@ -1520,12 +1512,6 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST_L, 2,
 				m->vtotal - m->vdisplay);
 		hdmi_reg_writev(hdata, HDMI_TG_VACT_SZ_L, 2, m->vdisplay);
-		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST2_L, 2, 0x248);
-		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST3_L, 2, 0x47b);
-		hdmi_reg_writev(hdata, HDMI_TG_VACT_ST4_L, 2, 0x6ae);
-		hdmi_reg_writev(hdata, HDMI_TG_VSYNC2_L, 2, 0x233);
-		hdmi_reg_writev(hdata, HDMI_TG_VSYNC_BOT_HDMI_L, 2, 0x233);
-		hdmi_reg_writev(hdata, HDMI_TG_FIELD_BOT_HDMI_L, 2, 0x233);
 	}
 
 	hdmi_reg_writev(hdata, HDMI_H_SYNC_START_0, 2,
@@ -1555,11 +1541,6 @@ static void hdmi_v14_mode_apply(struct hdmi_context *hdata)
 	hdmi_reg_writev(hdata, HDMI_TG_HACT_ST_L, 2, m->htotal - m->hdisplay);
 	hdmi_reg_writev(hdata, HDMI_TG_HACT_SZ_L, 2, m->hdisplay);
 	hdmi_reg_writev(hdata, HDMI_TG_V_FSZ_L, 2, m->vtotal);
-	hdmi_reg_writev(hdata, HDMI_TG_VSYNC_L, 2, 0x1);
-	hdmi_reg_writev(hdata, HDMI_TG_FIELD_CHG_L, 2, 0x233);
-	hdmi_reg_writev(hdata, HDMI_TG_VSYNC_TOP_HDMI_L, 2, 0x1);
-	hdmi_reg_writev(hdata, HDMI_TG_FIELD_TOP_HDMI_L, 2, 0x1);
-	hdmi_reg_writev(hdata, HDMI_TG_3D, 1, 0x0);
 }
 
 static void hdmi_mode_apply(struct hdmi_context *hdata)
-- 
1.9.1
