From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv3 1/2] ARM: exynos_defconfig: Enable rtl8152 ethernet driver for Odroid-XU4
Date: Thu,  8 Oct 2015 03:48:36 +0000
Message-ID: <1444276117-3657-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:35006 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751318AbbJHDsw (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 7 Oct 2015 23:48:52 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Anand Moon <linux.amoon@gmail.com>, Lukasz Majewski <l.majewski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Odroid XU4 has a RTL8153-CG gigabit Ethernet adapter, connected over
USB 3.0.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

---
Changes: Fixed the commit message thanks to Krzysztof Kozlowski
         Added reviewed by Krzysztof Kozlowski
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 1ff2bfa..5d1937b 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -61,6 +61,7 @@ CONFIG_BLK_DEV_DM=y
 CONFIG_DM_CRYPT=m
 CONFIG_NETDEVICES=y
 CONFIG_SMSC911X=y
+CONFIG_USB_RTL8152=y
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
-- 
2.1.4
