From: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
Subject: [PATCH 3/9] ARM: multi_v7_defconfig: Enable Exynos USB PHY drivers support
Date: Thu, 14 May 2015 17:40:10 +0200
Message-ID: <1431618016-2087-4-git-send-email-javier.martinez@collabora.co.uk>
References: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from bhuna.collabora.co.uk ([93.93.135.160]:47148 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964872AbbENPkj (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 May 2015 11:40:39 -0400
In-Reply-To: <1431618016-2087-1-git-send-email-javier.martinez@collabora.co.uk>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: arm@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kevin Hilman <khilman@linaro.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Doug Anderson <dianders@chromium.org>, Kukjin Kim <kgene@kernel.org>, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier.martinez@collabora.co.uk>

Enable the needed kconfig options to have support for Samsung USB 2.0
and USB 3.0 PHY drivers to support the USB PHYs found on Exynos SoCs.

Signed-off-by: Javier Martinez Canillas <javier.martinez@collabora.co.uk>
---
 arch/arm/configs/multi_v7_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 080120fe5580..e81125364ae2 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -578,6 +578,11 @@ CONFIG_PHY_STIH41X_USB=y
 CONFIG_PHY_STIH407_USB=y
 CONFIG_PHY_SUN4I_USB=y
 CONFIG_PHY_SUN9I_USB=y
+CONFIG_PHY_SAMSUNG_USB2=m
+CONFIG_PHY_EXYNOS4210_USB2=y
+CONFIG_PHY_EXYNOS4X12_USB2=y
+CONFIG_PHY_EXYNOS5250_USB2=y
+CONFIG_PHY_EXYNOS5_USBDRD=y
 CONFIG_EXT4_FS=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_MSDOS_FS=y
-- 
2.1.4
