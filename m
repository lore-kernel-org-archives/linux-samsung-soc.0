From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 4/7] ARM: dts: Add FIMD output property for peach_pi
Date: Fri, 27 Jun 2014 15:42:23 +0530
Message-ID: <1403863946-15492-5-git-send-email-ajaykumar.rs@samsung.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:29317 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753173AbaF0KPS (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 06:15:18 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7T00JVPOHGWM10@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jun 2014 19:15:16 +0900 (KST)
In-reply-to: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Set FIMD output type for peach_pi as DP.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index f3af207..21e2de2 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -205,6 +205,7 @@
 &fimd {
 	status = "okay";
 	samsung,invert-vclk;
+	samsung,output-type = <2>;
 };
 
 &hsi2c_9 {
-- 
1.7.9.5
