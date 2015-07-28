From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH] MAINTAINERS: pinctrl: Move Thomas Abraham to CREDITS
Date: Tue, 28 Jul 2015 17:21:47 +0900
Message-ID: <1438071707-20685-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:25697 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750859AbbG1IXr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 28 Jul 2015 04:23:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <tomasz.figa@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>

Thomas Abraham's Linaro email address bounces for several months. Also
there were no replies for several emails sent on LKML to his Samsung
address. Move his name to CREDITS.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Tomasz Figa <tomasz.figa@gmail.com>
Cc: Thomas Abraham <thomas.ab@samsung.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Link: http://lkml.org/lkml/2015/6/15/15
---
 CREDITS     | 4 ++++
 MAINTAINERS | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/CREDITS b/CREDITS
index 4fcf9cd8544c..bcb8efaa9459 100644
--- a/CREDITS
+++ b/CREDITS
@@ -20,6 +20,10 @@ D: One of assisting postmasters for vger.kernel.org's lists
 S: (ask for current address)
 S: Finland
 
+N: Thomas Abraham
+E: thomas.ab@samsung.com
+D: Samsung pin controller driver
+
 N: Dragos Acostachioaie
 E: dragos@iname.com
 W: http://www.arbornet.org/~dragos
diff --git a/MAINTAINERS b/MAINTAINERS
index 4bed1920eb2a..f0a63f06ca33 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8008,7 +8008,6 @@ F:	drivers/pinctrl/sh-pfc/
 
 PIN CONTROLLER - SAMSUNG
 M:	Tomasz Figa <tomasz.figa@gmail.com>
-M:	Thomas Abraham <thomas.abraham@linaro.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 S:	Maintained
-- 
1.9.1
