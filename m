From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
Subject: [PATCH 2/2 v2] ARM: exynos_defconfig: enable USB gadget support
Date: Tue, 26 Aug 2014 09:30:30 +0200
Message-ID: <1409038230-7242-3-git-send-email-sjoerd.simons@collabora.co.uk>
References: <1409038230-7242-1-git-send-email-sjoerd.simons@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cube.luon.net ([37.72.100.20]:56379 "EHLO cube.luon.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752889AbaHZHbj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 26 Aug 2014 03:31:39 -0400
In-Reply-To: <1409038230-7242-1-git-send-email-sjoerd.simons@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Sjoerd Simons <sjoerd.simons@collabora.co.uk>

Enable USB gadget support without support for any specific gadgets to
more easily catch cases where a devices dts doesn't specify the usb
controllers dr_mode while it should.

Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
---
 Changes in v2: none

 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index fc7d168..3664120 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -54,6 +54,7 @@ CONFIG_SMSC911X=y
 CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
+CONFIG_USB_GADGET=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_CROS_EC=y
-- 
2.1.0
