From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH 2/2] Arm: socfpga: pl330: Add #dma-cells for generic dma
 binding support
Date: Mon, 04 Mar 2013 11:04:28 +0530
Message-ID: <1362375268-29405-2-git-send-email-padma.v@samsung.com>
References: <1362375268-29405-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:20957 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751101Ab3CDFd7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 4 Mar 2013 00:33:59 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MJ400ELAFG7AG10@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 14:33:58 +0900 (KST)
Received: from padma-linuxpc.sisodomain.com ([107.108.83.35])
 by mmp1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0MJ400185FFP2X80@mmp1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 04 Mar 2013 14:33:58 +0900 (KST)
In-reply-to: <1362375268-29405-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, padma.kvr@gmail.com, padma.v@samsung.com
Cc: sbkim73@samsung.com, broonie@opensource.wolfsonmicro.com, kgene.kim@samsung.com, jassisinghbrar@gmail.com, arnd@arndb.de, vinod.koul@intel.com, boojin.kim@samsung.com, robherring2@gmail.com, dinguyen@altera.com

This patch adds #dma-cells property to PL330 DMA controller nodes for
supporting generic dma dt bindings on SOCFPGA platform. #dma-channels
and #dma-requests are not required now but added in advance.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
---

Based on Torvalds tree

 arch/arm/boot/dts/socfpga.dtsi |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/socfpga.dtsi b/arch/arm/boot/dts/socfpga.dtsi
index 936d230..7e8769b 100644
--- a/arch/arm/boot/dts/socfpga.dtsi
+++ b/arch/arm/boot/dts/socfpga.dtsi
@@ -75,6 +75,9 @@
 				compatible = "arm,pl330", "arm,primecell";
 				reg = <0xffe01000 0x1000>;
 				interrupts = <0 180 4>;
+				#dma-cells = <1>;
+				#dma-channels = <8>;
+				#dma-requests = <32>;
 			};
 		};
 
-- 
1.7.4.4
