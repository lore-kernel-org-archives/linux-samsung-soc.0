Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CC7C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 11:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348925AbiEDLpQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 07:45:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348917AbiEDLpP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 07:45:15 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F50BE0D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 04:41:40 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id x12so956678pgj.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 04:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TNPlXaEmj37H/XyiSN7nG521CkkUGoBXiE5YF2Z5qG0=;
        b=W23KQ0WeqFlxnCOSps5cLVcwcVh6Qz7tOewfKpjXBCM1gl66u4IkUsizjNQPEQqM0G
         UjvbGS7X/Q9oX+pIbxOYHYKFv1ZLiFqIp3zqdWXdA+xbHzdok+95ls72XhCuLDcgE/6z
         gkB7Oe6btsHzmhLRMJvOqqjrFs+SOvydFmDxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TNPlXaEmj37H/XyiSN7nG521CkkUGoBXiE5YF2Z5qG0=;
        b=fJkrmZ7opJKNXB32xgilRs/KSnFBsxWFGQMXP+dIV5/8lM4MH+MQHFIFmpbbVlq2Kl
         i0KpQQQ7wR0Nt7UsbKkgseVxkhCvBE/Q9eKW3F/gSfOB2kwNAIup2tYqDuQlprctfNiH
         Z3ADrDiLp/krr1jEjOfpZZSc28xtYX3/aiEuVumu8lXB5I5CCcyjwmGcMj7qzQ3hiSbN
         5b/X7C5hC+nCGUKqfD+zkvSNMmKvHNvMerM73zOAeNvHMQkjcZgDiXqUrN7lWljM1dM7
         9giV/Z2RgiOQlsp5edTZschE/PFUxRtB68U91d6MDV8Na5t805sfgB9xUMIzdRqLORDi
         b5Yw==
X-Gm-Message-State: AOAM531qcV01Qh2noZ7tiJUedZSeLqsvVK7pOG5KGVqxhfqS9n63UhNr
        i+B9j9KhGiIuGhZxD3wyOv8QXw==
X-Google-Smtp-Source: ABdhPJyv8VNO7htE1aPmEI9LyKFPxkk/Vzl4wCatKzMnHMX6jp0KFeZzw20uWNgMty33rcJA2rSp4w==
X-Received: by 2002:a63:8a43:0:b0:3c2:2b52:848a with SMTP id y64-20020a638a43000000b003c22b52848amr11078595pgd.1.1651664499987;
        Wed, 04 May 2022 04:41:39 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
        by smtp.gmail.com with ESMTPSA id k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 04:41:39 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Fancy Fang <chen.fang@nxp.com>,
        Tim Harvey <tharvey@gateworks.com>,
        Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
        Adam Ford <aford173@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v2 08/12] drm: bridge: samsung-dsim: Add atomic_check
Date:   Wed,  4 May 2022 17:10:17 +0530
Message-Id: <20220504114021.33265-9-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixing up the mode flags is required in order to correlate the
correct sync flags of the surrounding components in the chain
to make sure the whole pipeline can work properly.

So, handle the mode flags via bridge, atomic_check.

v2:
* none

v1:
* fix mode flags in atomic_check instead of mode_fixup

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index b618e52d0ee3..bd78cef890e4 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1340,6 +1340,19 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
+				     struct drm_bridge_state *bridge_state,
+				     struct drm_crtc_state *crtc_state,
+				     struct drm_connector_state *conn_state)
+{
+	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+
+	adjusted_mode->flags |= (DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC);
+	adjusted_mode->flags &= ~(DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC);
+
+	return 0;
+}
+
 static void samsung_dsim_mode_set(struct drm_bridge *bridge,
 				  const struct drm_display_mode *mode,
 				  const struct drm_display_mode *adjusted_mode)
@@ -1361,6 +1374,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
 	.atomic_disable			= samsung_dsim_atomic_disable,
-- 
2.25.1

