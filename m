Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE0DC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 11:41:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348918AbiEDLor (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 07:44:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348917AbiEDLor (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 07:44:47 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEA313D45
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 04:41:11 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id j14so1180417plx.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 04:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SQ9haNco3NM8TvQE4oQrzscoTZTKBiwJWPBhK4nZTlM=;
        b=WZccA/sQszjIVx/2AhDkBWPBSzrzjiK8PfBg7P6oVXxPeAM/aMb7LT/YW1l8H9bWIg
         9h9J2tsIMmKRggenNI9KNyquubuh5wn3FkcG9aLzby30CkQEGJDL942e6kkad2++ZD6E
         5XtXbPGLSZy8qFOlOCDJouh0HnGj+UHk4gErA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SQ9haNco3NM8TvQE4oQrzscoTZTKBiwJWPBhK4nZTlM=;
        b=S16uO35C4aoM3vydN1rSB6l8j1cqq27x7aVXFS4h9cCOlLUfxOeUvX2UIsFn7OlVHz
         xIB8RbHQ8nJUJTIUtV85XY8f3247fYQm/LRTmRWdfQbn75YAlfeXZM8hwaK0m1Jdp+AH
         w6h//WcS4/DpNjRTQ5Q3VU1reuYXxSoGLjNjLZQPrTLIwKn4dfpOzD1OeWEU9fLWz8o2
         j+GaT2HWFHtUY+mmQNSeiA5043qLghJOvxzvMhd7nB7Z/nNNMoCb+bwycZuZitZy4iKa
         Gf9nCm7Z6T5w9phc3ik9K8TvpHQXD2Yb06zDWSMasvwpUnuo8VKcRotEq9lg1sU/1xit
         k0nA==
X-Gm-Message-State: AOAM530Gagn25xIatHYyIMVYD4GmWmpeRQH9R5ThacCoYOjz/pvAyZeR
        N82+qhlKqicAyONrm/X25blA/A==
X-Google-Smtp-Source: ABdhPJyV3t5mNkVoUubxK57UYYy+vL91bPwWh88omt8NmMduKR4j6eALzLELq+usTI7yeU+uQ9BWxA==
X-Received: by 2002:a17:90b:4a08:b0:1dc:6cc1:3d24 with SMTP id kk8-20020a17090b4a0800b001dc6cc13d24mr9883845pjb.131.1651664470714;
        Wed, 04 May 2022 04:41:10 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
        by smtp.gmail.com with ESMTPSA id k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 04:41:10 -0700 (PDT)
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
Subject: [PATCH v2 04/12] drm: bridge: samsung-dsim: Mark PHY as optional
Date:   Wed,  4 May 2022 17:10:13 +0530
Message-Id: <20220504114021.33265-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

In i.MX8M Mini/Nano SoC the DSI Phy requires a MIPI DPHY bit
to reset in order to activate the PHY and that can be done via
upstream i.MX8M blk-ctrl driver.

So, mark the phy get as optional.

v2:
* none

v1:
* new patch

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 99f80e9c1600..60dc863113a0 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1584,7 +1584,7 @@ static int samsung_dsim_probe(struct platform_device *pdev)
 	if (IS_ERR(dsi->reg_base))
 		return PTR_ERR(dsi->reg_base);
 
-	dsi->phy = devm_phy_get(dev, "dsim");
+	dsi->phy = devm_phy_optional_get(dev, "dsim");
 	if (IS_ERR(dsi->phy)) {
 		dev_info(dev, "failed to get dsim phy\n");
 		return PTR_ERR(dsi->phy);
-- 
2.25.1

