From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH 2/2] ARM: dts: Add JPEG codec node for exynos4412-trats2
Date: Thu, 05 Mar 2015 14:10:42 +0100
Message-ID: <1425561042-28258-2-git-send-email-j.anaszewski@samsung.com>
References: <1425561042-28258-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:38461 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755226AbbCENK7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Mar 2015 08:10:59 -0500
Received: from epcpsbgm2.samsung.com (epcpsbgm2 [203.254.230.27])
 by mailout2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NKQ0054EPYAANA0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 05 Mar 2015 22:10:58 +0900 (KST)
In-reply-to: <1425561042-28258-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: s.nawrocki@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Kukjin Kim <kgene@kernel.org>

Enable support for JPEG codec on exynos4412-trats2 board.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/boot/dts/exynos4412-trats2.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-trats2.dts b/arch/arm/boot/dts/exynos4412-trats2.dts
index 173ffa4..4d6ce10 100644
--- a/arch/arm/boot/dts/exynos4412-trats2.dts
+++ b/arch/arm/boot/dts/exynos4412-trats2.dts
@@ -944,6 +944,10 @@
 	};
 };
 
+&jpeg {
+	status = "okay";
+};
+
 &pmu_system_controller {
 	assigned-clocks = <&pmu_system_controller 0>;
 	assigned-clock-parents =  <&clock CLK_XUSBXTI>;
-- 
1.7.9.5
