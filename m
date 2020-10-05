Return-Path: <SRS0=ELwQ=DM=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F6BC46466
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 13:43:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2009F20774
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  5 Oct 2020 13:43:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgJENnO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 5 Oct 2020 09:43:14 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:54074 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725932AbgJENnO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 5 Oct 2020 09:43:14 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4C4hcv37VRz1qwH0;
        Mon,  5 Oct 2020 15:43:11 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4C4hcv1yB8z1sM8b;
        Mon,  5 Oct 2020 15:43:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id PG0PrIoyy2gB; Mon,  5 Oct 2020 15:43:09 +0200 (CEST)
X-Auth-Info: BsZ4AqTfggJeQpoXk5zZ5LXVL4o2PxktgvP200i8NSE=
Received: from desktop.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Mon,  5 Oct 2020 15:43:09 +0200 (CEST)
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
Subject: [PATCH 2/3] drm/exynos: Scale the DSIM PHY HFP/HBP/HSA to lanes and bpp
Date:   Mon,  5 Oct 2020 15:42:49 +0200
Message-Id: <20201005134250.527153-2-marex@denx.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201005134250.527153-1-marex@denx.de>
References: <20201005134250.527153-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The value programmed into horizontal porch and sync registers must be
scaled to the correct number of DSI lanes and bpp, make it so.

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
 drivers/gpu/drm/bridge/samsung-dsim.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index fbd87a74eb9f..42b49546dd00 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -740,20 +740,23 @@ static void samsung_dsim_set_display_mode(struct samsung_dsim *dsi)
 {
 	struct drm_display_mode *m = &dsi->mode;
 	unsigned int num_bits_resol = dsi->driver_data->num_bits_resol;
+	int bpp;
 	u32 reg;
 
 	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
+		bpp = mipi_dsi_pixel_format_to_bpp(dsi->format) / 8;
+
 		reg = DSIM_CMD_ALLOW(0xf)
 			| DSIM_STABLE_VFP(m->vsync_start - m->vdisplay)
 			| DSIM_MAIN_VBP(m->vtotal - m->vsync_end);
 		samsung_dsim_write(dsi, DSIM_MVPORCH_REG, reg);
 
-		reg = DSIM_MAIN_HFP(m->hsync_start - m->hdisplay)
-			| DSIM_MAIN_HBP(m->htotal - m->hsync_end);
+		reg = DSIM_MAIN_HFP((m->hsync_start - m->hdisplay) * bpp / dsi->lanes)
+			| DSIM_MAIN_HBP((m->htotal - m->hsync_end) * bpp / dsi->lanes);
 		samsung_dsim_write(dsi, DSIM_MHPORCH_REG, reg);
 
 		reg = DSIM_MAIN_VSA(m->vsync_end - m->vsync_start)
-			| DSIM_MAIN_HSA(m->hsync_end - m->hsync_start);
+			| DSIM_MAIN_HSA((m->hsync_end - m->hsync_start) * bpp / dsi->lanes);
 		samsung_dsim_write(dsi, DSIM_MSYNC_REG, reg);
 	}
 	reg =  DSIM_MAIN_HRESOL(m->hdisplay, num_bits_resol) |
-- 
2.28.0

