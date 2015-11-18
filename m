From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 02/16 REBASED] dt-bindings: remove deprecated compatible string
 from exynos-hdmi
Date: Wed, 18 Nov 2015 09:33:07 +0100
Message-ID: <1447835588-3032-1-git-send-email-a.hajda@samsung.com>
References: <CAJKOXPfojLMoq=nwfOVmZ_eiM-aoSx8-ULJ_ExS0gWNXWRJnkQ@mail.gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35411 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754130AbbKRIdz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 18 Nov 2015 03:33:55 -0500
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout1.w1.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0NY000H5L54HT070@mailout1.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 18 Nov 2015 08:33:53 +0000 (GMT)
In-reply-to: <CAJKOXPfojLMoq=nwfOVmZ_eiM-aoSx8-ULJ_ExS0gWNXWRJnkQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: k.kozlowski@samsung.com
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Gustavo Padovan <gustavo@padovan.org>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org

samsung,exynos5-hdmi compatible was marked as deprecated in Jun 2013.
It was never used since then.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Gustavo Padovan <gustavo.padovan@collabora.co.uk>
---
 Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt b/Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt
index 1fd8cf9..d474f59 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_hdmi.txt
@@ -2,10 +2,9 @@ Device-Tree bindings for drm hdmi driver
 
 Required properties:
 - compatible: value should be one among the following:
-	1) "samsung,exynos5-hdmi" <DEPRECATED>
-	2) "samsung,exynos4210-hdmi"
-	3) "samsung,exynos4212-hdmi"
-	4) "samsung,exynos5420-hdmi"
+	1) "samsung,exynos4210-hdmi"
+	2) "samsung,exynos4212-hdmi"
+	3) "samsung,exynos5420-hdmi"
 - reg: physical base address of the hdmi and length of memory mapped
 	region.
 - interrupts: interrupt number to the cpu.
-- 
1.9.1
