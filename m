From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable CROS_EC_PROTO for ChromeOS EC mfd driver
Date: Tue, 18 Aug 2015 09:01:21 +0200
Message-ID: <1439881281-22054-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:58205 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751394AbbHRHCM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Aug 2015 03:02:12 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Doug Anderson <dianders@chromium.org>, Olof Johansson <olof@lixom.net>, Gwendal Grignou <gwendal@chromium.org>, Sjoerd Simons <sjoerd.simons@collabora.co.uk>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

The ChromeOS mfd driver (MFD_CROS_EC) select the CROS_EC_PROTO config
symbol because the driver uses some communication helper functions in
drivers/platform/chrome/cros_ec_proto.c but other drivers depends on
CROS_EC_PROTO instead. Mixing select and depends can lead to circular
Kconfig dependencies so the MFD_CROS_EC select should be changed to a
depends on CROS_EC_PROTO instead.

But doing so will break git bisect-ability since MFD_CROS_EC will not
be enabled anymore unless the default configs first explicitly enable
the CROS_EC_PROTO dependency.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm/configs/exynos_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 1ff2bfa2e183..537391ea37ac 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -177,6 +177,7 @@ CONFIG_DMADEVICES=y
 CONFIG_PL330_DMA=y
 CONFIG_CHROME_PLATFORMS=y
 CONFIG_CROS_EC_CHARDEV=y
+CONFIG_CROS_EC_PROTO=y
 CONFIG_COMMON_CLK_MAX77686=y
 CONFIG_COMMON_CLK_MAX77802=y
 CONFIG_COMMON_CLK_S2MPS11=y
-- 
2.4.3
