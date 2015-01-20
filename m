From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v4 4/9] ARM: dts: exynos4: add dependency between TV and LCD0
 power domains
Date: Tue, 20 Jan 2015 13:16:54 +0100
Message-ID: <1421756219-21037-5-git-send-email-m.szyprowski@samsung.com>
References: <1421756219-21037-1-git-send-email-m.szyprowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:35977 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752849AbbATMRK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Jan 2015 07:17:10 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIH006386B9CM70@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 20 Jan 2015 12:21:09 +0000 (GMT)
In-reply-to: <1421756219-21037-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Andrzej Hajda <a.hajda@samsung.com>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Javier Martinez Canillas <javier.martinez@collabora.co.uk>, jy0922.shim@samsung.com, kyungmin.park@samsung.com

TV Mixer needs both TV and LCD0 domains enabled to be fully operational.
This dependency is modelled by making TV power domains a sub-domain of
LCD0 power domain.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index d9516471c41e..a59b3fae3680 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -101,6 +101,7 @@
 		compatible = "samsung,exynos4210-pd";
 		reg = <0x10023C20 0x20>;
 		#power-domain-cells = <0>;
+		power-domains = <&pd_lcd0>;
 	};
 
 	pd_cam: cam-power-domain@10023C00 {
-- 
1.9.2
