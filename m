From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/3] Documentation: DT: add new entry for Samsung GH7 SoC and
 SSDK board
Date: Tue, 11 Feb 2014 11:59:43 +0530
Message-ID: <1392100183-30930-4-git-send-email-kgene.kim@samsung.com>
References: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:60868 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750769AbaBKG2S (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Feb 2014 01:28:18 -0500
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N0T008BIJB58TE0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 11 Feb 2014 15:28:17 +0900 (KST)
In-reply-to: <1392100183-30930-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ilho Lee <ilho215.lee@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 Documentation/devicetree/bindings/arm/samsung-boards.txt |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung-boards.txt
index 2168ed3..9284db3 100644
--- a/Documentation/devicetree/bindings/arm/samsung-boards.txt
+++ b/Documentation/devicetree/bindings/arm/samsung-boards.txt
@@ -16,3 +16,13 @@ Optional:
 		compatible = "samsung,secure-firmware";
 		reg = <0x0203F000 0x1000>;
 	};
+
+* Samsung's GH7 based SSDK-GH7 evaluation board
+
+SSDK-GH7 evaluation board is based on Samsung's GH7 SoC which has ARMv8 cores.
+
+Required root node properties:
+    - compatible = should be one or more of the following.
+        (a) "samsung,ssdk-gh7" - for Samsung's SSDK-GH7 eval board.
+        (b) "samsung,gh7"  - for boards based on GH7 SoC.
+
-- 
1.7.10.4
