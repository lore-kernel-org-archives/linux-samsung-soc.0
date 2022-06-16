Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7227AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 16 Jun 2022 07:23:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230159AbiFPHXy (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Jun 2022 03:23:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiFPHXx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Jun 2022 03:23:53 -0400
Received: from smtpbg153.qq.com (smtpbg153.qq.com [13.245.218.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 251883630F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jun 2022 00:23:50 -0700 (PDT)
X-QQ-mid: bizesmtp82t1655364220tyuagdlm
Received: from localhost.localdomain ( [113.57.152.160])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Thu, 16 Jun 2022 15:23:33 +0800 (CST)
X-QQ-SSF: 01400000002000D0M000B00A0000000
X-QQ-FEAT: hR9GyqeohSiJBYTk+od0+lv++0Drp2ggk1O87ehDvPVH2JX41fZIZnXCoewT9
        TvOgRgq9lVfPm0SlkOBg/+/dgKmP5Dzt0drUXwhgN8R93L+T0Zp4KSovkT1dPALxMg/IQfL
        RBcW5ySW1hUXBXv/mduoWlWrFI5HvhFqXSH77EulhOr4Ica2nZwXQlFQhuMQlf8stKZLM8P
        TP7X4WgIl5QbsfoimPYgTJ9fRL1JsGn0gwq/w3fpgLasqQ8P1KlYVhziuulIozvFw7Xb07h
        bkPzEW0TqvRHqZmEFVskxWZrIU8nI7SCXjwsnBU/paad1lTQNLDn1JfMkFnMpV858Xicslp
        pikr4+oLT6sVb4zG5jbg51o21kVPA==
X-QQ-GoodBg: 2
From:   hongao <hongao@uniontech.com>
To:     inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        airlied@linux.ie, daniel@ffwll.ch, krzysztof.kozlowski@linaro.org,
        alim.akhtar@samsung.com
Cc:     dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        hongao <hongao@uniontech.com>
Subject: [PATCH] drm/exynos: replace drm_detect_hdmi_monitor() with drm_display_info.is_hdmi
Date:   Thu, 16 Jun 2022 15:22:33 +0800
Message-Id: <20220616072233.8302-1-hongao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign8
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Once EDID is parsed, the monitor HDMI support information is available
through drm_display_info.is_hdmi.

This driver calls drm_detect_hdmi_monitor() to receive the same
information, which is less efficient.

Avoid calling drm_detect_hdmi_monitor() and use drm_display_info.is_hdmi
instead.

Signed-off-by: hongao <hongao@uniontech.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 7655142a4651..17e9f5efbcfc 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -893,7 +893,7 @@ static int hdmi_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return -ENODEV;
 
-	hdata->dvi_mode = !drm_detect_hdmi_monitor(edid);
+	hdata->dvi_mode = !connector->display_info.is_hdmi;
 	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
 			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
 			  edid->width_cm, edid->height_cm);
-- 
2.20.1



