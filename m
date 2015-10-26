From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 3/7] ARM: exynos_defconfig: enable Exynos DRM Mixer driver
Date: Mon, 26 Oct 2015 13:03:41 +0100
Message-ID: <1445861025-23266-4-git-send-email-a.hajda@samsung.com>
References: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:40362 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753488AbbJZMEF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 Oct 2015 08:04:05 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NWT00D7XTIOZM20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 26 Oct 2015 12:04:00 +0000 (GMT)
In-reply-to: <1445861025-23266-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, "open list:DRM DRIVERS FOR EXYNOS" <dri-devel@lists.freedesktop.org>, "moderated list:ARM/SAMSUNG EXYNOS
	ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>

Mixer driver is selected by CONFIG_DRM_EXYNOS_HDMI option. Since Exynos5433
HDMI does not require Mixer. There will be separate options to select Mixer
and HDMI. Adding new option to defconfig before Kconfig will allow to keep
bisectability.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 1ff2bfa..af79a21 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -132,6 +132,7 @@ CONFIG_DRM_PARADE_PS8622=y
 CONFIG_DRM_EXYNOS=y
 CONFIG_DRM_EXYNOS_FIMD=y
 CONFIG_DRM_EXYNOS_DSI=y
+CONFIG_DRM_EXYNOS_MIXER=y
 CONFIG_DRM_EXYNOS_HDMI=y
 CONFIG_DRM_PANEL_SIMPLE=y
 CONFIG_DRM_PANEL_SAMSUNG_S6E8AA0=y
-- 
1.9.1
