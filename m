From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 04/17] tests/exynos: disable the G2D userptr/blend test
Date: Tue, 24 Feb 2015 15:20:42 +0100
Message-ID: <1424787655-10739-5-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47913 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752350AbbBXOW7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 09:22:59 -0500
In-Reply-To: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

v2: Move the commit description into the patch itself.
v3: Use common commenting style as pointed out by
    Emil Velikov <emil.l.velikov at gmail.com>.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index aa140e5..0f7cf24 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -788,11 +788,21 @@ int main(int argc, char **argv)
 
 	getchar();
 
+	/*
+	 * The blend test uses the userptr functionality of exynos-drm, which
+	 * is currently not safe to use. If the kernel hasn't been build with
+	 * exynos-iommu support, then the blend test is going to produce (kernel)
+	 * memory corruption, eventually leading to a system crash.
+	 *
+	 * Disable the test for now, until the kernel code has been sanitized.
+	 */
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
