From: Alexander Graf <agraf@suse.de>
Subject: [PATCH 2/3] ARM: EXYNOS5250: dts: Add architected timer nodes
Date: Thu, 14 Mar 2013 01:59:01 +0100
Message-ID: <1363222742-15220-3-git-send-email-agraf@suse.de>
References: <1363222742-15220-1-git-send-email-agraf@suse.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40500 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756546Ab3CNA7H (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 13 Mar 2013 20:59:07 -0400
In-Reply-To: <1363222742-15220-1-git-send-email-agraf@suse.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, Kukjin Kim <kgene.kim@samsung.com>

The exynos 5250 SoC supports A15 style architected timers. Indicate
this through the device tree.

This is required by KVM.

Signed-off-by: Alexander Graf <agraf@suse.de>
---
 arch/arm/boot/dts/exynos5250.dtsi |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 768cb42..9fb4a38 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -57,6 +57,14 @@
 		interrupts = <1 9 0xf04>;
 	};
 
+	timer {
+                compatible = "arm,armv7-timer";
+                interrupts = <1 13 0xf08>,
+                             <1 14 0xf08>,
+                             <1 11 0xf08>,
+                             <1 10 0xf08>;
+        };
+
 	combiner:interrupt-controller@10440000 {
 		compatible = "samsung,exynos4210-combiner";
 		#interrupt-cells = <2>;
-- 
1.7.10.4
