Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D13C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 May 2022 11:41:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348924AbiEDLpJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 May 2022 07:45:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348917AbiEDLpI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 May 2022 07:45:08 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD880E0D2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 May 2022 04:41:32 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id c9so471242plh.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 May 2022 04:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zroNIHNyi1xhWUCjMbfGRAX1xVgB1APMgcHSCv64Dcg=;
        b=GAMchdnOFVBu8MgxuMIcwfoun7timH2lhBD9bi3n1IOZVh9J/WFY63YoebZLARAICK
         AYqUsCFqKufuSUa14TOerRFX5LcMhnoqguVXcfZtFOoxVYHHExRug9CDoW1Ax0QNtxk+
         utEfgZ4g9oFV6hnVUFHf1qb1Tohxqtu2Oj6SA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zroNIHNyi1xhWUCjMbfGRAX1xVgB1APMgcHSCv64Dcg=;
        b=uAWgG1ryDLb0/RMMqyDJHIOM3Y7tWv7Kfe0MeeZpyNnw/EC0W3wMa3ijcrVwshyTnC
         sXQ/168iMujPAXTSdk+hZwOL9eAd0Ibb5z+votkXF0MkgTrOTeAPNEwa6jprrKaZDtAg
         i4JnJlaAMsDUBUno2Nd/u3KKo8BH3l3t0FRDw9CAqj82GQlTi8KsjUPV740K0+5UgC5q
         9FfiIGYm7UJtrBIx6RYD+lv5o6a9rPTAxun4JHJv69ZPsn4MBHEYQPDKHxsTF3dwEuVA
         GLCGU9y7JGcnOj5sGM/U70u9p4jb+phHvE1ipVZrGz70zIVPTpJFWtgwOJfvqIx+FnjR
         L1lA==
X-Gm-Message-State: AOAM532IyFq7tUIw3L9ntUYH/fz5sLURJlXODMBNsVtppAeVH2QeQylb
        inlsEoVUaJopTEdrhEYvAFCFow==
X-Google-Smtp-Source: ABdhPJwEaGjX3j/RzoSectesepakk+UomwdKFJ3YD/G3W/8jIvtg0/ahYwC1KyfyV4iEoDGRkcuAnw==
X-Received: by 2002:a17:90a:fa97:b0:1dc:2805:9b0a with SMTP id cu23-20020a17090afa9700b001dc28059b0amr9700771pjb.85.1651664492362;
        Wed, 04 May 2022 04:41:32 -0700 (PDT)
Received: from localhost.localdomain ([183.83.137.38])
        by smtp.gmail.com with ESMTPSA id k15-20020aa790cf000000b0050dc7628174sm8027498pfk.78.2022.05.04.04.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 04:41:31 -0700 (PDT)
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
Subject: [PATCH v2 07/12] drm: bridge: samsung-dsim: Add module init, exit
Date:   Wed,  4 May 2022 17:10:16 +0530
Message-Id: <20220504114021.33265-8-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504114021.33265-1-jagan@amarulasolutions.com>
References: <20220504114021.33265-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add module init and exit functions for the bridge to register
and unregister dsi_driver.

Exynos drm driver stack will register the platform_driver separately
in the common of it's exynos_drm_drv.c including dsi_driver.

Register again would return -EBUSY, so return 0 for such cases as
dsi_driver is already registered.

v2, v1:
* none

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 8f9ae16d45bc..b618e52d0ee3 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1740,6 +1740,28 @@ struct platform_driver dsi_driver = {
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
 MODULE_AUTHOR("Jagan Teki <jagan@amarulasolutions.com>");
 MODULE_DESCRIPTION("Samsung MIPI DSIM controller bridge");
 MODULE_LICENSE("GPL");
-- 
2.25.1

