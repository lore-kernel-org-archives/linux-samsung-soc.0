From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 9/9] ARM: multi_v7_defconfig: Enable Cypress APA I2C Trackpad support
Date: Thu, 14 May 2015 17:40:16 +0200
Message-ID: <1431618016-2087-10-git-send-email-javier.martinez@collabora.co.uk>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:47190 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964953AbbENPkt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 11:40:49 -0400
In-Reply-To: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

The Cypress All Points Addressable (APA) I2C Trackpad is used in the
Samsung Exynos 5250 Snow Chromebook. Build the driver as a module so
the device is supported.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index ca011472a5d3..78d3b0365070 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -222,6 +222,7 @@ CONFIG_KEYBOARD_SPEAR=y
 CONFIG_KEYBOARD_ST_KEYSCAN=y
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_MOUSE_PS2_ELANTECH=y
+CONFIG_MOUSE_CYAPA=m
 CONFIG_MOUSE_ELAN_I2C=y
 CONFIG_INPUT_TOUCHSCREEN=y
 CONFIG_TOUCHSCREEN_ATMEL_MXT=y
-- 
2.1.4
