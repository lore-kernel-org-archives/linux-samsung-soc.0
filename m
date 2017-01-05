From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] MAINTAINERS: Add EXYNOS5433 ARM architectures entry as a
 supporter
Date: Thu, 05 Jan 2017 22:12:49 +0900
Message-ID: <1483621969-27631-1-git-send-email-cw00.choi@samsung.com>
References: <CGME20170105131251epcas1p18bb302757d0e45145595cc68c4ad947e@epcas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:52246 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033818AbdAENN2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Jan 2017 08:13:28 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: krzk@kernel.org, javier@osg.samsung.com, kgene@kernel.org
Cc: cw00.choi@samsung.com, andi.shyti@samsung.com, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org

This patch adds the 'ARM/SAMSUNG EXYNOS5433 ARM ARCHITECTURES' entry
in order to review and test the upcoming patches as a supporter.
I have developed the low-level devices and power related devices for
Exyno5433 and TM2/E board.

Moreover, Andi proposed himself as a reviewer for Exynos5433 and TM2/E.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Andi Shyti <andi.shyti@samsung.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cfff2c9e3d94..96c055e8dd0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1712,6 +1712,13 @@ F:	Documentation/devicetree/bindings/sram/samsung-sram.txt
 F:	Documentation/devicetree/bindings/power/pd-samsung.txt
 N:	exynos
 
+ARM/SAMSUNG EXYNOS5433 ARM ARCHITECTURES
+M:	Chanwoo Choi <cw00.choi@samsung.com>
+R:	Andi Shyti <andi.shyti@samsung.com>
+L:	linux-samsung-soc@vger.kernel.org (moderated for non-subscribers)
+S:	Supported
+F:	arch/arm64/boot/dts/exynos/exynos5433*
+
 ARM/SAMSUNG MOBILE MACHINE SUPPORT
 M:	Kyungmin Park <kyungmin.park@samsung.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
-- 
1.9.1
