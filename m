From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v3 3/3] Documentation: DT: add new entry for Samsung GH7 SoC and SSDK board
Date: Tue, 18 Mar 2014 07:14:37 +0900
Message-ID: <1395094477-8921-4-git-send-email-kgene.kim@samsung.com>
References: <1395094477-8921-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f171.google.com ([209.85.192.171]:34652 "EHLO
	mail-pd0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752577AbaCQWPL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 17 Mar 2014 18:15:11 -0400
In-Reply-To: <1395094477-8921-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Thomas Abraham <thomas.ab@samsung.com>, Ilho Lee <ilho215.lee@samsung.com>, Catalin Marinas <catalin.marinas@arm.com>, Kukjin Kim <kgene.kim@samsung.com>

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
Reviewed-by: Thomas Abraham <thomas.ab@samsung.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
---
 Documentation/devicetree/bindings/arm/samsung-boards.txt | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung-boards.txt
index 2168ed3..d6b5493 100644
--- a/Documentation/devicetree/bindings/arm/samsung-boards.txt
+++ b/Documentation/devicetree/bindings/arm/samsung-boards.txt
@@ -16,3 +16,12 @@ Optional:
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
-- 
1.8.2.1.339.g52a3e01
