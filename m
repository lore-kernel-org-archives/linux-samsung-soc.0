Return-Path: <SRS0=g11O=4W=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F0DC3F2D8
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 16:00:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A91FA21775
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Mar 2020 16:00:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgCEQAS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Mar 2020 11:00:18 -0500
Received: from mx2.suse.de ([195.135.220.15]:57634 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726676AbgCEQAS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Mar 2020 11:00:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 9BD45B0C6;
        Thu,  5 Mar 2020 16:00:16 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, sam@ravnborg.org,
        abrodkin@synopsys.com, bbrezillon@kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        ludovic.desroches@microchip.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, jingoohan1@gmail.com, inki.dae@samsung.com,
        jy0922.shim@samsung.com, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
        stefan@agner.ch, alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
        xinliang.liu@linaro.org, zourongrong@gmail.com,
        john.stultz@linaro.org, kong.kongxinwei@hisilicon.com,
        puck.chen@hisilicon.com, linux@armlinux.org.uk,
        p.zabel@pengutronix.de, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com, paul@crapouillou.net, ck.hu@mediatek.com,
        matthias.bgg@gmail.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham+renesas@ideasonboard.com, hjc@rock-chips.com,
        heiko@sntech.de, wens@csie.org, jernej.skrabec@siol.net,
        thierry.reding@gmail.com, jonathanh@nvidia.com, jsarha@ti.com,
        tomi.valkeinen@ti.com, eric@anholt.net, kraxel@redhat.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        sebastian.reichel@collabora.com
Cc:     dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 16/22] drm/tidss: Use simple encoder
Date:   Thu,  5 Mar 2020 16:59:44 +0100
Message-Id: <20200305155950.2705-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200305155950.2705-1-tzimmermann@suse.de>
References: <20200305155950.2705-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The tidss driver uses an empty implementation for its encoder. Replace
the code with the generic simple encoder.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tidss/tidss_encoder.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
index 83785b0a66a9..4c0558286f5e 100644
--- a/drivers/gpu/drm/tidss/tidss_encoder.c
+++ b/drivers/gpu/drm/tidss/tidss_encoder.c
@@ -8,8 +8,9 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_panel.h>
 #include <drm/drm_of.h>
+#include <drm/drm_panel.h>
+#include <drm/drm_simple_kms_helper.h>
 
 #include "tidss_crtc.h"
 #include "tidss_drv.h"
@@ -59,10 +60,6 @@ static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
 	.atomic_check = tidss_encoder_atomic_check,
 };
 
-static const struct drm_encoder_funcs encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
 struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
 					 u32 encoder_type, u32 possible_crtcs)
 {
@@ -75,8 +72,7 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
 
 	enc->possible_crtcs = possible_crtcs;
 
-	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
-			       encoder_type, NULL);
+	ret = drm_simple_encoder_init(&tidss->ddev, enc, encoder_type);
 	if (ret < 0)
 		return ERR_PTR(ret);
 
-- 
2.25.1

