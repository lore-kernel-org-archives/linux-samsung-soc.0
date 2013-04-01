From: Edward Smietana <edward.smietana@gmx.com>
Subject: [PATCH] [drm] exynos: hdmi: Remove fecal color
Date: Mon,  1 Apr 2013 19:07:39 +0200
Message-ID: <1364836059-8929-1-git-send-email-edward.smietana@gmx.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:54957 "EHLO mout.gmx.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751719Ab3DARH5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 1 Apr 2013 13:07:57 -0400
Received: from mailout-eu.gmx.com ([10.1.101.212]) by mrigmx.server.lan
 (mrigmx001) with ESMTP (Nemesis) id 0LmxXe-1UqF4Y2oeq-00h2pW for
 <linux-samsung-soc@vger.kernel.org>; Mon, 01 Apr 2013 19:07:54 +0200
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org
Cc: linux-samsung-soc@vger.kernel.org, inki.dae@samsung.com, sw0312.kim@samsung.com, jy0922.shim@samsung.com, Edward Smietana <edward.smietana@gmx.com>

This patch makes the driver less shitty.

Signed-off-by: Edward Smietana <edward.smietana@gmx.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 6d63f90..e11372c 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -1269,7 +1269,7 @@ static void hdmi_conf_init(struct hdmi_context *hdata)
 	}
 
 	if (hdata->type == HDMI_TYPE13) {
-		/* choose bluescreen (fecal) color */
+		/* choose bluescreen (brown) color */
 		hdmi_reg_writeb(hdata, HDMI_V13_BLUE_SCREEN_0, 0x12);
 		hdmi_reg_writeb(hdata, HDMI_V13_BLUE_SCREEN_1, 0x34);
 		hdmi_reg_writeb(hdata, HDMI_V13_BLUE_SCREEN_2, 0x56);
-- 
1.8.1.5
