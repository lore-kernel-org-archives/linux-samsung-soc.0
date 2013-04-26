From: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
Subject: [PATCH 8/9] s3c2410fb: Remove redundant platform_set_drvdata()
Date: Fri, 26 Apr 2013 22:02:22 +0200
Message-ID: <1367006543-5458-9-git-send-email-sylvester.nawrocki@gmail.com>
References: <1367006543-5458-1-git-send-email-sylvester.nawrocki@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f47.google.com ([74.125.83.47]:49288 "EHLO
	mail-ee0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756227Ab3DZUE3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 26 Apr 2013 16:04:29 -0400
In-Reply-To: <1367006543-5458-1-git-send-email-sylvester.nawrocki@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, FlorianSchandinat@gmx.de
Cc: linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Sylwester Nawrocki <sylvester.nawrocki@gmail.com>

driver_data field is being cleared by the driver core since
commit 0998d0631001288a5974afc0b2a5f568bcdecb4d
device-core: Ensure drvdata = NULL when no driver is bound
hence there is no need to do it in the driver's remove() callback.

Signed-off-by: Sylwester Nawrocki <sylvester.nawrocki@gmail.com>
---
 drivers/video/s3c2410fb.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/drivers/video/s3c2410fb.c b/drivers/video/s3c2410fb.c
index 11f98ca..0439ed0 100644
--- a/drivers/video/s3c2410fb.c
+++ b/drivers/video/s3c2410fb.c
@@ -1013,7 +1013,6 @@ static int s3c2410fb_remove(struct platform_device *pdev)
 	irq = platform_get_irq(pdev, 0);
 	free_irq(irq, info);
 
-	platform_set_drvdata(pdev, NULL);
 	framebuffer_release(fbinfo);
 
 	return 0;
-- 
1.7.4.1
