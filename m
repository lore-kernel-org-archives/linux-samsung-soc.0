From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v2 07/13] tests/exynos: use XRGB8888 for framebuffer
Date: Sun, 22 Nov 2015 19:48:37 +0100
Message-ID: <1448218123-21292-8-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:45798 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751886AbbKVSxK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 22 Nov 2015 13:53:10 -0500
In-Reply-To: <1448218123-21292-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, inki.dae@samsung.com, human.hwang@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

This matches the G2D color mode that is used in the entire code.
The previous (incorrect) RGBA8888 would only work since the
Exynos mixer did its configuration based on the bpp, and not
based on the actual pixelformat.

Reviewed-by: Hyungwon Hwang <human.hwang@samsung.com>
Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index 8794dac..dfb00a0 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -675,7 +675,7 @@ int main(int argc, char **argv)
 	offsets[0] = 0;
 
 	ret = drmModeAddFB2(dev->fd, screen_width, screen_height,
-				DRM_FORMAT_RGBA8888, handles,
+				DRM_FORMAT_XRGB8888, handles,
 				pitches, offsets, &fb_id, 0);
 	if (ret < 0)
 		goto err_destroy_buffer;
-- 
2.4.9
