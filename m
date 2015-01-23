From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] ARM: dts: exynos3250-rinato: add support for JPEG codec
Date: Fri, 23 Jan 2015 16:39:57 +0100
Message-ID: <1422027597-12984-2-git-send-email-j.anaszewski@samsung.com>
References: <1422027597-12984-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:61227 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750827AbbAWPkM (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jan 2015 10:40:12 -0500
Received: from epcpsbgm1.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0NIM00CQ6ZIY4PC0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 24 Jan 2015 00:40:10 +0900 (KST)
In-reply-to: <1422027597-12984-1-git-send-email-j.anaszewski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kyungmin.park@samsung.com, Jacek Anaszewski <j.anaszewski@samsung.com>, Kukjin Kim <kgene@kernel.org>

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
Cc: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/boot/dts/exynos3250-rinato.dts |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
index 80aa8b4..9cfc9ec 100644
--- a/arch/arm/boot/dts/exynos3250-rinato.dts
+++ b/arch/arm/boot/dts/exynos3250-rinato.dts
@@ -480,6 +480,10 @@
 	status = "okay";
 };
 
+&jpeg {
+	status = "okay";
+};
+
 &mshc_0 {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
1.7.9.5
