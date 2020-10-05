Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78DA9C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 13:43:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4720320774
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 13:43:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgJENnM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:43:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgJENnM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 09:43:12 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CDCEC0613CE
        for <linux-samsung-soc@vger.kernel.org>; Mon,  5 Oct 2020 06:43:12 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4C4hcr6mlbz1s5CX;
        Mon,  5 Oct 2020 15:43:08 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4C4hcr5fV9z1qqkg;
        Mon,  5 Oct 2020 15:43:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id mMRxvtm3VSYf; Mon,  5 Oct 2020 15:43:05 +0200 (CEST)
X-Auth-Info: gvl2Zt7G+C6HudS7ak0NaK2YB+Ed7vBwmgM/rMOlJKw=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon,  5 Oct 2020 15:43:05 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     dri-devel@lists.freedesktop.org
Cc:     Marek Vasut <marex@denx.de>, Fabio Estevam <festevam@gmail.com>,
        =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/3] drm/exynos: Init the DSIM PHY in samsung_dsim_enable()
Date:   Mon,  5 Oct 2020 15:42:48 +0200
Message-Id: <20201005134250.527153-1-marex@denx.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In case the PHY is not initialized, do it in samsung_dsim_enable(),
otherwise the link configuration registers are not programmed at all.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Guido Günther <agx@sigxcpu.org>
Cc: Jaehoon Chung <jh80.chung@samsung.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Michael Tretter <m.tretter@pengutronix.de>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
--
NOTE: This depends on https://patchwork.kernel.org/project/dri-devel/list/?series=347439
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 6d2d8dc027de..fbd87a74eb9f 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1244,6 +1244,13 @@ static void samsung_dsim_enable(struct samsung_dsim *dsi)
 	pm_runtime_get_sync(dsi->dev);
 	dsi->state |= DSIM_STATE_ENABLED;
 
+	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
+		ret = samsung_dsim_init(dsi);
+		if (ret)
+			return;
+		dsi->state |= DSIM_STATE_INITIALIZED;
+	}
+
 	if (dsi->panel) {
 		ret = drm_panel_prepare(dsi->panel);
 		if (ret < 0)
-- 
2.28.0

