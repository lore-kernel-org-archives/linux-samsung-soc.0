Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05893C07E96
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2AE961090
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229720AbhGDJHs (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:07:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229700AbhGDJHr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jul 2021 05:07:47 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 684DEC061762
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Jul 2021 02:05:12 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso9460906pjp.5
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2021 02:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cAMGUx6D5lcjN5rGbJFn80/U5mqs7hsNSGwdMUcGBEA=;
        b=bYcyLqXdvKSNW96jNDfbvT/WqZitouieNdGZZ/F/bhYnQIVg5ksKBJPcYevSnjEp1O
         EskwPy90LOG9t+H9ZSabO+crw1F7bP6UaHaeIMZ8nAjuxSoQtPBap9UbpOZJYs+Wx0V7
         8KwrjDY0CSnyrNNpyyW9e29FsiiCAkRXZatjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cAMGUx6D5lcjN5rGbJFn80/U5mqs7hsNSGwdMUcGBEA=;
        b=ZVwzT9XP2zoi/r9EWOzz73p7f8q1eFMcqHhLov7U/vnKSOW80PacmLDpo3E1fvHG9u
         XsPkDKai2ciLBRBrZ+IbqWGEXKW/ydbrUNz6I+s//k4+krvprovwETGAOF5WMPvgtRIY
         dHHBWAfnUVuiKOP/OMCBdPYLaYWa74lwOGzXAlgXFQE74IgLqTE7TfqKxgJhyGT02iMf
         d/9Xrr67l0SVB7MT3m/6nxS11IX9l0S8L1n21qoXw7/ZKgxjHpA3wQaiDMvUpEmjQJTo
         v1hoxRtaN/7HglqzyNpyKi431X2Iy+VWKeQlA+Lr2343R+NDLEUYbPW1bSTsGZToBpfK
         HPAA==
X-Gm-Message-State: AOAM533zmRiCBO1WH5/tXjZksGSxs6F4sYH5+qD9wNLSSsBP4J+CbrRp
        haM3kNaEewCNdd+bvFc7rZU3qg==
X-Google-Smtp-Source: ABdhPJyBs1eGIfUyVYgcoPgmsW20xNsSAFXzQgGn0x4pQWnoXzWWJw64+lJgRiayk/Jqgnbg0A5yGg==
X-Received: by 2002:a17:90b:792:: with SMTP id l18mr8895382pjz.55.1625389512016;
        Sun, 04 Jul 2021 02:05:12 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
        by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:05:11 -0700 (PDT)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Marek Vasut <marex@denx.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Fabio Estevam <festevam@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [RFC PATCH 10/17] drm: bridge: samsung-dsim: Update the of_node for port(s)
Date:   Sun,  4 Jul 2021 14:32:23 +0530
Message-Id: <20210704090230.26489-11-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Existing bridge driver is able to find the panel or bridge
if of_node isn't a port(s). This is how the exynos dsi
node handling has been done so far.

However in order to make use of this bridge in other or
new supported platforms like i.MX8MM it is required to
have a port based of_node.

So, this patch will check if node is a port based and
then update of_node.

This way we can support the platforms which are using
legacy or new DSI bindings.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 627580abd6df..2222c27feffd 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -226,6 +226,11 @@ enum samsung_dsim_transfer_type {
 	EXYNOS_DSI_RX,
 };
 
+enum {
+	DSI_PORT_IN,
+	DSI_PORT_OUT
+};
+
 struct samsung_dsim_transfer {
 	struct list_head list;
 	struct completion completed;
@@ -1436,6 +1441,15 @@ static int samsung_dsim_panel_or_bridge(struct samsung_dsim *dsi,
 {
 	struct drm_bridge *panel_bridge;
 	struct drm_panel *panel;
+	struct device_node *remote;
+
+	if (of_graph_is_present(node)) {
+		remote = of_graph_get_remote_node(node, DSI_PORT_OUT, 0);
+		if (!remote)
+			return -ENODEV;
+
+		node = remote;
+	}
 
 	panel_bridge = of_drm_find_bridge(node);
 	if (!panel_bridge) {
@@ -1579,11 +1593,6 @@ static int samsung_dsim_of_read_u32(const struct device_node *np,
 	return ret;
 }
 
-enum {
-	DSI_PORT_IN,
-	DSI_PORT_OUT
-};
-
 static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
 {
 	struct device *dev = dsi->dev;
-- 
2.25.1

