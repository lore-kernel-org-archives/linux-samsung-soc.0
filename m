From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 5/9] exynos/fimg2d: remove default case from g2d_get_blend_op()
Date: Tue,  8 Sep 2015 17:22:30 +0200
Message-ID: <1441725754-27555-6-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:34636 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754535AbbIHPX5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 8 Sep 2015 11:23:57 -0400
In-Reply-To: <1441725754-27555-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

We now validate the blending mode via g2d_validate_mode()
prior to feeding it to g2d_get_blend_op().

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 9d9359a..d7cbb24 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -64,6 +64,11 @@ static unsigned int g2d_get_blend_op(enum e_g2d_op op)
 
 	val.val = 0;
 
+	/*
+	 * The switch statement is missing the default branch since
+	 * we assume that the caller checks the blending operation
+	 * via g2d_validate_blending_op() first.
+	 */
 	switch (op) {
 	case G2D_OP_CLEAR:
 	case G2D_OP_DISJOINT_CLEAR:
@@ -91,11 +96,6 @@ static unsigned int g2d_get_blend_op(enum e_g2d_op op)
 		SET_BF(val, G2D_COEFF_MODE_SRC_ALPHA, 0, 0, 0,
 				G2D_COEFF_MODE_SRC_ALPHA, 1, 0, 0);
 		break;
-	default:
-		fprintf(stderr, "Not support operation(%d).\n", op);
-		SET_BF(val, G2D_COEFF_MODE_ONE, 0, 0, 0, G2D_COEFF_MODE_ZERO,
-				0, 0, 0);
-		break;
 	}
 
 	return val.val;
-- 
2.0.5
