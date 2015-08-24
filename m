From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 10/14] exynos/fimg2d: remove default case from g2d_get_blend_op()
Date: Mon, 24 Aug 2015 16:14:05 +0200
Message-ID: <1440425649-9768-11-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:50199 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754323AbbHXOQW (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Aug 2015 10:16:22 -0400
In-Reply-To: <1440425649-9768-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

We now validate the blending mode via g2d_validate_mode()
prior to feeding it to g2d_get_blend_op().

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 4274a94..d708e91 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -91,11 +91,6 @@ static unsigned int g2d_get_blend_op(enum e_g2d_op op)
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
