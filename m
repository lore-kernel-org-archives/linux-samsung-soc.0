From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 7/8] ARM: exynos_defconfig: Remove MAX77802 RTC Kconfig symbol
Date: Wed, 20 Jan 2016 14:14:47 -0300
Message-ID: <1453310088-29985-8-git-send-email-javier@osg.samsung.com>
References: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from lists.s-osg.org ([54.187.51.154]:56053 "EHLO lists.s-osg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964946AbcATRQC (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jan 2016 12:16:02 -0500
In-Reply-To: <1453310088-29985-1-git-send-email-javier@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, rtc-linux@googlegroups.com, Chanwoo Choi <cw00.choi@samsung.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, linux-samsung-soc@vger.kernel.org, Javier Martinez Canillas <javier@osg.samsung.com>

The driver has been removed so the Kconfig symbol is not valid anymore.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 arch/arm/configs/exynos_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 24dcd2bb1215..cdbe6dbc6e75 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -193,7 +193,6 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_MAX8997=y
 CONFIG_RTC_DRV_MAX77686=y
-CONFIG_RTC_DRV_MAX77802=y
 CONFIG_RTC_DRV_S5M=y
 CONFIG_RTC_DRV_S3C=y
 CONFIG_DMADEVICES=y
-- 
2.5.0
