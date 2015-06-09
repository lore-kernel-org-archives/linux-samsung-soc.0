From: Anand Moon <linux.amoon@gmail.com>
Subject: [PATCHv2] ARM: exynos_defconfig: Enable CONFIG_SND_SOC_ODROIDX2 for Odroid-XU3
Date: Tue,  9 Jun 2015 13:37:59 +0930
Message-ID: <1433822879-3908-1-git-send-email-linux.amoon@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f67.google.com ([209.85.220.67]:35028 "EHLO
	mail-pa0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751344AbbFIEIK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 9 Jun 2015 00:08:10 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, Lukasz Majewski <l.majewski@samsung.com>, Anand Moon <linux.amoon@gmail.com>, Andreas Faerber <afaerber@suse.de>, Sachin Kamat <sachin.kamat@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

Enable CONFIG_SND_SOC_ODROIDX2 and CONFIG_SND_SIMPLE_CARD to enable
sound on Odroid-XU3 board using the max98090 audio codec.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
Reviewed-by: Lukasz Majewski <l.majewski@samsung.com>
---
Changes v2: Fixed the commit log.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 arch/arm/configs/exynos_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/exynos_defconfig b/arch/arm/configs/exynos_defconfig
index 9504e77..1b7253b 100644
--- a/arch/arm/configs/exynos_defconfig
+++ b/arch/arm/configs/exynos_defconfig
@@ -144,6 +144,8 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_SOC_SAMSUNG=y
 CONFIG_SND_SOC_SNOW=y
+CONFIG_SND_SOC_ODROIDX2=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_ANNOUNCE_NEW_DEVICES=y
 CONFIG_USB_XHCI_HCD=y
-- 
2.4.3
