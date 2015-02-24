From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [PATCH v3 10/17] tests/exynos: improve error handling
Date: Tue, 24 Feb 2015 15:20:48 +0100
Message-ID: <1424787655-10739-11-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:47967 "EHLO
	smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753068AbbBXOZk (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Feb 2015 09:25:40 -0500
In-Reply-To: <1424787655-10739-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, emil.l.velikov@gmail.com, jy0922.shim@samsung.com, m.szyprowski@samsung.com, robclark@freedesktop.org, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Check for a useable connector and also if the resolution is sane
(width and height are both non-zero).

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 tests/exynos/exynos_fimg2d_test.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/tests/exynos/exynos_fimg2d_test.c b/tests/exynos/exynos_fimg2d_test.c
index 5e54d78..a780d8d 100644
--- a/tests/exynos/exynos_fimg2d_test.c
+++ b/tests/exynos/exynos_fimg2d_test.c
@@ -721,10 +721,22 @@ int main(int argc, char **argv)
 	connector_find_mode(dev->fd, &con, resources);
 	drmModeFreeResources(resources);
 
+	if (!con.mode) {
+		fprintf(stderr, "failed to find usable connector\n");
+		ret = -EFAULT;
+		goto err_drm_close;
+	}
+
 	screen_width = con.mode->hdisplay;
 	screen_height = con.mode->vdisplay;
 
-	printf("screen width  = %d, screen height = %d\n", screen_width,
+	if (screen_width == 0 || screen_height == 0) {
+		fprintf(stderr, "failed to find sane resolution on connector\n");
+		ret = -EFAULT;
+		goto err_drm_close;
+	}
+
+	printf("screen width = %d, screen height = %d\n", screen_width,
 			screen_height);
 
 	bo = exynos_create_buffer(dev, screen_width * screen_height * 4, 0);
-- 
2.0.5
