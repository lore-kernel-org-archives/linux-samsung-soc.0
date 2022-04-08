Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BEEC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Apr 2022 16:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbiDHQYr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Apr 2022 12:24:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbiDHQYp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Apr 2022 12:24:45 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A97EEEA5D
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Apr 2022 09:22:41 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 32so6068467pgl.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Apr 2022 09:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cgQ5H26dXpBSM4rzqEEf72CNZpQ5iTR6sOekInJL9nA=;
        b=qGFgE8d/FspNS34svbsGDyPnuRy9Upu/mTr9Ef8Tu5CYyNTpw+nZ6ggmcKV9shfu8n
         s3q0yl1yl7qKniYUx5mx1k1WfO9anF/XSdxeQFVA9YAUf4vn5cpxhjeEufXsuvyRD+MA
         JZWNKWs0OXIjG/HYBwYGi875S7zRkHwDKx8Qs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cgQ5H26dXpBSM4rzqEEf72CNZpQ5iTR6sOekInJL9nA=;
        b=F+ZGuyHYKPoAHajufdJsHAPqcUhGJSAhJ3LLUcdl/H1hAbaJvLJDBjXTDBFtAR06Gh
         50X0igvXUvLabgFUVRLCK+QDKyls8c7wJUBSIqGHoh+1GcpnLfY9Cb7EgyCq4LDOXiQ2
         V5ZVN6vgp3pLMwFO5FsYp/cy1tnyZDdWARaOK3+mruH4FU+0IWfjc5CVGomzhFbjQHAC
         vyF1kVnjtmBwNJHpWXLk7LkXu2osc8E5KerI3G0qkQ3BJNT+mpl566s63vcnWV2pntVa
         3Pq7vqaxd5JSnOFdk05QumB3VW9S3hVkyf070BN8MvcdteR1+6caRgRrJJeDKzB6Ntgm
         b3Kw==
X-Gm-Message-State: AOAM533aqqjcNIUnESvBT2u5inq4D/Kdb3tEh0raUgQR2WtFg/bCBeHf
        CHbQHQ7QL0EX2K3X3XevV+6a2g==
X-Google-Smtp-Source: ABdhPJz7BYgkTc1Jr7yE94AtJvsLtYwfoFOJxo6erKU4BeLpwnKWJwOinWC2GIqbOH2+0zjtoftLRw==
X-Received: by 2002:a63:c00e:0:b0:398:a2b7:be6 with SMTP id h14-20020a63c00e000000b00398a2b70be6mr1775772pgg.214.1649434961113;
        Fri, 08 Apr 2022 09:22:41 -0700 (PDT)
Received: from j-ThinkPad-E14-Gen-2.domain.name ([45.249.78.214])
        by smtp.gmail.com with ESMTPSA id n18-20020a056a0007d200b004fdac35672fsm24929863pfu.68.2022.04.08.09.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 09:22:40 -0700 (PDT)
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
        Rob Herring <robh+dt@kernel.org>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH 04/11] drm: bridge: samsung-dsim: Add DSI init in bridge pre_enable()
Date:   Fri,  8 Apr 2022 21:51:01 +0530
Message-Id: <20220408162108.184583-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220408162108.184583-1-jagan@amarulasolutions.com>
References: <20220408162108.184583-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Host transfer() in DSI master will invoke only when the DSI commands
are sent from DSI devices like DSI Panel or DSI bridges and this
host transfer wouldn't invoke for I2C-based-DSI bridge drivers.

Handling DSI host initialization in transfer calls misses the
controller setup for I2C configured DSI bridges.

This patch adds the DSI initialization from transfer to bridge
pre_enable as the bridge pre_enable API is invoked by core as
it is common across all classes of DSI device drivers.

v1:
* keep DSI init in host transfer

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index ff05c8e01cff..3e12b469dfa8 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1290,6 +1290,13 @@ static void samsung_dsim_atomic_pre_enable(struct drm_bridge *bridge,
 	}
 
 	dsi->state |= DSIM_STATE_ENABLED;
+
+	if (!(dsi->state & DSIM_STATE_INITIALIZED)) {
+		ret = samsung_dsim_init(dsi);
+		if (ret)
+			return;
+		dsi->state |= DSIM_STATE_INITIALIZED;
+	}
 }
 
 static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
-- 
2.25.1

