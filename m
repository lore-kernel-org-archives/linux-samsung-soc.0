Return-Path: <SRS0=UMxf=C3=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C370AC43464
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Sep 2020 02:56:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8519C20870
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 18 Sep 2020 02:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600397776;
	bh=2dQoNSLwcFHgL9nUDXpmWel0uijiSICTv+90Rw3dA60=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=McLSPvgGBZ4qzwxgGLh7+orA3X00TEtpRxaC08VLtEQwQdjjT/Vekk2Ttt9Tkvn7I
	 ssSD98iUZt9OayJ+BpHIiHF/9NS2Ck5HMpp+AgMCldC4ypiwU44D51eVzeOtUYpX18
	 ED3b4x5cKxIZpwU+l8L55FaY1qKGoOD7u1KOcFLo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727837AbgIRCHG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 17 Sep 2020 22:07:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:56154 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727798AbgIRCGk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 17 Sep 2020 22:06:40 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59D5E238D6;
        Fri, 18 Sep 2020 02:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600394799;
        bh=2dQoNSLwcFHgL9nUDXpmWel0uijiSICTv+90Rw3dA60=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=GB0C+t3n8B+Thngs1CGWIacdmsG2gfYR+U4Z7weCcP38LqYbnzCBJ0emFN8R46R3U
         PdPUQii4ZDlJf9UdosIuf5JxH0BI/+yEWQ+IrAjhAmF1wed8kpRa+4qJZnIria5yPx
         X6we+FCVqpQqk9SnR+6BebIWlECrwTK1XD+17JRc=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Inki Dae <inki.dae@samsung.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 268/330] drm/exynos: dsi: Remove bridge node reference in error handling path in probe function
Date:   Thu, 17 Sep 2020 22:00:08 -0400
Message-Id: <20200918020110.2063155-268-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>

[ Upstream commit 547a7348633b1f9923551f94ac3157a613d2c9f2 ]

'exynos_dsi_parse_dt()' takes a reference to 'dsi->in_bridge_node'.
This must be released in the error handling path.

In order to do that, add an error handling path and move the
'exynos_dsi_parse_dt()' call from the beginning to the end of the probe
function to ease the error handling path.
This function only sets some variables which are used only in the
'transfer' function.

The call chain is:
   .transfer
    --> exynos_dsi_host_transfer
      --> exynos_dsi_init
        --> exynos_dsi_enable_clock  (use burst_clk_rate and esc_clk_rate)
          --> exynos_dsi_set_pll     (use pll_clk_rate)

While at it, also handle cases where 'component_add()' fails.

This patch is similar to commit 70505c2ef94b ("drm/exynos: dsi: Remove bridge node reference in removal")
which fixed the issue in the remove function.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 8ed94c9948008..b83acd696774b 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1741,10 +1741,6 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->dev = dev;
 	dsi->driver_data = of_device_get_match_data(dev);
 
-	ret = exynos_dsi_parse_dt(dsi);
-	if (ret)
-		return ret;
-
 	dsi->supplies[0].supply = "vddcore";
 	dsi->supplies[1].supply = "vddio";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dsi->supplies),
@@ -1805,11 +1801,25 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	ret = exynos_dsi_parse_dt(dsi);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, &dsi->encoder);
 
 	pm_runtime_enable(dev);
 
-	return component_add(dev, &exynos_dsi_component_ops);
+	ret = component_add(dev, &exynos_dsi_component_ops);
+	if (ret)
+		goto err_disable_runtime;
+
+	return 0;
+
+err_disable_runtime:
+	pm_runtime_disable(dev);
+	of_node_put(dsi->in_bridge_node);
+
+	return ret;
 }
 
 static int exynos_dsi_remove(struct platform_device *pdev)
-- 
2.25.1

