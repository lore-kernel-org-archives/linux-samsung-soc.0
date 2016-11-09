From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/2] exynos-gsc: Enable driver on ARCH_EXYNOS
Date: Wed, 09 Nov 2016 15:29:37 +0100
Message-ID: <1478701778-29452-2-git-send-email-m.szyprowski@samsung.com>
References: <1478701778-29452-1-git-send-email-m.szyprowski@samsung.com>
 <CGME20161109142950eucas1p28aeab32587655ee249c1eefefcbb408d@eucas1p2.samsung.com>
Return-path: <linux-media-owner@vger.kernel.org>
In-reply-to: <1478701778-29452-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-media-owner@vger.kernel.org
To: linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This driver can be also used on Exynos5433, which is ARM64-based
platform, which selects only ARCH_EXYNOS symbol.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 drivers/media/platform/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 754edbf1..90ae790 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -266,7 +266,7 @@ config VIDEO_MX2_EMMAPRP
 config VIDEO_SAMSUNG_EXYNOS_GSC
 	tristate "Samsung Exynos G-Scaler driver"
 	depends on VIDEO_DEV && VIDEO_V4L2
-	depends on ARCH_EXYNOS5 || COMPILE_TEST
+	depends on ARCH_EXYNOS || COMPILE_TEST
 	depends on HAS_DMA
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_MEM2MEM_DEV
-- 
1.9.1
