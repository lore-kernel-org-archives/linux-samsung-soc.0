From: Ajay Kumar <ajaykumar.rs@samsung.com>
Subject: [PATCH V3 7/7] ARM: dts: Add FIMD output property for arndale
Date: Fri, 27 Jun 2014 15:42:26 +0530
Message-ID: <1403863946-15492-8-git-send-email-ajaykumar.rs@samsung.com>
References: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:58684 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753137AbaF0KP6 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 27 Jun 2014 06:15:58 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N7T003ALOHTFMC0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Fri, 27 Jun 2014 19:15:29 +0900 (KST)
In-reply-to: <1403863946-15492-1-git-send-email-ajaykumar.rs@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: inki.dae@samsung.com, seanpaul@google.com, ajaynumb@gmail.com, jg1.han@samsung.com, joshi@samsung.com, prashanth.g@samsung.com, Ajay Kumar <ajaykumar.rs@samsung.com>

Set FIMD output type for arndale as DP.

Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts |    1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index d0de1f5..e803183 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -540,6 +540,7 @@
 
 	fimd: fimd@14400000 {
 		status = "okay";
+		samsung,output-type = <2>;
 		display-timings {
 			native-mode = <&timing0>;
 			timing0: timing@0 {
-- 
1.7.9.5
