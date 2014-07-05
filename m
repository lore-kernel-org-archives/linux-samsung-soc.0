From: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
Subject: [PATCH] video: fbdev: exynos: s6e8ax0.c:  Cleaning up variable that is never used
Date: Sat,  5 Jul 2014 14:20:15 +0200
Message-ID: <1404562815-19356-1-git-send-email-rickard_strandqvist@spectrumdigital.se>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f175.google.com ([74.125.82.175]:36600 "EHLO
	mail-we0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751169AbaGEMTA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 5 Jul 2014 08:19:00 -0400
Received: by mail-we0-f175.google.com with SMTP id k48so2514102wev.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 05 Jul 2014 05:18:59 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Rickard Strandqvist <rickard.strandqvist@sonymobile.com>, Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>, Kukjin Kim <kgene.kim@samsung.com>, Jingoo Han <jg1.han@samsung.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Rob Clark <robdclark@gmail.com>, Sachin Kamat <sachin.kamat@linaro.org>, linux-fbdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

From: Rickard Strandqvist <rickard.strandqvist@sonymobile.com>

Variable ar assigned a value that is never used.
I have also removed all the code that thereby serves no purpose.

This was found using a static code analysis program called cppcheck

Signed-off-by: Rickard Strandqvist <rickard_strandqvist@spectrumdigital.se>
---
 drivers/video/fbdev/exynos/s6e8ax0.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/exynos/s6e8ax0.c b/drivers/video/fbdev/exynos/s6e8ax0.c
index 29e70ed..9bd67e7 100644
--- a/drivers/video/fbdev/exynos/s6e8ax0.c
+++ b/drivers/video/fbdev/exynos/s6e8ax0.c
@@ -602,11 +602,10 @@ static void s6e8ax0_acl_ctrl_set(struct s6e8ax0 *lcd)
 
 static void s6e8ax0_read_id(struct s6e8ax0 *lcd, u8 *mtp_id)
 {
-	unsigned int ret;
 	unsigned int addr = 0xd1;	/* MTP ID */
 	struct mipi_dsim_master_ops *ops = lcd_to_master_ops(lcd);
 
-	ret = ops->cmd_read(lcd_to_master(lcd),
+	ops->cmd_read(lcd_to_master(lcd),
 			MIPI_DSI_GENERIC_READ_REQUEST_1_PARAM,
 			addr, 3, mtp_id);
 }
-- 
1.7.10.4
