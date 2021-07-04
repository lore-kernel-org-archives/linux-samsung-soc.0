Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E1B5C07E96
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CB4661090
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:05:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229698AbhGDJHm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGDJHm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jul 2021 05:07:42 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58E11C061762
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Jul 2021 02:05:06 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id n11so9580123pjo.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2021 02:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LDJhbX+YMl3evTa07XA+cYBo4VfmU7H6Kne/zU0MCxI=;
        b=MzU6XoPBmW8oZc8sFFtNdNj7nBMBEITvj347sE61nkA/4LHtDJQ/adSkdZsxF9I6f5
         7RCsUnSCy7i0MBKTALe5RQAyETtpQd3atLLGO8KGGRj4fqfxhS6HRWy3OjweDv3VKVtL
         +syAh8R08cMBsMYbrksHRa2cPU+yJ0uDgfU9s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LDJhbX+YMl3evTa07XA+cYBo4VfmU7H6Kne/zU0MCxI=;
        b=MHtH9putagxVAi509M8hey0UeRjXPNO68zlYz4yC7ZxQonjee5pP+UJzdcCZv9tK71
         ko690zs4HezJWTZlf14c1FtKc3mrm3X1nHxb71MrOIIw0BsCv6g09OYkWJxoupEarJh8
         UEbMO0RNnzV9SnPX/FihUsiOOzQeqZ1c9lpJKm3ZmRHQ6MFzHv9i4jFtdQOT3ch49ilF
         /78/CminjPi1OJ5+9Ae3PFw0R/7LnmVMpjEnaY9yKoK8UGE3/JrMq2UARTY8Ks9rY6Hr
         pka+S1D1znOWczneSw+PRc4/YnPzTjArZYGgIm3Lq1eNsyiMkZFPpO44eB9cxtgxMuX6
         yeqw==
X-Gm-Message-State: AOAM530eS7/AoRuZEAlFP8PHBM8hzs1+JZKYyUrI8IhfnPSkdNAlek9E
        VCdyYtJHaSWa/xU8ALRmeAhrpg==
X-Google-Smtp-Source: ABdhPJzIvvEMjIP/hh218sspQf7V0ep9uHZnLxmS0/zXxCMUJE2GejzApTBKIzS2W7ykhYnyWrTqcQ==
X-Received: by 2002:a17:902:c00b:b029:129:c3:aeb7 with SMTP id v11-20020a170902c00bb029012900c3aeb7mr7305352plx.39.1625389505903;
        Sun, 04 Jul 2021 02:05:05 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
        by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:05:05 -0700 (PDT)
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
Subject: [RFC PATCH 09/17] drm: bridge: samsung-dsim: Add module init, exit
Date:   Sun,  4 Jul 2021 14:32:22 +0530
Message-Id: <20210704090230.26489-10-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add module init and exit functions for the bridge to
register and unregister dsi_driver.

Exynos drm driver stack will register the platform_driver
separately in the common of it's exynos_drm_drv.c including
dsi_driver. Register again would return -EBUSY, so return 0
for such cases as dsi_driver is already registered.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index eed6b3ffdea7..627580abd6df 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1878,6 +1878,28 @@ struct platform_driver dsi_driver = {
 	},
 };
 
+static int __init samsung_mipi_dsim_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&dsi_driver);
+
+	/**
+	 * Exynos drm driver stack will register the platform_driver
+	 * separately in the common of it's exynos_drm_drv.c including
+	 * dsi_driver. Register again would return -EBUSY, so return 0
+	 * for such cases as dsi_driver is already registered.
+	 */
+	return ret == -EBUSY ? 0 : ret;
+}
+module_init(samsung_mipi_dsim_init);
+
+static void __exit samsung_mipi_dsim_exit(void)
+{
+	platform_driver_unregister(&dsi_driver);
+}
+module_exit(samsung_mipi_dsim_exit);
+
 MODULE_AUTHOR("Tomasz Figa <t.figa@samsung.com>");
 MODULE_AUTHOR("Andrzej Hajda <a.hajda@samsung.com>");
 MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
-- 
2.25.1

