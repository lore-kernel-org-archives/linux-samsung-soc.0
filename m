From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable USB Video Class support
Date: Mon,  7 Sep 2015 23:45:23 +0200
Message-ID: <1441662323-15468-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:34773 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750977AbbIGVph (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 7 Sep 2015 17:45:37 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Kukjin Kim <kgene@kernel.org>, Thierry Reding <treding@nvidia.com>, Anand Moon <linux.amoon@gmail.com>, Russell King <linux@arm.linux.org.uk>, linux-samsung-soc@vger.kernel.org, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Lukasz Majewski <l.majewski@samsung.com>, linux-arm-kernel@lists.infradead.org

The Exynos5420 Peach Pit and Exynos5800 Peach Pi boards have a built-in
Silicon Motion USB UVC WebCam. Enable support for the USB Video Class
driver and its needed media Kconfig symbols so the camera is supported.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm/configs/exynos_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 1ff2bfa2e183..62f677f76a0b 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -126,6 +126,10 @@ CONFIG_REGULATOR_S2MPA01=y
 CONFIG_REGULATOR_S2MPS11=y
 CONFIG_REGULATOR_S5M8767=y
 CONFIG_REGULATOR_TPS65090=y
+CONFIG_MEDIA_SUPPORT=y
+CONFIG_MEDIA_CAMERA_SUPPORT=y
+CONFIG_MEDIA_USB_SUPPORT=y
+CONFIG_USB_VIDEO_CLASS=y
 CONFIG_DRM=y
 CONFIG_DRM_NXP_PTN3460=y
 CONFIG_DRM_PARADE_PS8622=y
-- 
2.4.3
