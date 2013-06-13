From: Doug Anderson <dianders@chromium.org>
Subject: [PATCH] MAINTAINERS: Add Samsung pinctrl entries
Date: Thu, 13 Jun 2013 10:05:44 -0700
Message-ID: <1371143144-31764-1-git-send-email-dianders@chromium.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yh0-f73.google.com ([209.85.213.73]:45848 "EHLO
	mail-yh0-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754643Ab3FMRGK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 13:06:10 -0400
Received: by mail-yh0-f73.google.com with SMTP id l109so678334yhq.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jun 2013 10:06:10 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: linux-samsung-soc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa <tomasz.figa@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Doug Anderson <dianders@chromium.org>, Mauro Carvalho Chehab <mchehab@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Cesar Eduardo Barros <cesarb@cesarb.net>, "David S. Miller" <davem@davemloft.net>, Hans Verkuil <hans.verkuil@cisco.com>, linux-kernel@vger.kernel.org

It's convenient if get_maintainer suggests sending samsung/exynos
pinctrl changes to linux-samsung-soc and to Kukjin.  Add an entry for
that.

Signed-off-by: Doug Anderson <dianders@chromium.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8d97b3e..d026e38 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6284,6 +6284,16 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
 F:	drivers/pinctrl/pinctrl-at91.c
 
+PIN CONTROLLER - SAMSUNG
+M:	Linus Walleij <linus.walleij@linaro.org>
+M:	Kukjin Kim <kgene.kim@samsung.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+S:	Maintained
+F:	drivers/pinctrl/pinctrl-exynos.*
+F:	drivers/pinctrl/pinctrl-s3c*
+F:	drivers/pinctrl/pinctrl-samsung.*
+
 PIN CONTROLLER - ST SPEAR
 M:	Viresh Kumar <viresh.linux@gmail.com>
 L:	spear-devel@list.st.com
-- 
1.8.3
