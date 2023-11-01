Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0506C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Nov 2023 20:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346378AbjKAURt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 1 Nov 2023 16:17:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346375AbjKAURt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 1 Nov 2023 16:17:49 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5416CC1;
        Wed,  1 Nov 2023 13:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1698869858;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=IoK/DWTc/F2oNroTlg8YVK4rpr4uwrYEr8RTRWYORG8=;
        b=pTrlUS5G7n8G6OlGCg4lOP6rgfng255bcKTAZRh9QqcKabyJ8QoitHTCLt0M1JV4odCO2v
        oTZGN4QXHf43wWDvCF6kT8Ah8W9vjDUICO+n0ZpV1v4KXb45vsW1RqYAwW3V+eNB4ndx6p
        ZzKElgmcDKb0oWX6aIwNNvdzXZgiBSM=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] drm/exynos: dpi: Change connector type to DPI
Date:   Wed,  1 Nov 2023 21:17:31 +0100
Message-ID: <20231101201731.46192-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

When exynos_drm_dpi.c was written, DRM_MODE_CONNECTOR_DPI did not exist
yet and I guess that's the reason why DRM_MODE_CONNECTOR_VGA was used as
the connector type.

However, now it makes more sense to use DRM_MODE_CONNECTOR_DPI as the
connector type.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/exynos/exynos_drm_dpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
index 378e5381978f..0dc36df6ada3 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
@@ -101,7 +101,7 @@ static int exynos_dpi_create_connector(struct drm_encoder *encoder)
 
 	ret = drm_connector_init(encoder->dev, connector,
 				 &exynos_dpi_connector_funcs,
-				 DRM_MODE_CONNECTOR_VGA);
+				 DRM_MODE_CONNECTOR_DPI);
 	if (ret) {
 		DRM_DEV_ERROR(ctx->dev,
 			      "failed to initialize connector with drm\n");
-- 
2.42.0

