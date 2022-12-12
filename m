Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEF9C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 14:55:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbiLLOzh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 09:55:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiLLOzg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 09:55:36 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5811B1D
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:55:35 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id o1-20020a17090a678100b00219cf69e5f0so29061pjj.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y/y5vw0u9kB/6hX1ihxQilGZuqMG9YrydhtDvt3iYOI=;
        b=BuTOUmaReEVhSmrY4tNdyrVDylbaCAI9zI2x/KRj7AlKYnD+crXBjLg6I7Tl/K9/vI
         7QH/rUKSJ+wzvtLhF/iZXahZ0wjb/yur7gwTxnf3Qeoh059IGL2sgnZosXbPWh+9+ZlZ
         cLirNBdGyjHNotHKA9aW8XHZvkVPpgqMebgpM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y/y5vw0u9kB/6hX1ihxQilGZuqMG9YrydhtDvt3iYOI=;
        b=38NpfehruPe2JYL3DXx/f6g1C4He/5QspC9IpgWGLjTTWglttDTUz56XUC5zqwKQVN
         3PXT8/RTDHs3dx/N4VPnd75rUTlkzGdl2emSfZKnvipKhGOUfLtiMhnBZIFQnh2++glH
         qd1JBCIh5uiL603o4IOctbCjvbchFpKun5dvieSBUkIM87mMiSCHpgeN3RQFQDMmymRH
         lwd/NYMZwXbB0zAZVMk/T6LDr3p8uC+B5ypmzIfxLq7RN4AE0UIiRtSypDad1W+mZw//
         79jJKrccilHHmTJJ3LbQ/n2aeF500Ws1kwSyMRnJeDCE6W5kScDB3Y3YfTpO3zyUTMGj
         kIRA==
X-Gm-Message-State: ANoB5plY0wEu2Tddfkxa+RpSlmBmz7+CIvxZi/EpU/av8GcFzYFaJkaN
        hJomduqH8vUIRDwTlYbUemKdPw==
X-Google-Smtp-Source: AA0mqf78CzP6wF4vC+jXEZ80TBSbKmyUeLFBAdMzjJ3bFN/hcrsPFs0IqmKVYOdlesA41J6QEB2Xew==
X-Received: by 2002:a17:902:b494:b0:188:635d:4ca9 with SMTP id y20-20020a170902b49400b00188635d4ca9mr17072148plr.2.1670856935321;
        Mon, 12 Dec 2022 06:55:35 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
        by smtp.gmail.com with ESMTPSA id e11-20020a170902784b00b001782aab6318sm6463272pln.68.2022.12.12.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 06:55:34 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v10 3/3] drm: exynos: dsi: Restore proper bridge chain order
Date:   Mon, 12 Dec 2022 20:25:08 +0530
Message-Id: <20221212145508.15096-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212145508.15096-1-jagan@amarulasolutions.com>
References: <20221212145508.15096-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

Restore the proper bridge chain by finding the previous bridge
in the chain instead of passing NULL.

This establishes a proper bridge chain while attaching downstream
bridges.

Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- collect Marek review tag

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index ec673223d6b7..e5b1540c4ae4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1428,7 +1428,8 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
 {
 	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
 
-	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, NULL, flags);
+	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
+				 flags);
 }
 
 static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
@@ -1474,7 +1475,10 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 
 	drm_bridge_add(&dsi->bridge);
 
-	drm_bridge_attach(encoder, &dsi->bridge, NULL, 0);
+	drm_bridge_attach(encoder, &dsi->bridge,
+			  list_first_entry_or_null(&encoder->bridge_chain,
+						   struct drm_bridge,
+						   chain_node), 0);
 
 	/*
 	 * This is a temporary solution and should be made by more generic way.
-- 
2.25.1

