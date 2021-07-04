Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF010C07E96
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D845361090
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Jul 2021 09:04:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbhGDJHX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Jul 2021 05:07:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGDJHW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Jul 2021 05:07:22 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14834C061764
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Jul 2021 02:04:47 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id f20so5773745pfa.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Jul 2021 02:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aOxt2XSdF8Vu9MaPp0d88r9EWjzv+GLUOgY6jPHdXls=;
        b=gASCchYTm9VBICj74vs9VBQI8rMz+f/n/TQVW6L/6kwO9JUnY2YXoDngVV9QIzxKX4
         Nkgkqe+InQOuPAAof4mlU9NyDNGUjisRh5cOFsLIdKm3CkFLy0O4YZ6mQ2EpuKFCRT07
         +DEQQ+DUPDwa1uCkDVoZ3zpOoj3Sr4VciRcJ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aOxt2XSdF8Vu9MaPp0d88r9EWjzv+GLUOgY6jPHdXls=;
        b=Za/BtiXHg+lOSmbDAa7msrJ8x1DwXMrHer1z/Y9/NbqA0uSdauCFldjC5wDy4GKLxZ
         5/ryjogPA36L74m/dkmSQSyTtuTmvvBS0aUoiUQWw+yVSzbq236NM2w1ZPBdTPpCmHx3
         lMZkrCbUGHEuyMAV8XyF8HBmm9EtCbxvXSsZagLdoa5eTbMiG8GRN2Nosah8BShgbTEi
         An5qyCFXilMYc8q27BNJLKoENzYt5rdQuv0vf9AuEaCRggzwKsBIIkvdMh//Mha0UXNU
         leTQ9kmbii8XGixO0BcQX9e043Q2dRRKiJbrhovLOIKNLo/WDDBPcg5/ORg+17OxVShE
         LeCg==
X-Gm-Message-State: AOAM532IChFNTHvDGNrIf1h8OthUc4qOVCdbXMa8nkHHQrjA+kmmWH1y
        /31MFITuSeCd0LxEof678DkNIQ==
X-Google-Smtp-Source: ABdhPJyejiV8eNBAe9gSXGQ1me1rC7FcvMTscyW/u8Fa2uxpQGpmABNE1xRuSiKNABzT72gTKnRe4Q==
X-Received: by 2002:a65:450d:: with SMTP id n13mr9498245pgq.13.1625389486591;
        Sun, 04 Jul 2021 02:04:46 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:1ae9:772f:6f0f:3e24])
        by smtp.gmail.com with ESMTPSA id m24sm3360793pgd.60.2021.07.04.02.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 02:04:46 -0700 (PDT)
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
Subject: [RFC PATCH 06/17] drm/exynos: dsi: Handle exynos specifics via driver_data
Date:   Sun,  4 Jul 2021 14:32:19 +0530
Message-Id: <20210704090230.26489-7-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210704090230.26489-1-jagan@amarulasolutions.com>
References: <20210704090230.26489-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos DSI driver is actually a Samsung MIPI DSIM bridge
IP which is also used in i.MX8MM platforms.

Right now the existing driver has some exynos drm specific
code bases like te_irq, crtc and component_ops.

In order to switch this driver into a common bridge driver
We can see 2 options to handle the exynos specific code.

A. Drop the component_ops, and rework other specifics.
   This may lead to more foundation work as it requires
   more changes in exynos drm drivers stack.

B. Handle the exynos specifics via driver data, and make
   the common bridge work in different platforms and plan
   for option A in future.

So, this patch is trying to add option B) changes to handle
exynos specifics via driver_data.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 37 +++++++++++++++++++------
 1 file changed, 29 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 99a1b8c22313..53d878d4d2d7 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -250,6 +250,7 @@ struct exynos_dsi_driver_data {
 	unsigned int wait_for_reset;
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
+	bool exynos_specific;
 };
 
 struct exynos_dsi {
@@ -459,6 +460,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.exynos_specific = true,
 };
 
 static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
@@ -471,6 +473,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.exynos_specific = true,
 };
 
 static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
@@ -481,6 +484,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
+	.exynos_specific = true,
 };
 
 static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
@@ -492,6 +496,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 	.wait_for_reset = 0,
 	.num_bits_resol = 12,
 	.reg_values = exynos5433_reg_values,
+	.exynos_specific = true,
 };
 
 static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
@@ -503,6 +508,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
 	.wait_for_reset = 1,
 	.num_bits_resol = 12,
 	.reg_values = exynos5422_reg_values,
+	.exynos_specific = true,
 };
 
 static const struct of_device_id exynos_dsi_of_match[] = {
@@ -1484,7 +1490,8 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	 * If attached panel device is for command mode one, dsi should register
 	 * TE interrupt handler.
 	 */
-	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
+	if (dsi->driver_data->exynos_specific &&
+	    !(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
 		int ret = exynos_dsi_register_te_irq(dsi, &device->dev);
 		if (ret)
 			return ret;
@@ -1495,8 +1502,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
-	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
-			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
+	if (dsi->driver_data->exynos_specific)
+		exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
+					    !(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
 
 	mutex_unlock(&drm->mode_config.mutex);
 
@@ -1515,7 +1523,8 @@ static int exynos_dsi_host_detach(struct mipi_dsi_host *host,
 	if (drm->mode_config.poll_enabled)
 		drm_kms_helper_hotplug_event(drm);
 
-	exynos_dsi_unregister_te_irq(dsi);
+	if (dsi->driver_data->exynos_specific)
+		exynos_dsi_unregister_te_irq(dsi);
 
 	return 0;
 }
@@ -1737,6 +1746,15 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	if (!dsi->driver_data->exynos_specific) {
+		ret = mipi_dsi_host_register(&dsi->dsi_host);
+		if (ret) {
+			dev_err(dev, "failed to register mipi dsi host: %d\n",
+				ret);
+			return ret;
+		}
+	}
+
 	platform_set_drvdata(pdev, dsi);
 
 	pm_runtime_enable(dev);
@@ -1747,9 +1765,11 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 
 	drm_bridge_add(&dsi->bridge);
 
-	ret = component_add(dev, &exynos_dsi_component_ops);
-	if (ret)
-		goto err_disable_runtime;
+	if (dsi->driver_data->exynos_specific) {
+		ret = component_add(dev, &exynos_dsi_component_ops);
+		if (ret)
+			goto err_disable_runtime;
+	}
 
 	return 0;
 
@@ -1767,7 +1787,8 @@ static int exynos_dsi_remove(struct platform_device *pdev)
 
 	pm_runtime_disable(&pdev->dev);
 
-	component_del(&pdev->dev, &exynos_dsi_component_ops);
+	if (dsi->driver_data->exynos_specific)
+		component_del(&pdev->dev, &exynos_dsi_component_ops);
 
 	return 0;
 }
-- 
2.25.1

