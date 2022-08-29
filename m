Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D101ECAAD5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 29 Aug 2022 18:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbiH2SmA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 29 Aug 2022 14:42:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbiH2Sl7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 29 Aug 2022 14:41:59 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E416580F5A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:57 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d12so8844205plr.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Aug 2022 11:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=qMo2BeLrtj91nopBHoVSTvJhtNl7A+ypG14iH2k8FGY=;
        b=ZpgS7uftmGFZSOl04iBzw07gfA6KeIJ2fQHgJdHp6/ptvxE1Dq+yURTcxPw9CIbR24
         VCgXc2jNbaXZyz0DbzDzs5WYsY+fqxBtzVLvidscqpcSmWAtV14FLFAXQVnQwcCvOejU
         yHjNE+9yxlHEeYS3nMHg2hto6ctteXCgqaPGY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=qMo2BeLrtj91nopBHoVSTvJhtNl7A+ypG14iH2k8FGY=;
        b=RqqvC0U6mcC3uOFMcK1WjxUlBpA9z8G/ulubTV38IOJSD8yrQde4oF9lB4K88rQHxJ
         qWumtMyp6PHAmGbfRDLo+9PXIZ2UCWWZTfgmnugdL4hDRV148uv2Jk3VhFGk53YoNaeY
         L1ch7AUYR30lif2Xe4hdL0zeJmuISj76iGlGlr3G2DUuWfTkpcDit1c4DqeD+K3adb/v
         qGwxvuBdNKu9Va/VNHEssNnnprJ+Y+0xeJkF8L/TIu1o/gcQnwPfUBgPCBHzqZgpezoW
         /KyvVvg+JT4fj9TGUKO1x9EdNx5BLzjfaApurq9BhPXeylwqdEXJl8xkQNMhlvrfP8Je
         u9CQ==
X-Gm-Message-State: ACgBeo3bxIYiY4E5DbMpxh0kIi73P8iFLNmyVqvtpHnFNOcnZZ7EXuzU
        hnMLI51xKPk9HlFHy401dhLlvA==
X-Google-Smtp-Source: AA6agR7hMWj5/1V3tsTMLSCcFFbtUriMndHyxL8lVLtumQeeomynZwBGu9ElH5+6JDkGSIEupOzN3A==
X-Received: by 2002:a17:902:c611:b0:174:7f4c:3b4d with SMTP id r17-20020a170902c61100b001747f4c3b4dmr10823339plr.130.1661798517134;
        Mon, 29 Aug 2022 11:41:57 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:43f7:1644:6259:830d])
        by smtp.gmail.com with ESMTPSA id k13-20020aa7998d000000b005385e2e86eesm1619042pfh.18.2022.08.29.11.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 11:41:56 -0700 (PDT)
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v4 09/12] drm: bridge: samsung-dsim: Add atomic_get_input_bus_fmts
Date:   Tue, 30 Aug 2022 00:10:28 +0530
Message-Id: <20220829184031.1863663-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829184031.1863663-1-jagan@amarulasolutions.com>
References: <20220829184031.1863663-1-jagan@amarulasolutions.com>
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

v4:
* none

v3:
* include media-bus-format.h

v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 28 +++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 724fd76435c6..871cc8cc5352 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -15,6 +15,7 @@
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/irq.h>
+#include <linux/media-bus-format.h>
 #include <linux/of_device.h>
 #include <linux/phy/phy.h>
 
@@ -1341,6 +1342,32 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
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
@@ -1380,6 +1407,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
 	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.atomic_get_input_bus_fmts	= samsung_dsim_atomic_get_input_bus_fmts,
 	.atomic_check			= samsung_dsim_atomic_check,
 	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
 	.atomic_enable			= samsung_dsim_atomic_enable,
-- 
2.25.1

