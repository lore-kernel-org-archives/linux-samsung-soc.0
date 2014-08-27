From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH v3 3/3] ARM: multi_v7_defconfig: Enable Atmel maXTouch support
Date: Wed, 27 Aug 2014 16:24:47 +0200
Message-ID: <1409149487-23582-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1409149487-23582-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:47636 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934614AbaH0OZN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Aug 2014 10:25:13 -0400
In-Reply-To: <1409149487-23582-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, afaerber@suse.de, Nick Dyer <nick.dyer@itdev.co.uk>, Yufeng Shen <miletus@chromium.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Some boards with multi platform support (e.g: Exynos based
Chromebooks) have an Atmel trackpad so enable support for
as a module will make easier for users.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 7cfa5fa..ac5c10c 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -167,6 +167,7 @@ CONFIG_KEYBOARD_ST_KEYSCAN=y
 CONFIG_KEYBOARD_CROS_EC=y
 CONFIG_MOUSE_PS2_ELANTECH=y
 CONFIG_INPUT_TOUCHSCREEN=y
+CONFIG_TOUCHSCREEN_ATMEL_MXT=m
 CONFIG_TOUCHSCREEN_STMPE=y
 CONFIG_INPUT_MISC=y
 CONFIG_INPUT_MPU3050=y
-- 
2.0.1
