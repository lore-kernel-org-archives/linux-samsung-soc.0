From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 04/15] tests/exynos: disable the G2D userptr/blend test
Date: Mon, 16 Feb 2015 14:46:34 +0100
Message-ID: <1424094405-6314-5-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:55414 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755193AbbBPNq7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 16 Feb 2015 08:46:59 -0500
In-Reply-To: <1424094405-6314-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, jy0922.shim@samsung.com, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

v2: Move the commit description into the patch itself.
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index aa140e5..55d2970 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -788,11 +788,19 @@ int main(int argc, char **argv)
 
 	getchar();
 
+  /* The blend test uses the userptr functionality of exynos-drm, which     *
+   * is currently not safe to use. If the kernel hasn't been build with     *
+   * exynos-iommu support, then the blend test is going to produce (kernel) *
+   * memory corruption, eventually leading to a system crash.               *
+   *                                                                        *
+   * Disable the test for now, until the kernel code has been sanitized.    */
+#if 0
 	ret  = test_case.blend(dev, src, bo, G2D_IMGBUF_USERPTR);
 	if (ret < 0)
 		fprintf(stderr, "failed to test blend operation.\n");
 
 	getchar();
+#endif
 
 err_free_src:
 	if (src)
-- 
2.0.5
