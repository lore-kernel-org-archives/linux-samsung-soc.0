From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable WiFi-Ex as a module instead built-in
Date: Tue, 29 Sep 2015 14:42:26 +0200
Message-ID: <1443530546-3066-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:39849 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934793AbbI2Mmt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 29 Sep 2015 08:42:49 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@osg.samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Andreas Faerber <afaerber@suse.de>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org

The Marvell WiFi-Ex driver tries to load a firmware on probe. So if the
driver is built-in and probed before a firmware is available, this is
not loaded and the chip does not work.

This happens for example if an initramfs isn't used since the driver is
probed before the root filesystem is mounted.

Change the default config since the driver isn't needed for machines to
boot and is more convenient to have it enabled as a module to avoid
requiring an initramfs or to have the firmware built into the kernel.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm/configs/exynos_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index d4f6063d8a72..5aad617f02c7 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -64,8 +64,8 @@ CONFIG_SMSC911X=y
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
-CONFIG_MWIFIEX=y
-CONFIG_MWIFIEX_SDIO=y
+CONFIG_MWIFIEX=m
+CONFIG_MWIFIEX_SDIO=m
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_CROS_EC=y
-- 
2.4.3
