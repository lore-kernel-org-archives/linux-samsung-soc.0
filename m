From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 3/7] ARM: dts: Add FIMD output property for peach_pit
Date: Fri, 27 Jun 2014 15:42:22 +0530
Message-ID: <1403863946-15492-4-git-send-email-ajaykumar.rs@samsung.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:33913 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753173AbaF0KPN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 06:15:13 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7T009IDOHCFQ50@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jun 2014 19:15:12 +0900 (KST)
In-reply-to: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Set FIMD output type for peach_pit as DP.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 1c5b8f9..164f523 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -255,6 +255,7 @@
 &fimd {
 	status = "okay";
 	samsung,invert-vclk;
+	samsung,output-type = <2>;
 };
 
 &dp {
-- 
1.7.9.5
