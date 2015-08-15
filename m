From: Gustavo Padovan <gustavo@padovan.org>
Subject: [PATCH 06/11] drm/exynos: add macro to get the address of START_S reg
Date: Sat, 15 Aug 2015 13:26:15 -0300
Message-ID: <1439655980-32146-7-git-send-email-gustavo@padovan.org>
References: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f171.google.com ([209.85.160.171]:34073 "EHLO
	mail-yk0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753216AbbHOQ0l (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 15 Aug 2015 12:26:41 -0400
Received: by ykdt205 with SMTP id t205so93020014ykd.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 15 Aug 2015 09:26:40 -0700 (PDT)
In-Reply-To: <1439655980-32146-1-git-send-email-gustavo@padovan.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, inki.dae@samsung.com, jy0922.shim@samsung.com, tjakobi@math.uni-bielefeld.de, Gustavo Padovan <gustavo.padovan@collabora.co.uk>

From: Gustavo Padovan <gustavo.padovan@collabora.co.uk>

This macro is need to get the value of the START shadow register, that
will tell if an framebuffer is currently displayed on the screen or not.

Signed-off-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 include/video/samsung_fimd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/video/samsung_fimd.h b/include/video/samsung_fimd.h
index 0530e5a..d8fc96e 100644
--- a/include/video/samsung_fimd.h
+++ b/include/video/samsung_fimd.h
@@ -296,6 +296,7 @@
 
 /* Video buffer addresses */
 #define VIDW_BUF_START(_buff)			(0xA0 + ((_buff) * 8))
+#define VIDW_BUF_START_S(_buff)			(0x40A0 + ((_buff) * 8))
 #define VIDW_BUF_START1(_buff)			(0xA4 + ((_buff) * 8))
 #define VIDW_BUF_END(_buff)			(0xD0 + ((_buff) * 8))
 #define VIDW_BUF_END1(_buff)			(0xD4 + ((_buff) * 8))
-- 
2.1.0
