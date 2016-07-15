From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] ARM: exynos_defconfig: Enable bus frequency scaling with
 DEVFREQ/DEVFREQ-Event
Date: Fri, 15 Jul 2016 10:33:46 +0900
Message-ID: <1468546426-4482-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:51186 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751279AbcGOBdx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jul 2016 21:33:53 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux@armlinux.org.uk, kgene@kernel.org, k.kozlowski@samsung.com
Cc: javier@osg.samsung.com, linux.amoon@gmail.com, treding@nvidia.com, m.szyprowski@samsung.com, cw00.choi@samsung.com, b.zolnierkie@samsung.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This patch enables the bus frequency scaling driver with DEVFREQ and
DEVFREQ-Event framework. This patches already was merged for Odroid-U3/XU3
,Trats2 and Rinato/Monk boards.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index a5aa44c56bfe..37052b115a40 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -219,6 +219,16 @@ CONFIG_CROS_EC_CHARDEV=y
 CONFIG_COMMON_CLK_MAX77686=y
 CONFIG_COMMON_CLK_MAX77802=y
 CONFIG_COMMON_CLK_S2MPS11=y
+CONFIG_PM_DEVFREQ=y
+CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND=y
+CONFIG_DEVFREQ_GOV_PERFORMANCE=y
+CONFIG_DEVFREQ_GOV_POWERSAVE=y
+CONFIG_DEVFREQ_GOV_USERSPACE=y
+CONFIG_DEVFREQ_GOV_PASSIVE=y
+CONFIG_ARM_EXYNOS_BUS_DEVFREQ=y
+CONFIG_PM_DEVFREQ_EVENT=y
+CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=y
+CONFIG_DEVFREQ_EVENT_EXYNOS_PPMU=y
 CONFIG_EXTCON=y
 CONFIG_EXTCON_MAX14577=y
 CONFIG_EXTCON_MAX77693=y
-- 
1.9.1
