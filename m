From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: S5P: Fix compilation error for exynos4_defconfig
Date: Fri,  3 Jun 2011 10:37:19 +0530
Message-ID: <1307077639-18604-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:63931 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750929Ab1FCFJY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 3 Jun 2011 01:09:24 -0400
Received: by pzk9 with SMTP id 9so705525pzk.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2011 22:09:23 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linaro-dev@linaro.org, kgene.kim@samsung.com, nicolas.pitre@linaro.org, patches@linaro.org, jy0922.shim@samsung.com

EHCI requires that USB support be enabled in kernel config.
Selecting USB_SUPPORT with S5P_DEV_USB_EHCI fixes the problem.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/plat-s5p/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index e98f5c5..c7e7419 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -87,6 +87,7 @@ config S5P_DEV_CSIS1
 
 config S5P_DEV_USB_EHCI
 	bool
+	select USB_SUPPORT
 	help
 	  Compile in platform device definition for USB EHCI
 
-- 
1.7.1
