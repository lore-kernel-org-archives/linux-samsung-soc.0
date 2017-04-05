From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 2/9] dt-bindings: exynos5433-decon: fix interrupts bindings
Date: Wed, 05 Apr 2017 09:28:30 +0200
Message-ID: <1491377317-8042-3-git-send-email-a.hajda@samsung.com>
References: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
 <CGME20170405072842eucas1p2b7cc4f68637cd1c1da4d64ce774194d5@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:14477 "EHLO
        mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753274AbdDEH2s (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 03:28:48 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0ONX00I11E3WNN20@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 05 Apr 2017 08:28:44 +0100 (BST)
In-reply-to: <1491377317-8042-1-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

DECON requires different interrupts depending on mode of work, which
depends on panel it is connected to.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 .../devicetree/bindings/display/exynos/exynos5433-decon.txt  | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt b/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
index c9fd7b3..ba6be99 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos5433-decon.txt
@@ -8,12 +8,12 @@ Required properties:
 - compatible: value should be one of:
 	"samsung,exynos5433-decon", "samsung,exynos5433-decon-tv";
 - reg: physical base address and length of the DECON registers set.
-- interrupts: should contain a list of all DECON IP block interrupts in the
-	      order: VSYNC, LCD_SYSTEM. The interrupt specifier format
-	      depends on the interrupt controller used.
-- interrupt-names: should contain the interrupt names: "vsync", "lcd_sys"
-		   in the same order as they were listed in the interrupts
-		   property.
+- interrupt-names: should contain the interrupt names depending on mode of work:
+		video mode: "vsync",
+		command mode: "lcd_sys".
+- interrupts or interrupts-extended: list of interrupt specifiers corresponding
+		to names privided in interrupt-names, as described in
+		interrupt-controller/interrupts.txt
 - clocks: must include clock specifiers corresponding to entries in the
 	  clock-names property.
 - clock-names: list of clock names sorted in the same order as the clocks
-- 
2.7.4
