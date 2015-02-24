From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 06/17] tests/exynos: introduce wait_for_user_input
Date: Tue, 24 Feb 2015 15:20:44 +0100
Message-ID: <1424787655-10739-7-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47926 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752421AbbBXOX5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 09:23:57 -0500
In-Reply-To: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Currently getchar() is used to pause execution after each test.
The user isn't informed if one is supposed to do anything for
the tests to continue, so print a simple message to make this
more clear.

v3: Compactify printf calls as pointed out by
    Emil Velikov <emil.l.velikov at gmail.com>.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index 0f7cf24..5a2a351 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -237,6 +237,14 @@ void *create_checkerboard_pattern(unsigned int num_tiles_x,
 	return buf;
 }
 
+static void wait_for_user_input(int last)
+{
+	printf("press <ENTER> to %s\n", last ? "exit test application" :
+                                           "skip to next test");
+
+	getchar();
+}
+
 static void exynos_destroy_buffer(struct exynos_bo *bo)
 {
 	exynos_bo_destroy(bo);
@@ -756,7 +764,7 @@ int main(int argc, char **argv)
 		goto err_rm_fb;
 	}
 
-	getchar();
+	wait_for_user_input(0);
 
 	src = exynos_create_buffer(dev, screen_width * screen_height * 4, 0);
 	if (!src) {
@@ -770,7 +778,7 @@ int main(int argc, char **argv)
 		goto err_free_src;
 	}
 
-	getchar();
+	wait_for_user_input(0);
 
 	ret = test_case.copy_with_scale(dev, src, bo, G2D_IMGBUF_GEM);
 	if (ret < 0) {
@@ -778,7 +786,7 @@ int main(int argc, char **argv)
 		goto err_free_src;
 	}
 
-	getchar();
+	wait_for_user_input(0);
 
 	ret = test_case.checkerboard(dev, src, bo, G2D_IMGBUF_GEM);
 	if (ret < 0) {
@@ -786,7 +794,7 @@ int main(int argc, char **argv)
 		goto err_free_src;
 	}
 
-	getchar();
+	wait_for_user_input(1);
 
 	/*
 	 * The blend test uses the userptr functionality of exynos-drm, which
-- 
2.0.5
