Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 974F0C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Jul 2022 15:53:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiGTPx6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jul 2022 11:53:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229456AbiGTPx5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jul 2022 11:53:57 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3504BD18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:56 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id b10so7194173pjq.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2022 08:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=29Y+8hwR4konYhfmXPU+qexag3jBd2Tn97JAZO5M2Ak=;
        b=dQ92/5IXXxk4bGaiAO61oilRuglzhWOFhjtlMIH7VQ91G3dJwQwxk4DOfOJ/764Zq2
         zvnS158Pk13Fap0vnq+MeKnVCsfS+LxU5RoODRAwGqS9Q7rotRf5kv3IdK2JOTMWQkpq
         4UQK/hyCTkkKS5nJvehnZSPy/5ItpIGqar+6w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=29Y+8hwR4konYhfmXPU+qexag3jBd2Tn97JAZO5M2Ak=;
        b=zUsz2AZpsOHCNKhEsfRz4dUktM87vkQNtLU0aMdDejR7NDYIyttHpDDGyVghgRll/8
         bHesLk8iTqpx5KE10iJXlfAHO+H6VC4W8DDWGg9JmGG1NCtOGqfDIUmRz7rAJMRKuu1X
         fZR4zRQC9yAMO1zj/SA4RWQjJJqHjLsY4lMj0PkDo3H7TubWqCPvCNNXtBpSs9bSusJD
         UYSSdkdkyo5iWw9+IyUntGnmhZ9/buwlTPg82/7+d9EHvomV3cJYZu2AyO++QCUeOeiR
         GbYgI2PTbC5KTqifY//GpdFU3ffrw4sid83HR1Po4/yUcqJzg9Nd0sOaH1Ysm661BgaC
         389Q==
X-Gm-Message-State: AJIora+VXLfSdaic2JBg4wOsGZQpL/7HKupp2SBqSKUmwdn9yYHdgayX
        9IvMYt9Tz9Z5OOiROSWaSniYxw==
X-Google-Smtp-Source: AGRyM1vrAlxx3/zwHGViMnrhr0TP9FpHJZqqzma7SRLbfGYluod3AbepmehsQLewJJiAhdJeagZJDA==
X-Received: by 2002:a17:90a:7e84:b0:1f0:f3de:ffb3 with SMTP id j4-20020a17090a7e8400b001f0f3deffb3mr6243259pjl.75.1658332436196;
        Wed, 20 Jul 2022 08:53:56 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a073:d177:d5:aee:4f03])
        by smtp.gmail.com with ESMTPSA id a8-20020a170902710800b0015e8d4eb1d7sm13919198pll.33.2022.07.20.08.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 08:53:55 -0700 (PDT)
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
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 12/13] dt-bindings: display: exynos: dsim: Add NXP i.MX8MM support
Date:   Wed, 20 Jul 2022 21:22:09 +0530
Message-Id: <20220720155210.365977-13-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720155210.365977-1-jagan@amarulasolutions.com>
References: <20220720155210.365977-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Samsung MIPI DSIM bridge can also be found in i.MX8MM SoC.

Add dt-bingings for it.

v3:
* collect Rob Acked-by

v2:
* updated comments

v1:
* new patch

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
index be377786e8cd..8efcf4728e0b 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_dsim.txt
@@ -7,6 +7,7 @@ Required properties:
 		"samsung,exynos5410-mipi-dsi" /* for Exynos5410/5420/5440 SoCs */
 		"samsung,exynos5422-mipi-dsi" /* for Exynos5422/5800 SoCs */
 		"samsung,exynos5433-mipi-dsi" /* for Exynos5433 SoCs */
+		"fsl,imx8mm-mipi-dsim" /* for i.MX8M Mini SoCs */
   - reg: physical base address and length of the registers set for the device
   - interrupts: should contain DSI interrupt
   - clocks: list of clock specifiers, must contain an entry for each required
-- 
2.25.1

