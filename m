From: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Subject: [RFC v2 7/7] ARM: dts: exynos4x12: add suspend OPP for DMC and leftbus for Prime
Date: Mon, 19 Dec 2016 03:16:27 +0100
Message-ID: <1482113787-28422-8-git-send-email-tjakobi@math.uni-bielefeld.de>
References: <1482113787-28422-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from smtp.math.uni-bielefeld.de ([129.70.45.10]:43835 "EHLO
        smtp.math.uni-bielefeld.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1762692AbcLSCS7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 18 Dec 2016 21:18:59 -0500
In-Reply-To: <1482113787-28422-1-git-send-email-tjakobi@math.uni-bielefeld.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-pm@vger.kernel.org, m.reichl@fivetechno.de, myungjoo.ham@gmail.com, cw00.choi@samsung.com, Tobias Jakobi <tjakobi@math.uni-bielefeld.de>

Both DMC and leftbus adjust regulator voltages (MIF and INT
respectively), which have to be in a safe range to allow the
BL0 to operate correctly.

Signed-off-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
---
 arch/arm/boot/dts/exynos4412-prime.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-prime.dtsi b/arch/arm/boot/dts/exynos4412-prime.dtsi
index 97d1b9c..18e411f 100644
--- a/arch/arm/boot/dts/exynos4412-prime.dtsi
+++ b/arch/arm/boot/dts/exynos4412-prime.dtsi
@@ -123,6 +123,7 @@
 		opp@400000000 {
 			opp-hz = /bits/ 64 <400000000>;
 			opp-microvolt = <1100000>;
+			opp-suspend;
 		};
 	};
 
@@ -145,6 +146,7 @@
 		opp@200000000 {
 			opp-hz = /bits/ 64 <200000000>;
 			opp-microvolt = <1150000>;
+			opp-suspend;
 		};
 	};
 
-- 
2.7.3
