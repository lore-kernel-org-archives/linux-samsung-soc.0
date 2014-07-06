From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] video: fbdev: exynos: exynos_mipi_dsi_common.c:  Cleaning up variable that is never used
Date: Sun,  6 Jul 2014 20:29:01 +0200
Message-ID: <1404671341-17941-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:42188 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751915AbaGFS1q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 6 Jul 2014 14:27:46 -0400
Received: by mail-we0-f175.google.com with SMTP id k48so3414299wev.20
        for <linux-samsung-soc@vger.kernel.org>; Sun, 06 Jul 2014 11:27:45 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Kukjin Kim <kgene.kim@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, Daniel Vetter <daniel.vetter@ffwll.ch>, Joe Perches <joe@perches.com>, Wolfram Sang <wsa@the-dreams.de>, Sachin Kamat <sachin.kamat@linaro.org>, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Variable ar assigned a value that is never used.
I have also removed all the code that thereby serves no purpose.

This was found using a static code analysis program called cppcheck

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 drivers/video/fbdev/exynos/exynos_mipi_dsi_common.c |    4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/exynos/exynos_mipi_dsi_common.c b/drivers/video/fbdev/exynos/exynos_mipi_dsi_common.c
index 85edabf..9e4f9bd 100644
--- a/drivers/video/fbdev/exynos/exynos_mipi_dsi_common.c
+++ b/drivers/video/fbdev/exynos/exynos_mipi_dsi_common.c
@@ -219,11 +219,9 @@ int exynos_mipi_dsi_wr_data(struct mipi_dsim_device *dsim, unsigned int data_id,
 	case MIPI_DSI_GENERIC_LONG_WRITE:
 	case MIPI_DSI_DCS_LONG_WRITE:
 	{
-		unsigned int size, payload = 0;
+		unsigned int payload = 0;
 		reinit_completion(&dsim_wr_comp);
 
-		size = data_size * 4;
-
 		/* if data count is less then 4, then send 3bytes data.  */
 		if (data_size < 4) {
 			payload = data0[0] |
-- 
1.7.10.4
