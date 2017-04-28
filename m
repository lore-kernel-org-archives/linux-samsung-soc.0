From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: [PATCH] MAINTAINERS: Remove myself as reviewer for Exynos
Date: Fri, 28 Apr 2017 00:22:15 -0400
Message-ID: <20170428042215.14006-1-javier@dowhile0.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:35778 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932243AbdD1EWY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 28 Apr 2017 00:22:24 -0400
Received: by mail-qk0-f196.google.com with SMTP id a19so7575600qkg.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 27 Apr 2017 21:22:24 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Shuah Khan <shuahkh@osg.samsung.com>, Javier Martinez Canillas <javier@dowhile0.org>

I left Samsung and lost access to most Exynos hardware and documentation.
Also, I likely won't be able to keep an eye on the platform anymore in the
short term so remove myself as a reviewer for Exynos.

Signed-off-by: Javier Martinez Canillas <javier@dowhile0.org>

---

 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 45be5ef6056c..e35370a0c04c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1722,7 +1722,6 @@ N:	rockchip
 ARM/SAMSUNG EXYNOS ARM ARCHITECTURES
 M:	Kukjin Kim <kgene@kernel.org>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
-R:	Javier Martinez Canillas <javier@osg.samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
 Q:	https://patchwork.kernel.org/project/linux-samsung-soc/list/
-- 
2.9.3
