Return-Path: <SRS0=l8hj=AT=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 000CCC433E1
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Jul 2020 15:44:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C857A206DF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Jul 2020 15:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1594223069;
	bh=B4KbhpoltGExd208/4xHgN1aUeY0aanpA2UIDqaA8Jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=SaU9Dp9me6qnSDIyLM6nq2va8mgW7g8+dvWr+3p8Lm+647hH3eJlZ0lf7ZX1cd7oW
	 SiaeUUKp7p288a6JNMJ/gTPJceIin2Nn3CWTliF0npmHE6HHF7zJ7oF28em47uTa0/
	 tRX0dgzbjHHe2oM4h7gPNwn2eKLEGhM6G0xxLF8k=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730193AbgGHPlX (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Jul 2020 11:41:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:47748 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730386AbgGHPlX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Jul 2020 11:41:23 -0400
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 006CC20786;
        Wed,  8 Jul 2020 15:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1594222882;
        bh=B4KbhpoltGExd208/4xHgN1aUeY0aanpA2UIDqaA8Jk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aIVCD5gYfxPdcaJsnAEHtOOb2xq53ugXXr2BODQBSt+AXrX6jS7ShY9kZBcARtfvw
         651RMymOudCIP+Vq5uQuqdrN8jzAOrXSbvM0X8UMXkGpZ9Uzf4lANE777KslWl2nP6
         AaJHDnETAjLVJrmhBrPtT+CI9u+mu9xZk9/hZARQ=
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        kbuild test robot <lkp@intel.com>,
        Inki Dae <inki.dae@samsung.com>,
        Sasha Levin <sashal@kernel.org>,
        dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 5.7 04/30] drm/exynos: Properly propagate return value in drm_iommu_attach_device()
Date:   Wed,  8 Jul 2020 11:40:50 -0400
Message-Id: <20200708154116.3199728-4-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200708154116.3199728-1-sashal@kernel.org>
References: <20200708154116.3199728-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

[ Upstream commit b9c633882de4601015625f9136f248e9abca8a7a ]

Propagate the proper error codes from the called functions instead of
unconditionally returning 0.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Merge conflict so merged it manually.
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_dma.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dma.c b/drivers/gpu/drm/exynos/exynos_drm_dma.c
index 619f81435c1b2..58b89ec11b0eb 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dma.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dma.c
@@ -61,7 +61,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 				struct device *subdrv_dev, void **dma_priv)
 {
 	struct exynos_drm_private *priv = drm_dev->dev_private;
-	int ret;
+	int ret = 0;
 
 	if (get_dma_ops(priv->dma_dev) != get_dma_ops(subdrv_dev)) {
 		DRM_DEV_ERROR(subdrv_dev, "Device %s lacks support for IOMMU\n",
@@ -92,7 +92,7 @@ static int drm_iommu_attach_device(struct drm_device *drm_dev,
 	if (ret)
 		clear_dma_max_seg_size(subdrv_dev);
 
-	return 0;
+	return ret;
 }
 
 /*
-- 
2.25.1

