From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 2/2] drm/exynos: WARN_ON if ideal_clk is zero
Date: Wed, 20 May 2015 11:33:48 -0300
Message-ID: <1432132428-13519-2-git-send-email-gustavo@padovan.org>
References: <1432132428-13519-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qc0-f171.google.com ([209.85.216.171]:35195 "EHLO
	mail-qc0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752681AbbETOeC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 May 2015 10:34:02 -0400
Received: by qceb3 with SMTP id b3so22759283qce.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 May 2015 07:34:01 -0700 (PDT)
In-Reply-To: <1432132428-13519-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, daniel@fooishbar.org, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

ideal_clk is the divisor in an operation to find the clock divider so
it can't never be zero or we will end up with a division by zero error.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 drivers/gpu/drm/exynos/exynos_drm_fimd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
index 08f7197..294f9cf 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
@@ -309,6 +309,8 @@ static u32 fimd_calc_clkdiv(struct fimd_context *ctx,
 	unsigned long ideal_clk = mode->htotal * mode->vtotal * mode->vrefresh;
 	u32 clkdiv;
 
+	WARN_ON(ideal_clk == 0);
+
 	if (ctx->i80_if) {
 		/*
 		 * The frame done interrupt should be occurred prior to the
-- 
2.1.0
