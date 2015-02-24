From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 16/17] exynos: fimg2d: introduce G2D_OP_INTERPOLATE
Date: Tue, 24 Feb 2015 16:29:38 +0100
Message-ID: <1424791779-12016-2-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424791779-12016-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:48114 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751679AbbBXPaR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 10:30:17 -0500
In-Reply-To: <1424791779-12016-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This sets up the blending equation in the following way:
out = src * src_alpha + dst * (1 - src_alpha)

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.c | 4 ++++
 exynos/exynos_fimg2d.h | 1 +
 2 files changed, 5 insertions(+)

diff --git a/exynos/exynos_fimg2d.c b/exynos/exynos_fimg2d.c
index 974ee64..669fd5c 100644
--- a/exynos/exynos_fimg2d.c
+++ b/exynos/exynos_fimg2d.c
@@ -87,6 +87,10 @@ static unsigned int g2d_get_blend_op(enum e_g2d_op op)
 		SET_BF(val, G2D_COEFF_MODE_ONE, 0, 0, 0,
 				G2D_COEFF_MODE_SRC_ALPHA, 1, 0, 0);
 		break;
+	case G2D_OP_INTERPOLATE:
+		SET_BF(val, G2D_COEFF_MODE_SRC_ALPHA, 0, 0, 0,
+				G2D_COEFF_MODE_SRC_ALPHA, 1, 0, 0);
+		break;
 	default:
 		fprintf(stderr, "Not support operation(%d).\n", op);
 		SET_BF(val, G2D_COEFF_MODE_ONE, 0, 0, 0, G2D_COEFF_MODE_ZERO,
diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
index 418757f..f76f2a9 100644
--- a/exynos/exynos_fimg2d.h
+++ b/exynos/exynos_fimg2d.h
@@ -142,6 +142,7 @@ enum e_g2d_op {
 	G2D_OP_SRC			= 0x01,
 	G2D_OP_DST			= 0x02,
 	G2D_OP_OVER			= 0x03,
+	G2D_OP_INTERPOLATE		= 0x04,
 	G2D_OP_DISJOINT_CLEAR		= 0x10,
 	G2D_OP_DISJOINT_SRC		= 0x11,
 	G2D_OP_DISJOINT_DST		= 0x12,
-- 
2.0.5
