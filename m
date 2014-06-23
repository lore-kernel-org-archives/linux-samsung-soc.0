From: Rahul Sharma <rahul.sharma@samsung.com>
Subject: [PATCH 4/5 v2] drm/exynos: soft reset mixer before reconfigure after
 power-on
Date: Mon, 23 Jun 2014 11:02:24 +0530
Message-ID: <1403501545-16482-5-git-send-email-rahul.sharma@samsung.com>
References: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:17898 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751166AbaFWFdb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 01:33:31 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7L00LC2WRTWJ20@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 23 Jun 2014 14:33:29 +0900 (KST)
In-reply-to: <1403501545-16482-1-git-send-email-rahul.sharma@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, kgene.kim@samsung.com, joshi@samsung.com, r.sh.open@gmail.com, Rahul Sharma <rahul.sharma@samsung.com>

Mixer soft reset is a recommended step before reconfiguring
the mixer after power on. Mixer looses the previous state of
DMAs if soft reset. This is the recommendation from the
hardware team.

Signed-off-by: Rahul Sharma <rahul.sharma@samsung.com>
---
 drivers/gpu/drm/exynos/exynos_mixer.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 6773b03..6f18581 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1085,6 +1085,8 @@ static void mixer_poweron(struct exynos_drm_manager *mgr)
 	ctx->powered = true;
 	mutex_unlock(&ctx->mixer_mutex);
 
+	mixer_reg_writemask(res, MXR_STATUS, ~0, MXR_STATUS_SOFT_RESET);
+
 	mixer_reg_write(res, MXR_INT_EN, ctx->int_en);
 	mixer_win_reset(ctx);
 
-- 
1.7.9.5
