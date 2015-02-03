From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 04/15] tests/exynos: disable the G2D userptr/blend test
Date: Tue,  3 Feb 2015 14:53:54 +0100
Message-ID: <1422971645-30621-5-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:46006 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965552AbbBCNyZ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 08:54:25 -0500
In-Reply-To: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

The blend test uses the userptr functionality of exynos-drm, which
is currently not safe to use. If the kernel hasn't been build with
exynos-iommu support, then the blend test is going to produce (kernel)
memory corruption, eventually leading to a system crash.

Disable the test for now, until the kernel code has been sanitized.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index aa140e5..48dfe97 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -788,11 +788,13 @@ int main(int argc, char **argv)
 
 	getchar();
 
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
