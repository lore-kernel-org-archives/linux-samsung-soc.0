Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF0EDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 11:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348927AbiEDLp0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 07:45:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348917AbiEDLpY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 07:45:24 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F31E3E0D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 04:41:47 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id i1so1167560plg.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 04:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jWSHVu+7IAWvBpqPb+jQsUxTFN1rZcSZyH+a13sKnuI=;
        b=IHL89BZYzhXlV38jI5gZdoO7MBcW6BvpVmm3/+33MI9uuOsLc6RAW1+BymgrGxnfdt
         CtcVmPbyfKgQWBSqW9vZ75VGKum1CCCcw9t9L4kRkZdeMvOO/O0QMU1nGekacufNJqNE
         KSUf8emo8lGijn7aX3RVQrcwqE6hnFx9dtQGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jWSHVu+7IAWvBpqPb+jQsUxTFN1rZcSZyH+a13sKnuI=;
        b=1XY9Vmac9vh+ttG+/g27L2+a+ZK6BnLTTHyTNymImzZw19jK4tkgxLkbOrpcDbK++2
         Fxz8b9dkAkABsDjKeFIyJ/TEzvFOkt60rcE66pXSbZr6i75U8AQoTEOFAzssyS2AO//r
         OcNHAISeYTjfJHs5j3EYdr6QdlEqGg4zSVOPeh4b+gckcjZIVQ8uT7qPjLReDPZ4hHts
         dGsKjOLcqGd3ZxAi7fouBR96Y51yRUVDJwkzc3YRZOjzS0kW0OXMvetdH/uBPFpX9psn
         zEWdrNGHcP7MqLZmncmNUPj2FDNHEqpXdmA4rrwZrgTwhkEcf+F6ouax+8ZqsptTw6CY
         qCNg==
X-Gm-Message-State: AOAM5314+sX0LrhnGli5uqT21AMGlUhlcbkcyMZ2TwURtqr+57BfRZ9e
        IpYwxG5W4z1DAinrHLhK30t/mg==
X-Google-Smtp-Source: ABdhPJxhxCXzI7wNrMf1pZ0x9mGHP4ldE78j55EmFNfzRi2aTDacO5xEKJEhpQ/Wh07jH+s2gVYSsA==
X-Received: by 2002:a17:90a:5d08:b0:1d7:9587:9288 with SMTP id s8-20020a17090a5d0800b001d795879288mr9750437pji.204.1651664507494;
        Wed, 04 May 2022 04:41:47 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
        by smtp.gmail.com with ESMTPSA id k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 04:41:47 -0700 (PDT)
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
Subject: [PATCH v2 09/12] drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
Date:   Wed,  4 May 2022 17:10:18 +0530
Message-Id: <20220504114021.33265-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Finding the right input bus format throughout the pipeline is hard
so add atomic_get_input_bus_fmts callback and initialize with the
default RGB888_1X24 bus format on DSI-end.

This format can be used in pipeline for negotiating bus format between
the DSI-end of this bridge and the other component closer to pipeline
components.

v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index bd78cef890e4..407abd488005 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1340,6 +1340,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
 	pm_runtime_put_sync(dsi->dev);
 }
 
+#define MAX_INPUT_SEL_FORMATS	1
+
+static u32 *
+samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
+				       struct drm_bridge_state *bridge_state,
+				       struct drm_crtc_state *crtc_state,
+				       struct drm_connector_state *conn_state,
+				       u32 output_fmt,
+				       unsigned int *num_input_fmts)
+{
+	u32 *input_fmts;
+
+	*num_input_fmts = 0;
+
+	input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts),
+			     GFP_KERNEL);
+	if (!input_fmts)
+		return NULL;
+
+	/* This is the DSI-end bus format */
+	input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
+	*num_input_fmts = 1;
+
+	return input_fmts;
+}
+
 static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 				     struct drm_bridge_state *bridge_state,
 				     struct drm_crtc_state *crtc_state,
@@ -1374,6 +1400,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts	= samsung_dsim_atomic_get_input_bus_fmts,
 	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
-- 
2.25.1

