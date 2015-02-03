From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 13/15] exynos: fimg2d: fix comment for G2D_COEFF_MODE_GB_COLOR
Date: Tue,  3 Feb 2015 14:54:03 +0100
Message-ID: <1422971645-30621-14-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:46045 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965526AbbBCNyf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 08:54:35 -0500
In-Reply-To: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The coefficient mode enables use of global color, not alpha.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 exynos/exynos_fimg2d.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/exynos/exynos_fimg2d.h b/exynos/exynos_fimg2d.h
index bd116cf..78cff47 100644
--- a/exynos/exynos_fimg2d.h
+++ b/exynos/exynos_fimg2d.h
@@ -166,7 +166,7 @@ enum e_g2d_coeff_mode {
 	G2D_COEFF_MODE_DST_COLOR,
 	/* Global Alpha : Set by ALPHA_REG(0x618) */
 	G2D_COEFF_MODE_GB_ALPHA,
-	/* Global Alpha : Set by ALPHA_REG(0x618) */
+	/* Global Color : Set by ALPHA_REG(0x618) */
 	G2D_COEFF_MODE_GB_COLOR,
 	/* (1-SRC alpha)/DST Alpha */
 	G2D_COEFF_MODE_DISJOINT_S,
-- 
2.0.5
