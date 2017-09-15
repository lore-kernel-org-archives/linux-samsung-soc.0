From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 1/5] dt-bindings: Explicitely mark Exynos HDMI DDC node as
 deprecated
Date: Fri, 15 Sep 2017 11:11:19 +0200
Message-ID: <1505466683-32148-2-git-send-email-m.szyprowski@samsung.com>
References: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170915091139eucas1p2d3ee5da70946b4f377242642af117635@eucas1p2.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:44220 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751157AbdIOJLn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 15 Sep 2017 05:11:43 -0400
In-reply-to: <1505466683-32148-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org

Commit 2b7681326dc2 ("drm/exynos: hdmi: remove the i2c drivers and use")
merged to v3.15 kernel added a required 'ddc' property to Exynos HDMI
device tree bindings, which should point to i2c bus used for handling DDC
(mainly reading display's EDID information). Since that commit
separate node with "samsung,exynos4210-hdmiddc" compatible is no longer
needed, so mark it finally as deprecated.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt b/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
index 41eee971562b..6f807e523ccb 100644
--- a/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
+++ b/Documentation/devicetree/bindings/display/exynos/exynos_hdmiddc.txt
@@ -1,9 +1,12 @@
 Device-Tree bindings for hdmiddc driver
 
+This binding is deprecated. Please use 'ddc' property in Exynos HDMI
+node (see exynos_hdmi.txt for details).
+
 Required properties:
 - compatible: value should be one of the following
 	1) "samsung,exynos5-hdmiddc" <DEPRECATED>
-	2) "samsung,exynos4210-hdmiddc"
+	2) "samsung,exynos4210-hdmiddc" <DEPRECATED>
 
 - reg: I2C address of the hdmiddc device.
 
-- 
1.9.1
