Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C0DEEB64D7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jun 2023 10:28:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344386AbjFPK17 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Jun 2023 06:27:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344132AbjFPK1i (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jun 2023 06:27:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B21CC4488;
        Fri, 16 Jun 2023 03:26:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 87CE263591;
        Fri, 16 Jun 2023 10:26:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 841B5C433C0;
        Fri, 16 Jun 2023 10:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686911172;
        bh=5r/F6a1Myi58nLeOgxAiMCY1m5Gdsqjn2GihdUq/W7Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZIsYm8I7snqJ+NIf0xtDJBaWSaHYytVRNbIG31+pmF3wpqbbAsVg7mP4EaZT3wTFG
         m+VjeQ5NEeE8vqbArpmAkw+rnZceffWAzH97knQHeb9G8YhO/S6eQkcbonyZ1DuCeu
         oK3VPbhMRQt0Ap75nY9pT3iniPqdW7cbLWFkCAHu+e9RdKGuotXX5aB9gl+ihzQg/1
         yh8j5PhM3wAMlH40YFiu4eP9qkdiDWIKj/1qTfT6YZ+Xg6gjRJvcsS+hgqvx/kO4Hg
         JYO2kWNwZIZ+x6BVN3rzCp8T6D+HuGfPQifj7umxzRXP6fSssUhIRG7GdGb1nRcUCi
         8qKfgNMbxo+KA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Min Li <lm0963hack@gmail.com>, Andi Shyti <andi.shyti@kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Sasha Levin <sashal@kernel.org>, sw0312.kim@samsung.com,
        kyungmin.park@samsung.com, airlied@gmail.com, daniel@ffwll.ch,
        krzysztof.kozlowski@linaro.org, dri-devel@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH AUTOSEL 6.3 24/30] drm/exynos: fix race condition UAF in exynos_g2d_exec_ioctl
Date:   Fri, 16 Jun 2023 06:25:12 -0400
Message-Id: <20230616102521.673087-24-sashal@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230616102521.673087-1-sashal@kernel.org>
References: <20230616102521.673087-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.3.8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Min Li <lm0963hack@gmail.com>

[ Upstream commit 48bfd02569f5db49cc033f259e66d57aa6efc9a3 ]

If it is async, runqueue_node is freed in g2d_runqueue_worker on another
worker thread. So in extreme cases, if g2d_runqueue_worker runs first, and
then executes the following if statement, there will be use-after-free.

Signed-off-by: Min Li <lm0963hack@gmail.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index ec784e58da5c1..414e585ec7dd0 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -1335,7 +1335,7 @@ int exynos_g2d_exec_ioctl(struct drm_device *drm_dev, void *data,
 	/* Let the runqueue know that there is work to do. */
 	queue_work(g2d->g2d_workq, &g2d->runqueue_work);
 
-	if (runqueue_node->async)
+	if (req->async)
 		goto out;
 
 	wait_for_completion(&runqueue_node->complete);
-- 
2.39.2

