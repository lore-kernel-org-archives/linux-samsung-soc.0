From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: exynos_defconfig: Update EHCI config entry
Date: Thu, 16 Jan 2014 14:04:24 +0530
Message-ID: <1389861264-7305-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:42779 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbaAPIin (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 16 Jan 2014 03:38:43 -0500
Received: by mail-pb0-f44.google.com with SMTP id rq2so2353619pbb.31
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Jan 2014 00:38:43 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, olof@lixom.net

Commit 29824c167bea ("USB: host: Rename ehci-s5p to ehci-exynos")
renamed the config entry of EHCI host driver. Similar change needs
to be done in exynos_defconfig as well.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/configs/exynos_defconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index dbe1f1c..4ce7b70 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -94,7 +94,7 @@ CONFIG_FONT_7x14=y
 CONFIG_LOGO=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_S5P=y
+CONFIG_USB_EHCI_EXYNOS=y
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_PHY=y
-- 
1.7.9.5
