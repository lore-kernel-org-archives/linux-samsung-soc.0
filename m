From: Olof Johansson <olof@lixom.net>
Subject: [PATCH] video: exynos_mipi_dsim: Remove unused variable
Date: Thu, 14 Nov 2013 13:09:24 -0800
Message-ID: <1384463364-28864-1-git-send-email-olof@lixom.net>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f54.google.com ([209.85.220.54]:34510 "EHLO
	mail-pa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754766Ab3KNVIm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Nov 2013 16:08:42 -0500
Received: by mail-pa0-f54.google.com with SMTP id lj1so2648427pab.13
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Nov 2013 13:08:41 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, linux-fbdev@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>, Sylwester Nawrocki <s.nawrocki@samsung.com>

commit 7e0be9f9f7cba3356f75b86737dbe3a005da067e ('video: exynos_mipi_dsim:
Use the generic PHY driver') resulted in a warning about an unused
variable:

drivers/video/exynos/exynos_mipi_dsi.c:144:26: warning: unused variable
    'pdev' [-Wunused-variable]

It is indeed unused; remove it.

Signed-off-by: Olof Johansson <olof@lixom.net>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 drivers/video/exynos/exynos_mipi_dsi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/video/exynos/exynos_mipi_dsi.c b/drivers/video/exynos/exynos_mipi_dsi.c
index 00b3a52..cee9602 100644
--- a/drivers/video/exynos/exynos_mipi_dsi.c
+++ b/drivers/video/exynos/exynos_mipi_dsi.c
@@ -141,7 +141,6 @@ static int exynos_mipi_dsi_early_blank_mode(struct mipi_dsim_device *dsim,
 
 static int exynos_mipi_dsi_blank_mode(struct mipi_dsim_device *dsim, int power)
 {
-	struct platform_device *pdev = to_platform_device(dsim->dev);
 	struct mipi_dsim_lcd_driver *client_drv = dsim->dsim_lcd_drv;
 	struct mipi_dsim_lcd_device *client_dev = dsim->dsim_lcd_dev;
 
-- 
1.7.10.4
