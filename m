From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 2/2] ARM: multi_v7_defconfig: Enable exynos-gsc driver as module
Date: Wed,  5 Oct 2016 11:24:29 -0300
Message-ID: <1475677469-1524-2-git-send-email-javier@osg.samsung.com>
References: <1475677469-1524-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ec2-52-27-115-49.us-west-2.compute.amazonaws.com ([52.27.115.49]:52746
        "EHLO s-opensource.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752652AbcJEOYq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Oct 2016 10:24:46 -0400
In-Reply-To: <1475677469-1524-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org, Shuah Khan <shuahkh@osg.samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-kernel@lists.infradead.org, Javier Martinez Canillas <javier@osg.samsung.com>

Exynos5 SoCs have a General SCALER (GSCALER) IP block that can be used
to do video streams scaling and color space conversions by hardware.
Enable support for its driver as a module so the GSCALER can be tested.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 437d0740dec6..bd2f06d334e7 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -561,6 +561,7 @@ CONFIG_VIDEO_EXYNOS4_FIMC_IS=m
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_SAMSUNG_S5P_JPEG=m
 CONFIG_VIDEO_SAMSUNG_S5P_MFC=m
+CONFIG_VIDEO_SAMSUNG_EXYNOS_GSC=m
 CONFIG_VIDEO_STI_BDISP=m
 CONFIG_VIDEO_RENESAS_JPU=m
 CONFIG_VIDEO_RENESAS_VSP1=m
-- 
2.7.4
