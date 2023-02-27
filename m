Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 129CEC7EE2D
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 27 Feb 2023 11:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229589AbjB0LlY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 27 Feb 2023 06:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjB0LlX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 27 Feb 2023 06:41:23 -0500
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B99416337
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:41:22 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id cp7-20020a17090afb8700b0023756229427so9834845pjb.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 27 Feb 2023 03:41:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OactgBmjQNk0sq2vCizwf35037R0yRtN2J7cWRvN4+A=;
        b=i2xP69iEZ2gnIpYs7eOKjQjETZHHAF+NZPGWIxrR+TJFnjwlrMaGEqvWfbnEW5cNqD
         /iIG7snXET/5Me6y0gRybGxP1fcPXhNeUQNhC0Qn1j5HSts5z9IA/FR+HxBtxl3CxZro
         MjfNVIMR1XWXFyXkpEAH3Qe0CbH4PSsiuy/TM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OactgBmjQNk0sq2vCizwf35037R0yRtN2J7cWRvN4+A=;
        b=kGOKXb5RGeyQZpwmgQm5pr//l9LReaubvZSoIjlnWA3h/Jn1MX+qcIrwRIJsAIwiGO
         sUrZyskoY142BT6A5/669ylwyrU0ru23fVuZFexFDd7DBOTY7aDxJS7ibzGtp8OJExlu
         GLJNLQjoxYstuqF5uHGAEVB+6tNcaHLeVDEL4RK9GdGw93fVCd7zXGeyXdQ0mDkFLUeo
         cZDoFDVd/H+81msm97Ku0wlIVAqs8PYWPQl4k1tVAhj2F07X3iqazDm92C5fkOdggP1j
         7Z8fQ13Z+lTC/9xJNdl0vXIfSTvCNPzYfdutdisu+nXvr0wd+GbGknRGeQl9wn7fv40Q
         sqMQ==
X-Gm-Message-State: AO0yUKVEBA1MO4xCWT74fyAjrreFTSsGkVHuDzU/SS2OMJJXV7Shm+Sk
        XgyYTBEgKefAIj+kQzXUL5PUAA==
X-Google-Smtp-Source: AK7set/phBDiIp/M6U97W6LqTX87yXrxDO1RBEMT/MRgRzDDyp4yYLyLcDoKp+uwQ7elbiGnR+4zNg==
X-Received: by 2002:a17:902:f68f:b0:19c:1433:5fba with SMTP id l15-20020a170902f68f00b0019c14335fbamr29364325plg.0.1677498082146;
        Mon, 27 Feb 2023 03:41:22 -0800 (PST)
Received: from localhost.localdomain ([94.140.8.120])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902ba8a00b0019c919bccf8sm4395277pls.86.2023.02.27.03.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 03:41:21 -0800 (PST)
From:   Jagan Teki <jagan@amarulasolutions.com>
To:     Andrzej Hajda <andrzej.hajda@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Frieder Schrempf <frieder.schrempf@kontron.de>,
        Tim Harvey <tharvey@gateworks.com>,
        Adam Ford <aford173@gmail.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v13 15/18] dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
Date:   Mon, 27 Feb 2023 17:09:22 +0530
Message-Id: <20230227113925.875425-16-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230227113925.875425-1-jagan@amarulasolutions.com>
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8M Mini/Nano SoC.

Add dt-bingings for it.

Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v13:
- none
Changes for v12:
- collect RB from Marek
Changes for v11, v10, v9:
- none
Changes for v8:
- add comment to include i.MX8M Nano.
Changes for v7, v6, v5, v4:
- none
Changes for v3:
- collect Rob Acked-by
Changes for v2:
- updated comments
Changes for v1:
- new patch

 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index be377786e8cd..5133d4d39190 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -7,6 +7,7 @@ Required properties:
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
+		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini/Nano SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

