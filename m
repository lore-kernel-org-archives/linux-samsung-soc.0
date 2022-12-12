Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 567E3C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 14:55:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232271AbiLLOzc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 09:55:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbiLLOzb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 09:55:31 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3257B1D
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:55:30 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d7so12318580pll.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 06:55:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4ea8rvmGnrS/8sRSsoYglrzM9FWA5fUizBf/l/CVMc=;
        b=nt1qHxoUkFtSYDEH24MU3Zr1sZ5imgK/FR3091m9lCKlCS0zN1OR0Hr9JPZ3dJJ9eP
         +UO+hGhO3DZRXmDDg8PBN7K8JXncFazWDw2OnuuR3MyCA1GHgf0jF2Yv71bVONV3pVte
         qAiY+6HitJTUUlXQcYl4v46tWCuWvi9A8EEp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4ea8rvmGnrS/8sRSsoYglrzM9FWA5fUizBf/l/CVMc=;
        b=SNgh91eKae5oKt3OMfwzhze0RA49A0+N+3+4ix+kZDUo2KC4nIzYHPAsgKXCxw7MS5
         jmepPU2vzxsJK4oG2L4Iv3gc9Rlo35X0dEnOkzhCTm2jiy4wQIIFAhb5pfwV3pRBj+c+
         7izIbYy1FbzVwk/cASb83JZMedqlNrF+fQZuN0TD+hWzg8djYOaIlWio6F3uaYga06Rl
         cA/OBjH8e0o7gFwYiWcTr7wbygN4FWn4vtzz8m9lpxslbo59Q5oCWWjiFfVW11Hpc+JF
         amQD5Bu6NNRfRzY1dUJ3mOa46UVXBosoyXizWKmIEle/K2SFX9QQXffqe07KMUeHeJ3A
         CzNQ==
X-Gm-Message-State: ANoB5pkQ5f7ytfXzagTurDGZohe2kgVzbgBh+yRHZ8x+F5yS0KvLQ1IW
        a41ha4Vw6YqCvtsriWp7RGmzHg==
X-Google-Smtp-Source: AA0mqf6WJEW3banWVF1AHkY7665xfeS0AMVZwAlise4jZmkDo1Cpd3nFYLOJGi6TID6YpovqBoQXgA==
X-Received: by 2002:a17:902:6b05:b0:186:b063:32e with SMTP id o5-20020a1709026b0500b00186b063032emr17616981plk.62.1670856930519;
        Mon, 12 Dec 2022 06:55:30 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
        by smtp.gmail.com with ESMTPSA id e11-20020a170902784b00b001782aab6318sm6463272pln.68.2022.12.12.06.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 06:55:29 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v10 2/3] drm/bridge: tc358764: Enable pre_enable_prev_first flag
Date:   Mon, 12 Dec 2022 20:25:07 +0530
Message-Id: <20221212145508.15096-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212145508.15096-1-jagan@amarulasolutions.com>
References: <20221212145508.15096-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

Enable the drm bridge pre_enable_prev_first flag so that the
previous bridge pre_enable should be called first before the
pre_enable for the tc358764 bridge is called.

This makes sure that the previous bridge should be initialized
properly before the tc358764 bridge is powered up.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- none

 drivers/gpu/drm/bridge/tc358764.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/tc358764.c b/drivers/gpu/drm/bridge/tc358764.c
index 53259c12d777..f85654f1b104 100644
--- a/drivers/gpu/drm/bridge/tc358764.c
+++ b/drivers/gpu/drm/bridge/tc358764.c
@@ -369,6 +369,7 @@ static int tc358764_probe(struct mipi_dsi_device *dsi)
 
 	ctx->bridge.funcs = &tc358764_bridge_funcs;
 	ctx->bridge.of_node = dev->of_node;
+	ctx->bridge.pre_enable_prev_first = true;
 
 	drm_bridge_add(&ctx->bridge);
 
-- 
2.25.1

