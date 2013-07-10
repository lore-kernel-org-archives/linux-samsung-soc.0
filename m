From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 0/2] Move comon DMA nodes to exynos5.dtsi and
Date: Wed, 10 Jul 2013 17:44:07 +0530
Message-ID: <1373458449-19039-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:29198 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753682Ab3GJMIz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 10 Jul 2013 08:08:55 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MPP00LVYZ2JLHH0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 10 Jul 2013 21:08:53 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com, dianders@chromium.org, abrestic@chromium.org, vinod.koul@intel.com

Exynos5250 and Exynos5420 has 4 DMA controllers in common. So this patch
set moved the common nodes to exynos.dtsi keeping the clk info seperate
for both the platforms. Exynos5420 has a separate DMA controller for audio
IPs. So this patch set also adds the ADMA node on Exynos5420.

Padmavathi Venna (2):
  ARM: dts: Move the common DMA controller nodes to exynos5.dtsi
  ARM: dts: Add DMA controller node info on Exynos5420.

 arch/arm/boot/dts/exynos5.dtsi    |   44 +++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi |   30 -------------------------
 arch/arm/boot/dts/exynos5420.dtsi |   33 +++++++++++++++++++++++++++
 3 files changed, 77 insertions(+), 30 deletions(-)

-- 
1.7.4.4
