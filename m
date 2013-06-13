From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: dts: Add more opp levels in exynos5440
Date: Thu, 13 Jun 2013 21:32:45 +0900
Message-ID: <150f01ce6832$1b7db600$52792200$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54582 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756914Ab3FMMcr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 13 Jun 2013 08:32:47 -0400
Received: from epcpsbgr5.samsung.com
 (u145.gpu120.samsung.co.kr [203.254.230.145])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MOC00JM106MP920@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 13 Jun 2013 21:32:46 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>

From: Amit Daniel Kachhap <amit.daniel@samsung.com>

This patch updates cpu frequency level from 1500 to 800MHZ in steps
of 100MHZ. The corresponding voltage(in uV) is also added.

Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/boot/dts/exynos5440.dtsi |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5440.dtsi b/arch/arm/boot/dts/exynos5440.dtsi
index e8f5745..80ed5d9 100644
--- a/arch/arm/boot/dts/exynos5440.dtsi
+++ b/arch/arm/boot/dts/exynos5440.dtsi
@@ -79,8 +79,13 @@
 		interrupts = <0 57 0>;
 		operating-points = <
 				/* KHz	  uV */
+				1500000 1100000
+				1400000 1075000
+				1300000 1050000
 				1200000 1025000
+				1100000 1000000
 				1000000 975000
+				900000  950000
 				800000  925000
 		>;
 	};
-- 
1.7.10.4
