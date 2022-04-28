Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F4F2C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Apr 2022 09:59:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232404AbiD1KCW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Apr 2022 06:02:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232496AbiD1KBn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 06:01:43 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5286C115F
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Apr 2022 02:48:51 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id fv2so3827690pjb.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Apr 2022 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fSO9EXYOSC33q6TMX5paIc/n59vloq374c1uB49deWM=;
        b=lnQNze7+jFujdkFXJPJfBt6/k5oksgU2Pkrrcc939SLbfLUjBvRUuV/xdmQ3R7vikQ
         FgVbhUadFGwy8Dh1iZbz5ZZcDqx4vMad47H7O94j+lbq4+WCGZhE7MgCReYBtxJ5AORe
         B6UNhu155N/bJ39ktDXmGtWV6vNBlx/nHhQy4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fSO9EXYOSC33q6TMX5paIc/n59vloq374c1uB49deWM=;
        b=eHSFiMEoKTDkVyWacgHiUQKoaq9TvwonF9Cih5ro4E44+OdboyZGYUNfbW19USoj9b
         9E+giuCpeR/Y2qDECNXbRHiHAaND6zMcc8B/sNeXWZd4AXPV63Utgnx3vRGY7QPIO0Bw
         VnrxpT1ap9ilh0hcf3wbB1EqSOAGLb5u9nlpOAr5U19nGc++Byvxk51bqeesKoQw6qAg
         IJUyqqvreYjHWqzuafUYrXjx53gXN6DW2iWrau6esfay+bcrRi6ghLR3QyWvPo/269KX
         1aqiS25Lwx3LjNkS34pkkQkK8Fx/vxnnDOAspNFcjLKoaFrNZR+sYZHeuFK2PwHVmfmA
         62sw==
X-Gm-Message-State: AOAM533iiU9y5DD5fxhyum4/D9adoeYnWjeKkkmQkK5uZgCqF2EJ0W4h
        X3ueOD8s8u1KpnMIGH/K56mkxg==
X-Google-Smtp-Source: ABdhPJyUCD1z4gkX7WSEW0e3FmG+iKkdGrfJgz2PYXdFAgQZ9R0yCSp9G2tj9QZIswGWvgOQdNs7Qg==
X-Received: by 2002:a17:902:ce01:b0:15c:eedb:f00c with SMTP id k1-20020a170902ce0100b0015ceedbf00cmr24832151plg.122.1651139330761;
        Thu, 28 Apr 2022 02:48:50 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:a3c7:357:7b61:223a])
        by smtp.gmail.com with ESMTPSA id y9-20020a17090a1f4900b001cd498dc153sm9842845pjy.3.2022.04.28.02.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Apr 2022 02:48:50 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Maxime Ripard <maxime@cerno.tech>,
        Inki Dae <inki.dae@samsung.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     linux-amarula@amarulasolutions.com,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH] drm: exynos: dsi: Use child panel or bridge find helpers
Date:   Thu, 28 Apr 2022 15:18:08 +0530
Message-Id: <20220428094808.782938-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

commit <711c7adc4687> ("drm: exynos: dsi: Use drm panel_bridge API")
added devm_drm_of_get_bridge for looking up if child node has panel
or bridge.

However commit <b089c0a9b14c> ("Revert "drm: of: Lookup if child node
has panel or bridge") has reverted panel or bridge child node lookup
from devm_drm_of_get_bridge which eventually failed to find the DSI
devices in exynos drm dsi driver.

So, use the conventional child panel bridge lookup helpers like it
does before.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index f067c86b0b12..ec673223d6b7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -25,6 +25,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_mipi_dsi.h>
+#include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
@@ -1451,9 +1452,18 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	struct device *dev = dsi->dev;
 	struct drm_encoder *encoder = &dsi->encoder;
 	struct drm_device *drm = encoder->dev;
+	struct drm_panel *panel;
 	int ret;
 
-	dsi->out_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
+	panel = of_drm_find_panel(device->dev.of_node);
+	if (!IS_ERR(panel)) {
+		dsi->out_bridge = devm_drm_panel_bridge_add(dev, panel);
+	} else {
+		dsi->out_bridge = of_drm_find_bridge(device->dev.of_node);
+		if (!dsi->out_bridge)
+			dsi->out_bridge = ERR_PTR(-EINVAL);
+	}
+
 	if (IS_ERR(dsi->out_bridge)) {
 		ret = PTR_ERR(dsi->out_bridge);
 		DRM_DEV_ERROR(dev, "failed to find the bridge: %d\n", ret);
-- 
2.25.1

