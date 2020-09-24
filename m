Return-Path: <SRS0=DxXa=DB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF73C4346E
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 24 Sep 2020 08:32:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B50B23772
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 24 Sep 2020 08:32:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="LXChwB/R"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727193AbgIXIcA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 24 Sep 2020 04:32:00 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:47906 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727051AbgIXIb6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Sep 2020 04:31:58 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20200924083157euoutp01c0ac8621cb11c71ce9d39b539517bcf7~3qxkxlo-Z0335103351euoutp01J
        for <linux-samsung-soc@vger.kernel.org>; Thu, 24 Sep 2020 08:31:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20200924083157euoutp01c0ac8621cb11c71ce9d39b539517bcf7~3qxkxlo-Z0335103351euoutp01J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1600936317;
        bh=eVj4D/ix98W+nGOcKd3EOlZerUq6l2PfF6CunR81zuk=;
        h=From:To:Cc:Subject:Date:References:From;
        b=LXChwB/RCQsB5dKORG0Oe4fvVgD/KJCtBPAFGQmGsqOu2KMecvz0lXBgL+Po3UOMf
         1w1tO7XJ6Ngu9+nlHN5NBh+96oD9cERGcicFdfOIFr1HFJElJn4/pvxfVIgdwEY2Vd
         52ag8VZJ491Gld2Qq4AwG2ChFZ3XuHvnqw14pXdI=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20200924083156eucas1p1d02776091f229cf1f2c225ca733f5b57~3qxkbfTey1301313013eucas1p1_;
        Thu, 24 Sep 2020 08:31:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id E6.F9.06456.C795C6F5; Thu, 24
        Sep 2020 09:31:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20200924083156eucas1p14406128445a655393013effe719f2228~3qxkIEqtq2203122031eucas1p1t;
        Thu, 24 Sep 2020 08:31:56 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20200924083156eusmtrp2b2c389a8dafcbb121822681070231a8d~3qxkHTtUE2983029830eusmtrp2p;
        Thu, 24 Sep 2020 08:31:56 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-b6-5f6c597ca298
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 28.29.06314.C795C6F5; Thu, 24
        Sep 2020 09:31:56 +0100 (BST)
Received: from AMDC2765.digital.local (unknown [106.120.51.73]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20200924083156eusmtip2674245e03c238d4b0435c17ee62a0fb8~3qxjrKb0p1003110031eusmtip2A;
        Thu, 24 Sep 2020 08:31:56 +0000 (GMT)
From:   Marek Szyprowski <m.szyprowski@samsung.com>
To:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: tc358764: restore connector support
Date:   Thu, 24 Sep 2020 10:31:45 +0200
Message-Id: <20200924083145.23312-1-m.szyprowski@samsung.com>
X-Mailer: git-send-email 2.17.1
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpileLIzCtJLcpLzFFi42LZduznOd2ayJx4g2nbjSxurTvHanHl63s2
        i6vfXzJbnHxzlcWic+ISdovLu+awWcw4v4/JYu2Ru+wWh/qiHTg93t9oZfeY3TGT1ePEhEtM
        Hve7jzN59G1ZxehxoHcyi8fnTXIB7FFcNimpOZllqUX6dglcGe1nVrMWHDGtWHTmI0sD42ed
        LkZODgkBE4lnE2azdzFycQgJrGCUOHriDJTzhVHizOyNLBDOZ0aJD00NjDAtu46vhEosZ5Q4
        veg+G1zL4T23WEGq2AQMJbredrGB2CICbhJNh2eyghQxCyxlktje9I0dJCEs4CAxp2k2mM0i
        oCrxasUOsAZeAVuJ269vMkOsk5dYveEAlP2ZTeL2zBoI20Vi8sUPLBC2sMSr41vYIWwZif87
        5zOBLJMQaGaUeHhuLTuE08MocblpBtQT1hJ3zv0C2sYBdJKmxPpd+hBhR4nXG9uZQcISAnwS
        N94KgoSZgcxJ26ZDhXklOtqEIKrVJGYdXwe39uCFS1Bnekj0rnrGBFIuJBArsXuS+QRGuVkI
        qxYwMq5iFE8tLc5NTy02zEst1ytOzC0uzUvXS87P3cQITBmn/x3/tIPx66WkQ4wCHIxKPLwc
        utnxQqyJZcWVuYcYJTiYlUR4nc6ejhPiTUmsrEotyo8vKs1JLT7EKM3BoiTOa7zoZayQQHpi
        SWp2ampBahFMlomDU6qB8SBTTy5f8nHXqeKai3/E5V3c9KJ37mv/VIYVl+bUSwldyfGdmPv/
        o3IlT7Pol8mRrPNMAvsE9jmaf795Y/GbHzX2U7MFXddH6R3Vn5Qjtvd+zMRJjyb071jApq5t
        w2hx7bpg3d+t0zOu/on9GXJYOyVo9cubJVaOcq5bZsTtYxVVVfo7tWqHrxJLcUaioRZzUXEi
        AEPZIcwVAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrBLMWRmVeSWpSXmKPExsVy+t/xe7o1kTnxBm9PylrcWneO1eLK1/ds
        Fle/v2S2OPnmKotF58Ql7BaXd81hs5hxfh+Txdojd9ktDvVFO3B6vL/Ryu4xu2Mmq8eJCZeY
        PO53H2fy6NuyitHjQO9kFo/Pm+QC2KP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUMjc1j
        rYxMlfTtbFJSczLLUov07RL0MtrPrGYtOGJasejMR5YGxs86XYycHBICJhK7jq9k6WLk4hAS
        WMooMe/LbUaIhIzEyWkNrBC2sMSfa11sILaQwCdGidtbbUBsNgFDia63EHERAQ+J5m/H2UEG
        MQusZJLov7gSLCEs4CAxp2k2O4jNIqAq8WrFDrA4r4CtxO3XN5khFshLrN5wgHkCI88CRoZV
        jCKppcW56bnFhnrFibnFpXnpesn5uZsYgaG67djPzTsYL20MPsQowMGoxMPLoZsdL8SaWFZc
        mXuIUYKDWUmE1+ns6Tgh3pTEyqrUovz4otKc1OJDjKZAyycyS4km5wPjKK8k3tDU0NzC0tDc
        2NzYzEJJnLdD4GCMkEB6YklqdmpqQWoRTB8TB6dUA2O57lKhQL3WtUsyT1guN12zvDJhyh75
        3bP07Jx+v19xftJM55cVXc1fD+3OVqrd/Et3lf2Gi7OOHngSuItR6QjvXQHhA19/PWRKVH13
        No13VVPHN4NKgZ873gRM/yUi5qxflvmu/dN34Vw/tcv+3HkL72zKTM8WsfQz1Mv4/9pY/OeE
        4rUpWqlKLMUZiYZazEXFiQDl6lx7awIAAA==
X-CMS-MailID: 20200924083156eucas1p14406128445a655393013effe719f2228
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20200924083156eucas1p14406128445a655393013effe719f2228
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200924083156eucas1p14406128445a655393013effe719f2228
References: <CGME20200924083156eucas1p14406128445a655393013effe719f2228@eucas1p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch restores DRM connector registration in the TC358764 bridge
driver and restores usage of the old drm_panel_* API, thus allows dynamic
panel registration. This fixes panel operation on Exynos5250-based
Arndale board.

This is equivalent to the revert of the following commits:
1644127f83bc "drm/bridge: tc358764: add drm_panel_bridge support"
385ca38da29c "drm/bridge: tc358764: drop drm_connector_(un)register"
and removal of the calls to drm_panel_attach()/drm_panel_detach(), which
were no-ops and has been removed in meanwhile.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
As I've reported and Andrzej Hajda pointed, the reverted patches break
operation of the panel on the Arndale board. Noone suggested how to fix
the regression, I've decided to send a revert until a new solution is
found.

The issues with tc358764 might be automatically resolved once the Exynos
DSI itself is converted to DRM bridge:
https://patchwork.kernel.org/cover/11770683/
but that approach has also its own issues so far.

Best regards,
Marek Szyprowski
---
 drivers/gpu/drm/bridge/tc358764.c | 107 +++++++++++++++++++++++++-----
 1 file changed, 92 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index d89394bc5aa4..c1e35bdf9232 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -153,9 +153,10 @@ static const char * const tc358764_supplies[] = {
 struct tc358764 {
 	struct device *dev;
 	struct drm_bridge bridge;
+	struct drm_connector connector;
 	struct regulator_bulk_data supplies[ARRAY_SIZE(tc358764_supplies)];
 	struct gpio_desc *gpio_reset;
-	struct drm_bridge *panel_bridge;
+	struct drm_panel *panel;
 	int error;
 };
 
@@ -209,6 +210,12 @@ static inline struct tc358764 *bridge_to_tc358764(struct drm_bridge *bridge)
 	return container_of(bridge, struct tc358764, bridge);
 }
 
+static inline
+struct tc358764 *connector_to_tc358764(struct drm_connector *connector)
+{
+	return container_of(connector, struct tc358764, connector);
+}
+
 static int tc358764_init(struct tc358764 *ctx)
 {
 	u32 v = 0;
@@ -271,11 +278,43 @@ static void tc358764_reset(struct tc358764 *ctx)
 	usleep_range(1000, 2000);
 }
 
+static int tc358764_get_modes(struct drm_connector *connector)
+{
+	struct tc358764 *ctx = connector_to_tc358764(connector);
+
+	return drm_panel_get_modes(ctx->panel, connector);
+}
+
+static const
+struct drm_connector_helper_funcs tc358764_connector_helper_funcs = {
+	.get_modes = tc358764_get_modes,
+};
+
+static const struct drm_connector_funcs tc358764_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static void tc358764_disable(struct drm_bridge *bridge)
+{
+	struct tc358764 *ctx = bridge_to_tc358764(bridge);
+	int ret = drm_panel_disable(bridge_to_tc358764(bridge)->panel);
+
+	if (ret < 0)
+		dev_err(ctx->dev, "error disabling panel (%d)\n", ret);
+}
+
 static void tc358764_post_disable(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 	int ret;
 
+	ret = drm_panel_unprepare(ctx->panel);
+	if (ret < 0)
+		dev_err(ctx->dev, "error unpreparing panel (%d)\n", ret);
 	tc358764_reset(ctx);
 	usleep_range(10000, 15000);
 	ret = regulator_bulk_disable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
@@ -296,28 +335,71 @@ static void tc358764_pre_enable(struct drm_bridge *bridge)
 	ret = tc358764_init(ctx);
 	if (ret < 0)
 		dev_err(ctx->dev, "error initializing bridge (%d)\n", ret);
+	ret = drm_panel_prepare(ctx->panel);
+	if (ret < 0)
+		dev_err(ctx->dev, "error preparing panel (%d)\n", ret);
+}
+
+static void tc358764_enable(struct drm_bridge *bridge)
+{
+	struct tc358764 *ctx = bridge_to_tc358764(bridge);
+	int ret = drm_panel_enable(ctx->panel);
+
+	if (ret < 0)
+		dev_err(ctx->dev, "error enabling panel (%d)\n", ret);
 }
 
 static int tc358764_attach(struct drm_bridge *bridge,
 			   enum drm_bridge_attach_flags flags)
+{
+	struct tc358764 *ctx = bridge_to_tc358764(bridge);
+	struct drm_device *drm = bridge->dev;
+	int ret;
+
+	if (flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR) {
+		DRM_ERROR("Fix bridge driver to make connector optional!");
+		return -EINVAL;
+	}
+
+	ctx->connector.polled = DRM_CONNECTOR_POLL_HPD;
+	ret = drm_connector_init(drm, &ctx->connector,
+				 &tc358764_connector_funcs,
+				 DRM_MODE_CONNECTOR_LVDS);
+	if (ret) {
+		DRM_ERROR("Failed to initialize connector\n");
+		return ret;
+	}
+
+	drm_connector_helper_add(&ctx->connector,
+				 &tc358764_connector_helper_funcs);
+	drm_connector_attach_encoder(&ctx->connector, bridge->encoder);
+	ctx->connector.funcs->reset(&ctx->connector);
+	drm_connector_register(&ctx->connector);
+
+	return 0;
+}
+
+static void tc358764_detach(struct drm_bridge *bridge)
 {
 	struct tc358764 *ctx = bridge_to_tc358764(bridge);
 
-	return drm_bridge_attach(bridge->encoder, ctx->panel_bridge,
-				 bridge, flags);
+	drm_connector_unregister(&ctx->connector);
+	ctx->panel = NULL;
+	drm_connector_put(&ctx->connector);
 }
 
 static const struct drm_bridge_funcs tc358764_bridge_funcs = {
+	.disable = tc358764_disable,
 	.post_disable = tc358764_post_disable,
+	.enable = tc358764_enable,
 	.pre_enable = tc358764_pre_enable,
 	.attach = tc358764_attach,
+	.detach = tc358764_detach,
 };
 
 static int tc358764_parse_dt(struct tc358764 *ctx)
 {
-	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
-	struct drm_panel *panel;
 	int ret;
 
 	ctx->gpio_reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
@@ -326,16 +408,12 @@ static int tc358764_parse_dt(struct tc358764 *ctx)
 		return PTR_ERR(ctx->gpio_reset);
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
-	if (IS_ERR(panel_bridge))
-		return PTR_ERR(panel_bridge);
+	ret = drm_of_find_panel_or_bridge(ctx->dev->of_node, 1, 0, &ctx->panel,
+					  NULL);
+	if (ret && ret != -EPROBE_DEFER)
+		dev_err(dev, "cannot find panel (%d)\n", ret);
 
-	ctx->panel_bridge = panel_bridge;
-	return 0;
+	return ret;
 }
 
 static int tc358764_configure_regulators(struct tc358764 *ctx)
@@ -381,7 +459,6 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 		return ret;
 
 	ctx->bridge.funcs = &tc358764_bridge_funcs;
-	ctx->bridge.type = DRM_MODE_CONNECTOR_LVDS;
 	ctx->bridge.of_node = dev->of_node;
 
 	drm_bridge_add(&ctx->bridge);
-- 
2.17.1

