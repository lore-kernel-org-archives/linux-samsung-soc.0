From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/7] drm/exynos/hdmi: fix VSI infoframe registers
Date: Fri, 20 Jan 2017 07:52:20 +0100
Message-ID: <1484895145-511-3-git-send-email-a.hajda@samsung.com>
References: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
 <CGME20170120065230eucas1p20a73a6911158fb6eb2f2d2b22db36aba@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:20713 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751324AbdATGwk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2017 01:52:40 -0500
In-reply-to: <1484895145-511-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>, dri-devel@lists.freedesktop.org, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org

VSI infoframe registers address space is non-contiguous, so infoframe write
should be split into two chunks.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index bef8965..223b872 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -797,7 +797,8 @@ static void hdmi_reg_infoframes(struct hdmi_context *hdata)
 				sizeof(buf));
 	if (ret > 0) {
 		hdmi_reg_writeb(hdata, HDMI_VSI_CON, HDMI_VSI_CON_EVERY_VSYNC);
-		hdmi_reg_write_buf(hdata, HDMI_VSI_HEADER0, buf, ret);
+		hdmi_reg_write_buf(hdata, HDMI_VSI_HEADER0, buf, 3);
+		hdmi_reg_write_buf(hdata, HDMI_VSI_DATA(0), buf + 3, ret - 3);
 	}
 
 	ret = hdmi_audio_infoframe_init(&frm.audio);
-- 
2.7.4
