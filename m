From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 1/2] ARM: exynos_defconfig: Enable display on Trats2 board
Date: Fri, 22 May 2015 09:48:37 +0900
Message-ID: <1432255718-11695-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35329 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753397AbbEVAsy (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 20:48:54 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Enable the Exynos DSI and S6E8AA0 panel for full X11 display on Trats2.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index d034c96c039b..e7ccec487422 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -135,9 +135,11 @@ CONFIG_DRM_BRIDGE=y
 CONFIG_DRM_PTN3460=y
 CONFIG_DRM_PS8622=y
 CONFIG_DRM_EXYNOS=y
+CONFIG_DRM_EXYNOS_DSI=y
 CONFIG_DRM_EXYNOS_FIMD=y
 CONFIG_DRM_EXYNOS_DP=y
 CONFIG_DRM_PANEL=y
+CONFIG_DRM_PANEL_S6E8AA0=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_FB=y
 CONFIG_FB_MODE_HELPERS=y
-- 
1.9.1
