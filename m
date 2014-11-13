From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 4/7] ARM: dts: exynos4: add dependency between TV and LCD0
 power domains
Date: Thu, 13 Nov 2014 17:23:02 +0100
Message-ID: <1415895785-26892-5-git-send-email-a.hajda@samsung.com>
References: <1415895785-26892-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:38316 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933482AbaKMQX7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Nov 2014 11:23:59 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NEZ00MZZKCJ6X80@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Nov 2014 16:26:43 +0000 (GMT)
In-reply-to: <1415895785-26892-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

TV Mixer needs both TV and LCD0 domains enabled to be fully operational.
This dependency is modelled by making TV power domains a sub-domain of
LCD0 power domain.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 4ed5868..c728004 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -97,6 +97,7 @@
 	pd_tv: tv-power-domain@10023C20 {
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C20 0x20>;
+		power-domain-master = <&pd_lcd0>;
 	};
 
 	pd_cam: cam-power-domain@10023C00 {
-- 
1.9.1
