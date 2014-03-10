From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH v2 3/3] Documentation: DT: add new entry for Samsung GH7 SoC and SSDK board
Date: Tue, 11 Mar 2014 07:51:19 +0900
Message-ID: <1394491879-5320-4-git-send-email-kgene.kim@samsung.com>
References: <1394491879-5320-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f44.google.com ([209.85.160.44]:51550 "EHLO
	mail-pb0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752439AbaCJWwA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 10 Mar 2014 18:52:00 -0400
Received: by mail-pb0-f44.google.com with SMTP id rp16so7897732pbb.17
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Mar 2014 15:52:00 -0700 (PDT)
In-Reply-To: <1394491879-5320-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
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
