From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH] ARM: multi_v7_defconfig: Enable UAS support for Odroid HC1
 board
Date: Tue, 03 Oct 2017 12:13:32 +0200
Message-ID: <20171003101332.32732-1-m.szyprowski@samsung.com>
References: <CGME20171003101344eucas1p25f8a9b77aea2931e022eb213c14afd27@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:53357 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbdJCKNs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 3 Oct 2017 06:13:48 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Odroid HC1 board has built-in JMicron USB to SATA bridge, which supports
UAS protocol. Enable support for it to make sure that all built-in storage
devices are available. Enable it as module to keep in line with multi_v7
policy to enable drivers as build-in only if they are critical for boot
process. On Odroid HC1 the kernel itself has to be still read from the
SD-card, so assume that modules/initrd is also accessible there.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 90f546766f38..83b4e3a5e574 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -689,6 +689,7 @@ CONFIG_USB_OHCI_EXYNOS=m
 CONFIG_USB_R8A66597_HCD=m
 CONFIG_USB_RENESAS_USBHS=m
 CONFIG_USB_STORAGE=y
+CONFIG_USB_UAS=m
 CONFIG_USB_MUSB_HDRC=m
 CONFIG_USB_MUSB_SUNXI=m
 CONFIG_USB_DWC3=y
-- 
2.14.2
