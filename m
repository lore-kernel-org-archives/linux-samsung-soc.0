From: Simon Shields <simon@lineageos.org>
Subject: [PATCH v5 1/4] dt-bindings: samsung: document bindings for Midas family boards
Date: Thu,  8 Feb 2018 11:01:34 +1100
Message-ID: <20180208000137.11264-2-simon@lineageos.org>
References: <20180208000137.11264-1-simon@lineageos.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:38344 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750767AbeBHACQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 7 Feb 2018 19:02:16 -0500
In-Reply-To: <20180208000137.11264-1-simon@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>, =?UTF-8?q?Bart=C5=82omiej=20=C5=BBo=C5=82nierkiewicz?= <b.zolnierkie@samsung.com>, Simon Shields <simon@lineageos.org>

Document GT-I9300, GT-I9305, GT-N7100, and GT-N7105 bindings, along
with the shared "midas" binding.

Signed-off-by: Simon Shields <simon@lineageos.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
index e13459618581..e09b0ea5a8b9 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
@@ -9,7 +9,11 @@ Required root node properties:
 	- "samsung,smdkv310"	- for Exynos4210-based Samsung SMDKV310 eval board.
 	- "samsung,trats"	- for Exynos4210-based Tizen Reference board.
 	- "samsung,universal_c210" - for Exynos4210-based Samsung board.
+	- "samsung,i9300"          - for Exynos4412-based Samsung GT-I9300 board.
+	- "samsung,i9305"          - for Exynos4412-based Samsung GT-I9305 board.
+	- "samsung,midas"       - for Exynos4412-based Samsung Midas board.
 	- "samsung,smdk4412",	- for Exynos4412-based Samsung SMDK4412 eval board.
+	- "samsung,n710x"          - for Exynos4412-based Samsung GT-N7100/GT-N7105 board.
 	- "samsung,trats2"	- for Exynos4412-based Tizen Reference board.
 	- "samsung,smdk5250"	- for Exynos5250-based Samsung SMDK5250 eval board.
 	- "samsung,xyref5260"	- for Exynos5260-based Samsung board.
-- 
2.16.0
