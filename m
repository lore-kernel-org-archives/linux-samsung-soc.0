Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E705C10F1D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 12 Dec 2022 18:32:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232982AbiLLScG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 12 Dec 2022 13:32:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233197AbiLLSb0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Dec 2022 13:31:26 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A6DA15A2A
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 10:29:42 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id t11-20020a17090a024b00b0021932afece4so762072pje.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 12 Dec 2022 10:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jCpxaDaTA56dGN7NJsLyTmoxT4H5IRGMLzpnnHDD7q8=;
        b=JAKFVzLSt6JrfK8yqkhUbmYOpa1Y9+ZNYOuxyxXCaFrCIAUel9DmnllQ/4Hk5LAZ+u
         IlDRmlR+oSXuMh8zDRIVgTsNf/PhmxB9noJpyenzwoRA1AMhfwJzL5lqLriHzWYY4WM+
         CVvuyH0YIvntyN2LP+xQo/c44isBdvOb5mHBw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jCpxaDaTA56dGN7NJsLyTmoxT4H5IRGMLzpnnHDD7q8=;
        b=CYUJNanUIErLh0ehaG9yJfveWZYu+zxEDLszKsHoDeEQbk0EXFLmfxsBbHLpFSAMRk
         /6KjBhtO7+ocCwtQQXbgrNU89NRSkFRXBFQMgigakDoog5ePVtUGsgVavVQZ0wuNq4UW
         Vn0EJKAsEPk6fKxg1/a1aoQa7Jt76Jz0tYwvG5nXqA5Gq9CNjZfQZtKDkiKduYN9kuuI
         osxcLsUG50C2yG202EPXHi6MQrhxujrb2s+cnHGZiqpzRj2FGD2zzPTCBgLmcy5AWchS
         f9OFnGtzjDkW4kI+rnVJi2CAaKPiG9hIqQ3svtAgOB758OmiFQLn8ZXTOZoqhWOsiKUj
         Ce2w==
X-Gm-Message-State: ANoB5pkhqvbN678dWHCMt7hh5tyRYE6AY5s+71wsw0X/AK49+C1D+Gmh
        MN6JYHtKp+MuXMSFsYM5Pxn/8A==
X-Google-Smtp-Source: AA0mqf4vOfrYyokqDVGgCKowSzgdtJOiyIYxXHZ18VsSCqYqdWLFwhStg78i7SpL2dTrPHIglv3wVw==
X-Received: by 2002:a17:903:1d1:b0:189:c47b:af27 with SMTP id e17-20020a17090301d100b00189c47baf27mr23141709plh.10.1670869781961;
        Mon, 12 Dec 2022 10:29:41 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:c713:dc69:f2de:e52f])
        by smtp.gmail.com with ESMTPSA id n28-20020a634d5c000000b0046fefb18a09sm5357998pgl.91.2022.12.12.10.29.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:29:41 -0800 (PST)
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
Subject: [PATCH v11 2/3] drm/bridge: tc358764: Enable pre_enable_prev_first flag
Date:   Mon, 12 Dec 2022 23:59:22 +0530
Message-Id: <20221212182923.29155-3-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221212182923.29155-1-jagan@amarulasolutions.com>
References: <20221212182923.29155-1-jagan@amarulasolutions.com>
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
Changes for v11, v10:
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

