From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v2] ARM: multi_v7_defconfig: Enable DWC2 USB driver and USB
 ethernet gadget
Date: Wed, 19 Aug 2015 10:19:37 +0200
Message-ID: <1439972377-22683-1-git-send-email-m.szyprowski@samsung.com>
References: <55D30313.7080107@osg.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:28770 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753060AbbHSITp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 19 Aug 2015 04:19:45 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NTB00G7SLSUFP20@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 19 Aug 2015 09:19:42 +0100 (BST)
In-reply-to: <55D30313.7080107@osg.samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier@osg.samsung.com>

DWC2 (s3c-hsotg) hardware module is available on many Exynos based boards,
so enable DWC2 driver as well as the most common USB Ethernet gadget.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
Changes since v1: build DWC2 and USB gadget as modules
---
 arch/arm/configs/multi_v7_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index b2facab..d15f719 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -506,6 +506,7 @@ CONFIG_USB_R8A66597_HCD=m
 CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_STORAGE=y
 CONFIG_USB_DWC3=y
+CONFIG_USB_DWC2=m
 CONFIG_USB_CHIPIDEA=y
 CONFIG_USB_CHIPIDEA_HOST=y
 CONFIG_AB8500_USB=y
@@ -517,6 +518,7 @@ CONFIG_USB_MXS_PHY=y
 CONFIG_USB_RCAR_PHY=m
 CONFIG_USB_GADGET=y
 CONFIG_USB_RENESAS_USBHS_UDC=m
+CONFIG_USB_ETH=m
 CONFIG_MMC=y
 CONFIG_MMC_BLOCK_MINORS=16
 CONFIG_MMC_ARMMMCI=y
-- 
1.9.2
