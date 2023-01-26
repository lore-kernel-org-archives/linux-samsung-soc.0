Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67200C61D97
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 Jan 2023 14:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjAZOpY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 Jan 2023 09:45:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjAZOpX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 Jan 2023 09:45:23 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36CB3AB6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:45:21 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id j5so1705404pjn.5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 Jan 2023 06:45:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=szahjNSumSDXHid0fYalhBWCMxVcircmAlXVe0dAaOg=;
        b=GMHSCK0VlGTKgtoBtSvuboOBZKfQwGe4VvGA8evVShcGrPNRrBynjw4wC7iXSFwNVz
         zBS5X10R6Pk8GfyYwEQxWRxFeD9+4y/H+TYuvignx2TzI9MqWOQ+lu1xpSTbfYEdkD7T
         Q3qOeWLfiJ9MnsF6WzBC2b7HyINNXUhBqhvYY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=szahjNSumSDXHid0fYalhBWCMxVcircmAlXVe0dAaOg=;
        b=C0G414i0iw/gNkRvIDCK2Fi2YeNus2w6yqdibjuuD91eTxs/sepOffwvMozbXSHnp2
         ZmhLutDXDkS2ohNoev1IiTae2RlTiyZo5E7blnyEaer2UYbndoxxB8FCbyU3zqpykwa8
         2lb9dT4qkyDE4iD3fna3483DcXFQOCgZjE9Ef4q49eFI0exjEY7FG7+3fGWLgJvvsgFi
         0Ri+M2z0uLwCKiSzAL/n1z7R/4YLONE41tuJgClzbxGvWhUnsYW/TeolSuZR3LLe1UIq
         1eg2duuzFjTtn5h7YgErFh0wzPK95q3mJI16vEOYkMqtzO/+WhhtjZaKDogMhYfcZyQ0
         4C1g==
X-Gm-Message-State: AO0yUKVmktUtgo5JNf+7H3wJtw6kwu9PsSKhYiWG1m852fXm080aOTFA
        23ahdpheJgAMuxIEFOqMA9+BHg==
X-Google-Smtp-Source: AK7set8viY2FGvSkAuaTk1msXSlH4Fh1y7TTnoO52wKvjLois8RZieo3sfS0/ThWzwObgzjlVHRa+w==
X-Received: by 2002:a05:6a20:3950:b0:b8:6a9c:fe21 with SMTP id r16-20020a056a20395000b000b86a9cfe21mr2839859pzg.51.1674744321250;
        Thu, 26 Jan 2023 06:45:21 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a238:3cb1:2156:ef87:8af5])
        by smtp.gmail.com with ESMTPSA id d197-20020a6336ce000000b0042988a04bfdsm823660pga.9.2023.01.26.06.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jan 2023 06:45:20 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v12 03/18] drm: exynos: dsi: Drop explicit call to bridge detach
Date:   Thu, 26 Jan 2023 20:14:12 +0530
Message-Id: <20230126144427.607098-4-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230126144427.607098-1-jagan@amarulasolutions.com>
References: <20230126144427.607098-1-jagan@amarulasolutions.com>
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
Changes for v12, v11:
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

