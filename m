From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 7/7] exynos: fimg2d: follow-up fix for G2D_COEFF_MODE_GB_COLOR
Date: Wed, 11 Mar 2015 20:38:46 +0100
Message-ID: <1426102726-27078-7-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1426102726-27078-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:33752 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752039AbbCKTjF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 11 Mar 2015 15:39:05 -0400
In-Reply-To: <1426102726-27078-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Also add the register field formatting info provided by
Inki Dae <inki.dae@samsung.com>.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Reviewed-by: Inki Dae <inki.dae@samsung.com>
Tested-by: Joonyoung Shim <jy0922.shim@samsung.com>
---
 exynos/exynos_fimg2d.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
index f76f2a9..9db0c88 100644
--- a/exynos/exynos_fimg2d.h
+++ b/exynos/exynos_fimg2d.h
@@ -151,6 +151,12 @@ enum e_g2d_op {
 	G2D_OP_CONJOINT_DST		= 0x22,
 };
 
+/*
+ * The G2D_COEFF_MODE_DST_{COLOR,ALPHA} modes both use the ALPHA_REG(0x618)
+ * register. The registers fields are as follows:
+ * bits 31:8 = color value (RGB order)
+ * bits 7:0 = alpha value
+ */
 enum e_g2d_coeff_mode {
 	G2D_COEFF_MODE_ONE,
 	G2D_COEFF_MODE_ZERO,
@@ -160,7 +166,7 @@ enum e_g2d_coeff_mode {
 	G2D_COEFF_MODE_DST_COLOR,
 	/* Global Alpha : Set by ALPHA_REG(0x618) */
 	G2D_COEFF_MODE_GB_ALPHA,
-	/* Global Color : Set by ALPHA_REG(0x618) */
+	/* Global Color and Alpha : Set by ALPHA_REG(0x618) */
 	G2D_COEFF_MODE_GB_COLOR,
 	/* (1-SRC alpha)/DST Alpha */
 	G2D_COEFF_MODE_DISJOINT_S,
-- 
2.0.5
