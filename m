From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 06/15] tests/exynos: introduce wait_for_user_input
Date: Tue,  3 Feb 2015 14:53:56 +0100
Message-ID: <1422971645-30621-7-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:46014 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S965526AbbBCNy1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 3 Feb 2015 08:54:27 -0500
In-Reply-To: <1422971645-30621-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, m.szyprowski@samsung.com, djkurtz@chromium.org, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Currently getchar() is used to pause execution after each test.
The user isn't informed if one is supposed to do anything for
the tests to continue, so print a simple message to make this
more clear.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index 48dfe97..20b8e9d 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -237,6 +237,18 @@ void *create_checkerboard_pattern(unsigned int num_tiles_x,
 	return buf;
 }
 
+static void wait_for_user_input(int last)
+{
+	printf("press <ENTER> to ");
+
+	if (last)
+		printf("exit test application\n");
+	else
+		printf("skip to next test\n");
+
+	getchar();
+}
+
 static void exynos_destroy_buffer(struct exynos_bo *bo)
 {
 	exynos_bo_destroy(bo);
@@ -756,7 +768,7 @@ int main(int argc, char **argv)
 		goto err_rm_fb;
 	}
 
-	getchar();
+	wait_for_user_input(0);
 
 	src = exynos_create_buffer(dev, screen_width * screen_height * 4, 0);
 	if (!src) {
@@ -770,7 +782,7 @@ int main(int argc, char **argv)
 		goto err_free_src;
 	}
 
-	getchar();
+	wait_for_user_input(0);
 
 	ret = test_case.copy_with_scale(dev, src, bo, G2D_IMGBUF_GEM);
 	if (ret < 0) {
@@ -778,7 +790,7 @@ int main(int argc, char **argv)
 		goto err_free_src;
 	}
 
-	getchar();
+	wait_for_user_input(0);
 
 	ret = test_case.checkerboard(dev, src, bo, G2D_IMGBUF_GEM);
 	if (ret < 0) {
@@ -786,7 +798,7 @@ int main(int argc, char **argv)
 		goto err_free_src;
 	}
 
-	getchar();
+	wait_for_user_input(1);
 
 #if 0
 	ret  = test_case.blend(dev, src, bo, G2D_IMGBUF_USERPTR);
-- 
2.0.5
