Return-Path: <SRS0=5lYo=CE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1D1EC433E1
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Aug 2020 14:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A672D214F1
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 26 Aug 2020 14:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598453734;
	bh=gKXl1ZpEahM5GZKiwmsRUCIU4Nv7/kn9yq6EaD8r/ZE=;
	h=From:To:Subject:Date:List-ID:From;
	b=JbmZjx3aANT36A0uZtZF8M0gg6KdM1nJ932eMElQM6izA8oyyjC+eB05EMKU1LIy+
	 GPbWGeu/PtvUlXZWU66VP5AIl5AwTdVNka/Ql2ZXYXHh6KUqMP1V9gm74p7Stjityj
	 hoGswIyNFxWIHIlNwWV4xwpC+MI7osewJFvF3Jek=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728014AbgHZOz2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 26 Aug 2020 10:55:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:43830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728067AbgHZOzU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 26 Aug 2020 10:55:20 -0400
Received: from localhost.localdomain (unknown [194.230.155.216])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B19042078D;
        Wed, 26 Aug 2020 14:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598453720;
        bh=gKXl1ZpEahM5GZKiwmsRUCIU4Nv7/kn9yq6EaD8r/ZE=;
        h=From:To:Subject:Date:From;
        b=lIfxfGLDBfMoYSTveYiYmFbSWIsSxZ8pBQL3LWFzyvx07QmeyNC17vzRAxNqaSRU2
         +ATK1jiqGX80Y4Rb3VaDpi2G/mKlfpGG6Z1i3U3a40vmgYfcmiQ7FzRKsx2Qdu3BLl
         HSUrxnrA5W18ecBfhV5sk956SKO5QbqDk+qgDLlo=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Inki Dae <inki.dae@samsung.com>,
        Joonyoung Shim <jy0922.shim@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/exynos: dsi: Simplify with dev_err_probe()
Date:   Wed, 26 Aug 2020 16:55:12 +0200
Message-Id: <20200826145513.10657-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Common pattern of handling deferred probe can be simplified with
dev_err_probe().  Less code and also it prints the error value.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 1a1a2853a842..5b9666fc7af1 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -1760,11 +1760,8 @@ static int exynos_dsi_probe(struct platform_device *pdev)
 	dsi->supplies[1].supply = "vddio";
 	ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(dsi->supplies),
 				      dsi->supplies);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_info(dev, "failed to get regulators: %d\n", ret);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get regulators\n");
 
 	dsi->clks = devm_kcalloc(dev,
 			dsi->driver_data->num_clks, sizeof(*dsi->clks),
-- 
2.17.1

