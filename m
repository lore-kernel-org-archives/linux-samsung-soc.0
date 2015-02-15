From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH] ARM: exynos_defconfig: Enable Marvell WiFi-Ex support
Date: Sun, 15 Feb 2015 10:28:52 +0100
Message-ID: <1423992532-29228-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:55998 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751013AbbBOJ3G (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 15 Feb 2015 04:29:06 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Exynos5420 Peach Pit and Exynos5800 Peach Pi boards have a MMC/SDIO
Marvell WiFi-Ex chip. This patch enables wireless support and the
mwifiex driver.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/configs/exynos_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 70e5d0bdb4e4..dcef516bcd0d 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -34,6 +34,10 @@ CONFIG_PACKET=y
 CONFIG_UNIX=y
 CONFIG_NET_KEY=y
 CONFIG_INET=y
+CONFIG_WIRELESS=y
+CONFIG_CFG80211=y
+CONFIG_MWIFIEX=y
+CONFIG_MWIFIEX_SDIO=y
 CONFIG_RFKILL_REGULATOR=y
 CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
 CONFIG_DEVTMPFS=y
-- 
2.1.3
