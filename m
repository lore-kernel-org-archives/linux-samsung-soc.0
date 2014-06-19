From: Jaewon Kim <jaewon02.kim@samsung.com>
Subject: [PATCH v2] ARM: dts: exynos4: fix pwm-cells in pwm node
Date: Thu, 19 Jun 2014 11:03:34 +0900
Message-ID: <1403143414-6242-1-git-send-email-jaewon02.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:64425 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752726AbaFSCDx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Jun 2014 22:03:53 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7E009QC8EF1T40@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 19 Jun 2014 11:03:51 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Tomasz Figa <t.figa@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Sachin Kamat <sachin.kamat@samsung.com>, Jaewon Kim <jaewon02.kim@samsung.com>

pwm-cells should be 3. Third cell is optional PWM flags. And This flag
supported by this binding is PWM_POLARITY_INVERTED.

Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
---

Changes in v2:
 - Remove unnecessary handle.

 arch/arm/boot/dts/exynos4.dtsi |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index b8ece4b..e118356 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -554,7 +554,7 @@
 		interrupts = <0 37 0>, <0 38 0>, <0 39 0>, <0 40 0>, <0 41 0>;
 		clocks = <&clock CLK_PWM>;
 		clock-names = "timers";
-		#pwm-cells = <2>;
+		#pwm-cells = <3>;
 		status = "disabled";
 	};
 
-- 
1.7.9.5
