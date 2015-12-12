From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [RESEND PATCH v5 5/8] ARM: dts: add SROM device node for exynos5
Date: Sat, 12 Dec 2015 13:13:59 +0530
Message-ID: <1449906242-20843-6-git-send-email-pankaj.dubey@samsung.com>
References: <1449906242-20843-1-git-send-email-pankaj.dubey@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:35934 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751372AbbLLHrm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 12 Dec 2015 02:47:42 -0500
In-reply-to: <1449906242-20843-1-git-send-email-pankaj.dubey@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, k.kozlowski@samsung.com, thomas.ab@samsung.com, p.fedin@samsung.com, andi.shyti@samsung.com, Pankaj Dubey <pankaj.dubey@samsung.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kukjin Kim <kgene@kernel.org>

Add SROM controller device node for exynos5.

CC: Rob Herring <robh+dt@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Ian Campbell <ijc+devicetree@hellion.org.uk>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
[k.kozlowski: fixed size of mapped SROMC memory region]
Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Signed-off-by: Kukjin Kim <kgene@kernel.org>
---
 arch/arm/boot/dts/exynos5.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 110dbd4..fb52d16 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -30,6 +30,11 @@
 		reg = <0x10000000 0x100>;
 	};
 
+	sromc@12250000 {
+		compatible = "samsung,exynos-srom";
+		reg = <0x12250000 0x14>;
+	};
+
 	combiner: interrupt-controller@10440000 {
 		compatible = "samsung,exynos4210-combiner";
 		#interrupt-cells = <2>;
-- 
1.9.1
