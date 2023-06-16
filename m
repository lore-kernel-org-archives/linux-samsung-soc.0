Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB4BBEB64D7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jun 2023 10:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345068AbjFPKcr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Jun 2023 06:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344692AbjFPKc1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jun 2023 06:32:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6BA4237;
        Fri, 16 Jun 2023 03:27:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D8CDF635C2;
        Fri, 16 Jun 2023 10:27:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE648C43391;
        Fri, 16 Jun 2023 10:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686911230;
        bh=VRkjnQDfjXAu6adCt3PdtX8T/zECSCAXojz7WBO3BNU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AJMuC8mC2JAJgJ/DSA6FDcWJHNbcxbTZ8XpqiE8NxR44ysqt3RAMJNBg34qgO+byU
         ggGB0k2pkY4gc4TXmsV3b5MZUnEEQyiFmPM7ndtl454/BMOSJfBs5cIW/xhf/BKHbA
         cgGudqoXj3VJk4kqBC2m8YNvCcBpYvnt7t1Mp1VLi2n+67F+puEOnj+tgy3S8OlNd1
         a9LmGoB6ldt8EQiWDV6I6WhCMWIUpKRtOdD+wDYmlBYL7LtIT74dV+AgzwVK0aiAw+
         UIZKDKfJW/RifttxE3VYBUGpnY5NMjX/Nn/OWQ85bq5Nub1weUdikFEFfuOryRQAzC
         LSJCogCScTbkw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Inki Dae <inki.dae@samsung.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Sasha Levin <sashal@kernel.org>, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, airlied@gmail.com, daniel@ffwll.ch,
        krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.1 20/26] drm/exynos: vidi: fix a wrong error return
Date:   Fri, 16 Jun 2023 06:26:17 -0400
Message-Id: <20230616102625.673454-20-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102625.673454-1-sashal@kernel.org>
References: <20230616102625.673454-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.34
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Inki Dae <inki.dae@samsung.com>

[ Upstream commit 4a059559809fd1ddbf16f847c4d2237309c08edf ]

Fix a wrong error return by dropping an error return.

When vidi driver is remvoed, if ctx->raw_edid isn't same as fake_edid_info
then only what we have to is to free ctx->raw_edid so that driver removing
can work correctly - it's not an error case.

Signed-off-by: Inki Dae <inki.dae@samsung.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_vidi.c b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
index 4d56c8c799c5a..f5e1adfcaa514 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -469,8 +469,6 @@ static int vidi_remove(struct platform_device *pdev)
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		kfree(ctx->raw_edid);
 		ctx->raw_edid = NULL;
-
-		return -EINVAL;
 	}
 
 	component_del(&pdev->dev, &vidi_component_ops);
-- 
2.39.2

