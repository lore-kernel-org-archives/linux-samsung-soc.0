From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 3/3] ARM: exynos_defconfig: Enable UAS support for Odroid
 HC1 board
Date: Fri, 29 Sep 2017 13:33:03 +0200
Message-ID: <1506684783-9722-4-git-send-email-m.szyprowski@samsung.com>
References: <1506684783-9722-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170929113314eucas1p2742039d35eb39f6d4749fe09988373d9@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:32914 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751830AbdI2LdS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Sep 2017 07:33:18 -0400
In-reply-to: <1506684783-9722-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Odroid HC1 board has build-in JMicron USB to SATA bridge, which supports
UAS protocol. Enable support for it to make sure that all build-in devices
are available.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/configs/exynos_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 8c2a2619971b..f1d7834990ec 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -244,7 +244,7 @@ CONFIG_USB_STORAGE_ONETOUCH=m
 CONFIG_USB_STORAGE_KARMA=m
 CONFIG_USB_STORAGE_CYPRESS_ATACB=m
 CONFIG_USB_STORAGE_ENE_UB6250=m
-CONFIG_USB_UAS=m
+CONFIG_USB_UAS=y
 CONFIG_USB_DWC3=y
 CONFIG_USB_DWC2=y
 CONFIG_USB_HSIC_USB3503=y
-- 
1.9.1
