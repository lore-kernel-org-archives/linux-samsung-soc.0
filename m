Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D5DC4332F
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 14 Dec 2022 13:02:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238488AbiLNNCO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 14 Dec 2022 08:02:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238499AbiLNNBx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 14 Dec 2022 08:01:53 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90D222B3D
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:01:06 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id a9so3238682pld.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 14 Dec 2022 05:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aGZeH2FdyQWuLWEBAEjslXzZMZhb/E1elB1aBOym2sM=;
        b=m56FT1oDanBW9PWKnbeSb5IkAr3se5DC8jwthntnCF5kuV2stnlogAuf1cPJAOhSns
         8K6+gHDk8tePtSjYJ975gK5ScL/2mUa72wc5eW7qigY7fK0eaH8d8AIYf4H6ZmkJME6i
         SYVS2w3N1yojeEFQmr4x5I0CVP3xwaCiwfUZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aGZeH2FdyQWuLWEBAEjslXzZMZhb/E1elB1aBOym2sM=;
        b=L5KpLHEPWuQzCg/sSnQks0NctxW3W0LOPwL/i07qEIeHWuM9TLdYJPfE7uzZkqY50M
         kvYRB8RIhbN7tRgSga9t3X6bTxfhTO4G8nJX+c7DM/dBJ+wKNaGHZ9KSH093fX3RZOJN
         kMczqLi9UvSM7bvUVG2Twf44ng0hzJpR9XSgZldcebXJcEFFsUy3Lp+AFTidoaj+2Eeu
         2CNMtUfXQmtGsYMScj7peggfC8nWNsLagcDS6JUWVvwT0lMnEhSyb3mrPEvT7EShcu1J
         TClbtKF7gN7sPuokcH32mUajo81d1L8TwYY3K/ZtEznqPa/OFBT243h1AJr+94lSknDq
         Y6Ow==
X-Gm-Message-State: ANoB5plmAoTjJAJtmkLJh4hnr6oF7W+ZyTQNPhV8lLDWobvLiHS7ax31
        +0buNEKqZXSbmXcrlwFF70ki3A==
X-Google-Smtp-Source: AA0mqf5vqTiLEXGnaKR4utMJdHpQhiCDtMxqCdfrrlJXTvjjbI9xNmjnIyqYEJSocU6h3k6MtaC8RQ==
X-Received: by 2002:a17:902:e8d0:b0:187:3921:2b1c with SMTP id v16-20020a170902e8d000b0018739212b1cmr25543764plg.55.1671022865974;
        Wed, 14 Dec 2022 05:01:05 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a809:5e03:faf:846e:352d])
        by smtp.gmail.com with ESMTPSA id ix17-20020a170902f81100b001895f7c8a71sm1838651plb.97.2022.12.14.05.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Dec 2022 05:01:05 -0800 (PST)
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
        Neil Armstrong <narmstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
        Marek Vasut <marex@denx.de>
Cc:     Matteo Lisi <matteo.lisi@engicam.com>,
        dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-amarula <linux-amarula@amarulasolutions.com>,
        Jagan Teki <jagan@amarulasolutions.com>
Subject: [PATCH v10 13/18] drm: exynos: dsi: Add Exynos based host irq hooks
Date:   Wed, 14 Dec 2022 18:29:02 +0530
Message-Id: <20221214125907.376148-14-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221214125907.376148-1-jagan@amarulasolutions.com>
References: <20221214125907.376148-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Enable and disable of te_gpio's are Exynos platform specific
irq handling, so add the exynos based irq operations and hook
them for exynos plat_data.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v10:
- split from previous series patch
"drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge"

 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 55 +++++++++++++++++++++----
 1 file changed, 47 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 819131a36b96..580e06595b37 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -291,9 +291,15 @@ struct exynos_dsim_host_ops {
 	int (*detach)(struct exynos_dsi *dsim, struct mipi_dsi_device *device);
 };
 
+struct exynos_dsim_irq_ops {
+	void (*enable)(struct exynos_dsi *dsim);
+	void (*disable)(struct exynos_dsi *dsim);
+};
+
 struct exynos_dsi_plat_data {
 	enum exynos_dsi_type hw_type;
 	const struct exynos_dsim_host_ops *host_ops;
+	const struct exynos_dsim_irq_ops *irq_ops;
 };
 
 struct exynos_dsi {
@@ -308,7 +314,6 @@ struct exynos_dsi {
 	struct clk **clks;
 	struct regulator_bulk_data supplies[2];
 	int irq;
-	struct gpio_desc *te_gpio;
 
 	u32 pll_clk_rate;
 	u32 burst_clk_rate;
@@ -332,6 +337,7 @@ struct exynos_dsi {
 
 struct exynos_dsi_enc {
 	struct drm_encoder encoder;
+	struct gpio_desc *te_gpio;
 };
 
 #define host_to_dsi(host) container_of(host, struct exynos_dsi, dsi_host)
@@ -1345,18 +1351,38 @@ static irqreturn_t exynos_dsi_te_irq_handler(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
+static void _exynos_dsi_enable_irq(struct exynos_dsi *dsim)
 {
-	enable_irq(dsi->irq);
+	struct _exynos_dsi *dsi = dsim->priv;
 
 	if (dsi->te_gpio)
 		enable_irq(gpiod_to_irq(dsi->te_gpio));
 }
 
-static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
+static void _exynos_dsi_disable_irq(struct exynos_dsi *dsim)
 {
+	struct _exynos_dsi *dsi = dsim->priv;
+
 	if (dsi->te_gpio)
 		disable_irq(gpiod_to_irq(dsi->te_gpio));
+}
+
+static void exynos_dsi_enable_irq(struct exynos_dsi *dsi)
+{
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
+
+	enable_irq(dsi->irq);
+
+	if (pdata->irq_ops && pdata->irq_ops->enable)
+		pdata->irq_ops->enable(dsi);
+}
+
+static void exynos_dsi_disable_irq(struct exynos_dsi *dsi)
+{
+	const struct exynos_dsi_plat_data *pdata = dsi->plat_data;
+
+	if (pdata->irq_ops && pdata->irq_ops->disable)
+		pdata->irq_ops->disable(dsi);
 
 	disable_irq(dsi->irq);
 }
@@ -1385,9 +1411,10 @@ static int exynos_dsi_init(struct exynos_dsi *dsi)
 	return 0;
 }
 
-static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
+static int exynos_dsi_register_te_irq(struct exynos_dsi *dsim,
 				      struct device *panel)
 {
+	struct _exynos_dsi *dsi = dsim->priv;
 	int ret;
 	int te_gpio_irq;
 
@@ -1395,7 +1422,7 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	if (!dsi->te_gpio) {
 		return 0;
 	} else if (IS_ERR(dsi->te_gpio)) {
-		dev_err(dsi->dev, "gpio request failed with %ld\n",
+		dev_err(dsim->dev, "gpio request failed with %ld\n",
 				PTR_ERR(dsi->te_gpio));
 		return PTR_ERR(dsi->te_gpio);
 	}
@@ -1405,7 +1432,7 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	ret = request_threaded_irq(te_gpio_irq, exynos_dsi_te_irq_handler, NULL,
 				   IRQF_TRIGGER_RISING | IRQF_NO_AUTOEN, "TE", dsi);
 	if (ret) {
-		dev_err(dsi->dev, "request interrupt failed with %d\n", ret);
+		dev_err(dsim->dev, "request interrupt failed with %d\n", ret);
 		gpiod_put(dsi->te_gpio);
 		return ret;
 	}
@@ -1413,8 +1440,10 @@ static int exynos_dsi_register_te_irq(struct exynos_dsi *dsi,
 	return 0;
 }
 
-static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
+static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsim)
 {
+	struct _exynos_dsi *dsi = dsim->priv;
+
 	if (dsi->te_gpio) {
 		free_irq(gpiod_to_irq(dsi->te_gpio), dsi);
 		gpiod_put(dsi->te_gpio);
@@ -2035,6 +2064,11 @@ static const struct dev_pm_ops exynos_dsi_pm_ops = {
 				pm_runtime_force_resume)
 };
 
+static const struct exynos_dsim_irq_ops exynos_dsi_irq_ops = {
+	.enable = _exynos_dsi_enable_irq,
+	.disable = _exynos_dsi_disable_irq,
+};
+
 static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 	.register_host = exynos_dsi_register_host,
 	.unregister_host = exynos_dsi_unregister_host,
@@ -2045,26 +2079,31 @@ static const struct exynos_dsim_host_ops exynos_dsi_host_ops = {
 static const struct exynos_dsi_plat_data exynos3250_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS3250,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos4210_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS4210,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5410_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5410,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5422_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5422,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct exynos_dsi_plat_data exynos5433_dsi_pdata = {
 	.hw_type = DSIM_TYPE_EXYNOS5433,
 	.host_ops = &exynos_dsi_host_ops,
+	.irq_ops = &exynos_dsi_irq_ops,
 };
 
 static const struct of_device_id exynos_dsi_of_match[] = {
-- 
2.25.1

