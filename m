From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/2] ARM: exynos_defconfig: Enable GPIO buttons driver
Date: Mon, 17 Jun 2013 09:48:05 +0530
Message-ID: <1371442686-24999-2-git-send-email-tushar.behera@linaro.org>
References: <1371442686-24999-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f176.google.com ([209.85.192.176]:49089 "EHLO
	mail-pd0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937Ab3FQEdh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Jun 2013 00:33:37 -0400
Received: by mail-pd0-f176.google.com with SMTP id t12so2357039pdi.35
        for <linux-samsung-soc@vger.kernel.org>; Sun, 16 Jun 2013 21:33:37 -0700 (PDT)
In-Reply-To: <1371442686-24999-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, olof@lixom.net, patches@linaro.org

Many of the boards use GPIO-mapped buttons for generic input.
For Arndale board, these buttons also serve as wakeup source.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/configs/exynos_defconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 227abf9..9ab979a 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -50,6 +50,7 @@ CONFIG_USB_USBNET=y
 CONFIG_USB_NET_SMSC75XX=y
 CONFIG_USB_NET_SMSC95XX=y
 CONFIG_INPUT_EVDEV=y
+CONFIG_KEYBOARD_GPIO=y
 CONFIG_KEYBOARD_CROS_EC=y
 # CONFIG_MOUSE_PS2 is not set
 CONFIG_MOUSE_CYAPA=y
-- 
1.7.9.5
