Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53D95C678D5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 16:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbjCHQk3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 11:40:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbjCHQk2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 11:40:28 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A620A46AE
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 08:40:26 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so2292922pjp.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 08:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1678293626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=90yBjB56MdOW/HpXbxKsjmjXCQmWwrP8jEp2gzu937o=;
        b=K//Wls+M6Qn6VF7WUpOzBSS7QYYUlUA6Cc1fYXAmD9MGM5HhjVsEDN/ujsRZZOPDKT
         pzuQZ/qY0r2g+Fm7RH7bRGGsRcq0TtPKkt09whHfftA6aD+qaI7UkCFqMvQQGMONPwKK
         UkvWuslm3Lh0wnxrBiHyM8zKXvLpAsbVnuFto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678293626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=90yBjB56MdOW/HpXbxKsjmjXCQmWwrP8jEp2gzu937o=;
        b=hEC/TeacgaQUcv7Z6/r9zMqOKMQz8A9N6/4YfGyq72E7Bf6xqwkg5YkjSbsNaCEBZo
         8bleAWj/06ksBvGGU4CexICKcaC+kTTk0XqZtttZfhfcJwfkOyuCGW0wiAnAjo2P7U9k
         vrEjjy8SCvdOhXA66Iy+PxoMNw/FyxPo+uYOCIgw3Zwh6H65fnnJn96U7Uvdh4ztJsKf
         uyN0CpXjlL7nrLrYdGwLYLx/DZtfbFRegmV6LC8T2orjFTXJguLQUAqKOhdEKe1OxYDN
         ZSIaETIjFvTUK+XFX8l4e04+HkAxa8loNCVUg2zdsX1zcMdZ9fjiUJJanTkIutPUxUNn
         3Peg==
X-Gm-Message-State: AO0yUKW327x0scUVHUiPB3/GRgl5Q3r1G1v+YQR2hfTI8T+OpkmzjIyi
        4j7Ll02V9FCqIa8rXMqI4o7OoA==
X-Google-Smtp-Source: AK7set93WOOrmFJ37Gpvxhb7LeMp3N37mFTKmXqT+Uo3pTzX8aac8SsOg1MXIxjX2ylaSI3NKSWSqA==
X-Received: by 2002:a17:902:e741:b0:19e:7bd2:a224 with SMTP id p1-20020a170902e74100b0019e7bd2a224mr23700768plf.62.1678293626167;
        Wed, 08 Mar 2023 08:40:26 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
        by smtp.gmail.com with ESMTPSA id kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 08:40:25 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Marek Vasut <marex@denx.de>, Maxime Ripard <mripard@kernel.org>
Cc:     Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v16 01/16] drm: exynos: dsi: Drop explicit call to bridge detach
Date:   Wed,  8 Mar 2023 22:09:38 +0530
Message-Id: <20230308163953.28506-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230308163953.28506-1-jagan@amarulasolutions.com>
References: <20230308163953.28506-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos DSI already converted into a bridge driver, so bridge
detach will suppose happened during bridge chain removal done
by the bridge core.

Drop the explicit call chain to detach the bridge.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v16:
- collect TB from Marek S
- collect RB from Marek V
Changes for v15, v13, v12, v11:
- none
Changes for v10:
- new patch

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 06d6513ddaae..df15501b1075 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1531,8 +1531,6 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	struct exynos_dsi *dsi = host_to_dsi(host);
 	struct drm_device *drm = dsi->encoder.dev;
 
-	if (dsi->out_bridge->funcs->detach)
-		dsi->out_bridge->funcs->detach(dsi->out_bridge);
 	dsi->out_bridge = NULL;
 
 	if (drm->mode_config.poll_enabled)
-- 
2.25.1

