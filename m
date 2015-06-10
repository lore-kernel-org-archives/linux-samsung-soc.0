From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH 9/9] tests/exynos: handle G2D_IMGBUF_COLOR in switch statements
Date: Wed, 10 Jun 2015 15:42:28 +0200
Message-ID: <1433943748-15849-10-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:33663 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S964976AbbFJNst (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jun 2015 09:48:49 -0400
In-Reply-To: <1433943748-15849-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, gustavo.padovan@collabora.co.uk, inki.dae@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This fixes a compiler warning about missing handling of enum
values in the switch statements.

Also remove the silent mapping to G2D_IMGBUF_GEM when an
unknown buffer type is encountered. We have full control
about the type here, and if it's unknown then we obviously
have a bug in the code.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index 59de4ba..8794dac 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -270,9 +270,10 @@ static int g2d_copy_test(struct exynos_device *dev, struct exynos_bo *src,
 		src_img.user_ptr[0].userptr = userptr;
 		src_img.user_ptr[0].size = size;
 		break;
+	case G2D_IMGBUF_COLOR:
 	default:
-		type = G2D_IMGBUF_GEM;
-		break;
+		ret = -EFAULT;
+		goto fail;
 	}
 
 	printf("copy test with %s.\n",
@@ -306,6 +307,7 @@ err_free_userptr:
 		if (userptr)
 			free((void *)userptr);
 
+fail:
 	g2d_fini(ctx);
 
 	return ret;
@@ -349,9 +351,10 @@ static int g2d_copy_with_scale_test(struct exynos_device *dev,
 		src_img.user_ptr[0].userptr = userptr;
 		src_img.user_ptr[0].size = size;
 		break;
+	case G2D_IMGBUF_COLOR:
 	default:
-		type = G2D_IMGBUF_GEM;
-		break;
+		ret = -EFAULT;
+		goto fail;
 	}
 
 	printf("copy and scale test with %s.\n",
@@ -390,6 +393,7 @@ err_free_userptr:
 		if (userptr)
 			free((void *)userptr);
 
+fail:
 	g2d_fini(ctx);
 
 	return 0;
@@ -435,9 +439,10 @@ static int g2d_blend_test(struct exynos_device *dev,
 		src_img.user_ptr[0].userptr = userptr;
 		src_img.user_ptr[0].size = size;
 		break;
+	case G2D_IMGBUF_COLOR:
 	default:
-		type = G2D_IMGBUF_GEM;
-		break;
+		ret = -EFAULT;
+		goto fail;
 	}
 
 	printf("blend test with %s.\n",
@@ -487,6 +492,7 @@ err_free_userptr:
 		if (userptr)
 			free((void *)userptr);
 
+fail:
 	g2d_fini(ctx);
 
 	return 0;
@@ -532,6 +538,7 @@ static int g2d_checkerboard_test(struct exynos_device *dev,
 		src_img.user_ptr[0].userptr = (unsigned long)checkerboard;
 		src_img.user_ptr[0].size = img_w * img_h * 4;
 		break;
+	case G2D_IMGBUF_COLOR:
 	default:
 		ret = -EFAULT;
 		goto fail;
-- 
2.0.5
