Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5A5EC678D4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 14:52:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjCCOwd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 09:52:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230042AbjCCOwV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 09:52:21 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7413962331
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 06:52:20 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id p6so2970290plf.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 06:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXMF7IvJ5lsdZk4pO/zptMJoKK8XksLiBme5rkpOyuQ=;
        b=hGkxGdF7kmPPJuJpjPc6kHlHiYApnlT+vJHdTwT37NhdzcXWQAn9fHSEQ0TQ/kbmS5
         QypfI0Mf2i8O+/SW49124lKK23mSAwlV45XMizDf+a66Xvia4s+AcmL96M5OdvkpZSO5
         UyTJ5JoL5M6QwtmTVE+Fy1G4Xhf9HCqph+/h0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXMF7IvJ5lsdZk4pO/zptMJoKK8XksLiBme5rkpOyuQ=;
        b=mMJ2jzLsaJBO0WldAaBta/mHEMVOPCqgC4cd3YulPr81dl6D2gcO75bOfg3AWmuhiV
         l92uFdxoBJk47OE0muBrUNSlHPXi3xVjMo0sVuNLbxFBhISfDWYfqthDlhM6JPCE/a4w
         RDP2ZxAjbs97wwmGqLD11QupnkQ5FyOlTn59l0ltlYOSmjKOZUVzzpmRScT7ztOVzEwz
         EuK/IPwKMJiX3jZ7RrRSEVAufrt+iaYOqPxRTbdWoAY6MH9mQJOSrZHXQBmksiYL+7fP
         sZ0WyEX9dYdHfLZ0U3N9LLWGBB4WwdHciIjLLyc1GETNqaU2AEk0nGm0NuHwwqrwH5uB
         lEoQ==
X-Gm-Message-State: AO0yUKV2JRZKUwWQR5pLIHb4x7u9sBgGF+2cvBnWbM6ySBp2pP7s/quN
        4FcqYSWE4xvzV8Usr6uVpUFofQ==
X-Google-Smtp-Source: AK7set81p7rwz/HUcdzWmogVP+ug4N0ohDc+9qRzXBre8c4tHgQ1gH/Ofu3GqXOriiZsk89cvsimjg==
X-Received: by 2002:a05:6a20:8f0f:b0:cb:7f0d:e25f with SMTP id b15-20020a056a208f0f00b000cb7f0de25fmr2918924pzk.41.1677855139916;
        Fri, 03 Mar 2023 06:52:19 -0800 (PST)
Received: from localhost.localdomain ([183.83.137.89])
        by smtp.gmail.com with ESMTPSA id z4-20020a63e544000000b00502fd70b0bdsm1660856pgj.52.2023.03.03.06.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 06:52:19 -0800 (PST)
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
Subject: [PATCH v15 01/16] drm: exynos: dsi: Drop explicit call to bridge detach
Date:   Fri,  3 Mar 2023 20:21:23 +0530
Message-Id: <20230303145138.29233-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230303145138.29233-1-jagan@amarulasolutions.com>
References: <20230303145138.29233-1-jagan@amarulasolutions.com>
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

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
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

