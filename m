From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 1/2] ARM: exynos_defconfig: Enable vivid driver as a module
Date: Fri, 24 Jun 2016 09:10:12 -0400
Message-ID: <1466773813-14647-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:41542 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751317AbcFXNLT (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 24 Jun 2016 09:11:19 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Shuah Khan <shuahkh@osg.samsung.com>, linux-samsung-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Mauro Carvalho Chehab <mchehab@s-opensource.com>, Javier Martinez Canillas <javier@osg.samsung.com>

The Virtual Video Test Driver can be used to emulate video capture and
output devices so it's very useful for testing. Since is not necessary
to boot, can be enabled as module to avoid increasing the kernel size.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/configs/exynos_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index daf9762ec794..a5aa44c56bfe 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -152,6 +152,7 @@ CONFIG_VIDEO_EXYNOS4_FIMC_IS=m
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
+CONFIG_V4L_TEST_DRIVERS=y
 CONFIG_DRM=y
 CONFIG_DRM_EXYNOS=y
 CONFIG_DRM_EXYNOS_FIMD=y
@@ -263,3 +264,4 @@ CONFIG_CRYPTO_AES_ARM_BS=m
 CONFIG_CRC_CCITT=y
 CONFIG_FONTS=y
 CONFIG_FONT_7x14=y
+CONFIG_VIDEO_VIVID=m
-- 
2.5.5
