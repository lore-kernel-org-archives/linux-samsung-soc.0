From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 11/11] ARM: dts: s5p: Fix DTC unit name warnings in SMDKv210
 board
Date: Wed, 06 Apr 2016 11:00:50 +0900
Message-ID: <1459908050-16430-11-git-send-email-k.kozlowski@samsung.com>
References: <1459908050-16430-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35952 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1760224AbcDFCB7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Apr 2016 22:01:59 -0400
In-reply-to: <1459908050-16430-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>

Fix following DTC warnings in SMDKv210 board:

Warning (unit_address_vs_reg): Node /soc/fimd@f8000000/display-timings/timing@0 has a unit name, but no reg property

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes since v1:
1. Don't add unit name to memory.
2. Add Javier's tag.
---
 arch/arm/boot/dts/s5pv210-smdkv210.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/s5pv210-smdkv210.dts b/arch/arm/boot/dts/s5pv210-smdkv210.dts
index 54fcc3fc82e2..9eb6aff3e38f 100644
--- a/arch/arm/boot/dts/s5pv210-smdkv210.dts
+++ b/arch/arm/boot/dts/s5pv210-smdkv210.dts
@@ -197,7 +197,7 @@
 	display-timings {
 		native-mode = <&timing0>;
 
-		timing0: timing@0 {
+		timing0: timing {
 			/* 800x480@60Hz */
 			clock-frequency = <24373920>;
 			hactive = <800>;
-- 
2.5.0
