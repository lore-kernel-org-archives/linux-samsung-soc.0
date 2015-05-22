From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 2/2] ARM: multi_v7_defconfig: Enable display on Trats2 board
Date: Fri, 22 May 2015 09:48:38 +0900
Message-ID: <1432255718-11695-2-git-send-email-k.kozlowski@samsung.com>
References: <1432255718-11695-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:38240 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755640AbbEVAs5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 21 May 2015 20:48:57 -0400
In-reply-to: <1432255718-11695-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Kukjin Kim <kgene@kernel.org>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Enable the Exynos DSI and S6E8AA0 panel for full X11 display on Trats2.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 0848337a2a01..e9785020aab1 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -413,10 +413,12 @@ CONFIG_DRM=y
 CONFIG_DRM_PTN3460=m
 CONFIG_DRM_PS8622=m
 CONFIG_DRM_EXYNOS=m
+CONFIG_DRM_EXYNOS_DSI=y
 CONFIG_DRM_EXYNOS_FIMD=y
 CONFIG_DRM_EXYNOS_HDMI=y
 CONFIG_DRM_RCAR_DU=m
 CONFIG_DRM_TEGRA=y
+CONFIG_DRM_PANEL_S6E8AA0=m
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_FB_ARMCLCD=y
 CONFIG_FB_WM8505=y
-- 
1.9.1
