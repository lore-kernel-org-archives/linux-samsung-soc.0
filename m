From: Simon Shields <simon@lineageos.org>
Subject: [PATCH 1/3] dt-bindings: samsung: document bindings for Midas family boards
Date: Wed, 13 Dec 2017 01:08:13 +1100
Message-ID: <20171212140815.28257-2-simon@lineageos.org>
References: <20171212140815.28257-1-simon@lineageos.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36058 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752995AbdLLOIk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 09:08:40 -0500
In-Reply-To: <20171212140815.28257-1-simon@lineageos.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, Simon Shields <simon@lineageos.org>

Document GT-I9300, GT-I9305, GT-N7100, and GT-N7105 bindings, along
with the shared "midas" binding.

Signed-off-by: Simon Shields <simon@lineageos.org>
---
 Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
index e13459618581..e6765af5cf48 100644
--- a/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-boards.txt
@@ -9,7 +9,11 @@ Required root node properties:
 	- "samsung,smdkv310"	- for Exynos4210-based Samsung SMDKV310 eval board.
 	- "samsung,trats"	- for Exynos4210-based Tizen Reference board.
 	- "samsung,universal_c210" - for Exynos4210-based Samsung board.
+	- "samsung,m0"          - for Exynos4412-based Samsung GT-I9300 board.
+	- "samsung,m3"          - for Exynos4412-based Samsung GT-I9305 board.
+	- "samsung,midas"       - for Exynos4412-based Samsung Midas board.
 	- "samsung,smdk4412",	- for Exynos4412-based Samsung SMDK4412 eval board.
+	- "samsung,t0"          - for Exynos4412-based Samsung GT-N7100/GT-N7105 board.
 	- "samsung,trats2"	- for Exynos4412-based Tizen Reference board.
 	- "samsung,smdk5250"	- for Exynos5250-based Samsung SMDK5250 eval board.
 	- "samsung,xyref5260"	- for Exynos5260-based Samsung board.
-- 
2.15.1
