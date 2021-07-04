Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE80C07E95
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B94EC61879
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbhGDJIS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGDJIR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jul 2021 05:08:17 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97BCEC061764
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Jul 2021 02:05:42 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id h6so7298888plf.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2021 02:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5qWzL2bKwutF1snBeXJY/GnIGl0Ar3EOZLIKhQCIAh4=;
        b=Oo3Nk58YdvdURePtE0A7QW6obKZfXKex7+wBc9i8v5TQENN/LUYRIJUSlbNHgEnkON
         abd5uo+wxuBwtinmgxUVoLRV0Ho70wBjkOtlvN+rYI/1SGCkcEZcqR3J3Rr1QWXSdjJI
         n/0NwutFDWwsnfswCl28VErN0Y6ONWtmdprzc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5qWzL2bKwutF1snBeXJY/GnIGl0Ar3EOZLIKhQCIAh4=;
        b=c9R2vbryTSML8BscXpMRhWt4B2yujJm+BNw1WkdgP9DfQjqXz58KzkfP7A6G0K8Hbi
         ovqMrS2zW5GkaHu3hr/FTX2mylqweF3Ss1hf53biOrQtCBFwCq06uaHfPq/kQpNsfvfW
         oKvw450zD7b7whPsDKkLSIoWdF0W+UCBwYrEQFw9TlRGuflcz+hbgFpMGsHciLzhbrz4
         q8OxEY/9tLyf3zUL0l1nEGiINKC76QIO2MkXQZwPt/Ac1/6CHluIcdiHOHCKgKxn3afn
         lUF+KauFDrR+eyond0wOx+ggf1NTxNyFdSSMkz+s5uY1ILQ1mixNIVE2Z7c8ZrzLYMOP
         Dmlg==
X-Gm-Message-State: AOAM533xJ8jxGlWrTUuSWRG9eTAkZiNa8oR6g9Rrfoedz9z3G92QSZGF
        nfbofG62moDJlH4EWos1G+BKew==
X-Google-Smtp-Source: ABdhPJwrr2bLufFMR1N9V6dDMRURHUV45B3uXg9T7mcdXyFKlOG+lid6Z/lIEpZKE9V5Cq0fISQDEw==
X-Received: by 2002:a17:902:b210:b029:11a:bf7b:1a83 with SMTP id t16-20020a170902b210b029011abf7b1a83mr7353036plr.84.1625389542152;
        Sun, 04 Jul 2021 02:05:42 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
        by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:05:41 -0700 (PDT)
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
Subject: [RFC PATCH 15/17] drm: bridge: samsung-dsim: Move DSI init in bridge enable
Date:   Sun,  4 Jul 2021 14:32:28 +0530
Message-Id: <20210704090230.26489-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Host transfer in DSI master will invoke only when the DSI
commands sent from DSI devices like DSI Panel or DSI bridges
and this host transfer wouldn't invoke I2C based DSI
bridge drivers.

Handling DSI host initialization in transfer calls might miss
the controller setup for I2C based DSI bridges.

So, move the DSI initialization from transfer to bridge enable
as the bridge enable API as it is common across all classes
of DSI device drivers.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index bc845ae100d4..54767cbf231c 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1437,6 +1437,13 @@ static void samsung_dsim_bridge_enable(struct drm_bridge *bridge)
 
 	dsi->state |= DSIM_STATE_ENABLED;
 
+	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
+		ret = samsung_dsim_init(dsi);
+		if (ret)
+			return;
+		dsi->state |= DSIM_STATE_INITIALIZED;
+	}
+
 	samsung_dsim_set_display_mode(dsi);
 	samsung_dsim_set_display_enable(dsi, true);
 
@@ -1602,13 +1609,6 @@ static ssize_t samsung_dsim_host_transfer(struct mipi_dsi_host *host,
 	if (!(dsi->state & DSIM_STATE_ENABLED))
 		return -EINVAL;
 
-	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
-		ret = samsung_dsim_init(dsi);
-		if (ret)
-			return ret;
-		dsi->state |= DSIM_STATE_INITIALIZED;
-	}
-
 	ret = mipi_dsi_create_packet(&xfer.packet, msg);
 	if (ret < 0)
 		return ret;
-- 
2.25.1

