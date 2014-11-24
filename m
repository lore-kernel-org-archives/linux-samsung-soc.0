From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH RESEND 4/7] ARM: dts: exynos4: add dependency between TV and
 LCD0 power domains
Date: Mon, 24 Nov 2014 08:30:53 +0100
Message-ID: <1416814256-24288-5-git-send-email-a.hajda@samsung.com>
References: <1416814256-24288-1-git-send-email-a.hajda@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:8934 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752535AbaKXHbp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 24 Nov 2014 02:31:45 -0500
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NFJ00K1491NIU80@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 24 Nov 2014 07:34:35 +0000 (GMT)
In-reply-to: <1416814256-24288-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, Inki Dae <inki.dae@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Tobias Jakobi <Liquid.Acid@gmx.net>, Daniel Drake <drake@endlessm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>

From: Marek Szyprowski <m.szyprowski@samsung.com>

TV Mixer needs both TV and LCD0 domains enabled to be fully operational.
This dependency is modelled by making TV power domains a sub-domain of
LCD0 power domain.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
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
