Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFEE2C43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Jul 2022 06:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234919AbiGGGbH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Jul 2022 02:31:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234930AbiGGGbE (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Jul 2022 02:31:04 -0400
Received: from mailout3.samsung.com (mailout3.samsung.com [203.254.224.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C029513F91
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 23:31:01 -0700 (PDT)
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
        by mailout3.samsung.com (KnoxPortal) with ESMTP id 20220707063100epoutp0333c648e558dab680ab2de04735761bcf~-eE0Jdj-Z1032310323epoutp03F
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Jul 2022 06:31:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20220707063100epoutp0333c648e558dab680ab2de04735761bcf~-eE0Jdj-Z1032310323epoutp03F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1657175460;
        bh=1rFhsgea4SwwjFHuvdOIzGo0T883vMe19Ph3xA35004=;
        h=From:To:Cc:Subject:Date:References:From;
        b=O6Yd/4LvvBVtb5WPRqWgatPvLWynyIPTMvC2JWQJL1ZxQKDiRWKBvSxyv9jstjxVF
         /gqqzQgNdAEuPSFShVbHAqEzDkfJGZy5wv1Uo4bXa8ddyeQb3J+AhOr0FMbR7PWe7P
         gU+2t5IyH3TIWj1olYBwkpiIO4ttWJCIhLkcWeCQ=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
        epcas2p4.samsung.com (KnoxPortal) with ESMTP id
        20220707063059epcas2p4be266599bf46e185fe0fb75d67293869~-eEzV0e2n0700507005epcas2p4p;
        Thu,  7 Jul 2022 06:30:59 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.97]) by
        epsnrtp4.localdomain (Postfix) with ESMTP id 4Ldmkp6wXwz4x9QH; Thu,  7 Jul
        2022 06:30:58 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
        epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
        56.3B.09666.2AD76C26; Thu,  7 Jul 2022 15:30:58 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
        epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
        20220707063058epcas2p19364a05a5b2fc8aad81fa390ac030f21~-eEyrexgV2376423764epcas2p1-;
        Thu,  7 Jul 2022 06:30:58 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
        epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20220707063058epsmtrp1479537ea6d7d1a5398db55b35ef20c61~-eEyqwP561862418624epsmtrp1e;
        Thu,  7 Jul 2022 06:30:58 +0000 (GMT)
X-AuditID: b6c32a45-45bff700000025c2-67-62c67da2dd68
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
        epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
        0D.2F.08905.2AD76C26; Thu,  7 Jul 2022 15:30:58 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.51]) by
        epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20220707063058epsmtip280f1ce294355aa720bb70f5577558534~-eEygpBMb1013210132epsmtip2e;
        Thu,  7 Jul 2022 06:30:58 +0000 (GMT)
From:   Chanho Park <chanho61.park@samsung.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: phy: samsung,ufs-phy: match clock items
Date:   Thu,  7 Jul 2022 15:28:07 +0900
Message-Id: <20220707062807.135960-1-chanho61.park@samsung.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmk+LIzCtJLcpLzFFi42LZdljTTHdR7bEkg1WHzS0ezNvGZnF5v7bF
        /CPnWC36Xjxkttj7eiu7xabH11gtZpzfx2TRuvcIuwOHx6ZVnWwed67tYfPYvKTeo2/LKkaP
        z5vkAlijsm0yUhNTUosUUvOS81My89JtlbyD453jTc0MDHUNLS3MlRTyEnNTbZVcfAJ03TJz
        gC5RUihLzCkFCgUkFhcr6dvZFOWXlqQqZOQXl9gqpRak5BSYF+gVJ+YWl+al6+WlllgZGhgY
        mQIVJmRnnOp6wVjwRKSiv+sWcwPjPP4uRk4OCQETife3tzF3MXJxCAnsYJQ4c6+XFcL5xCix
        uGcBC4TzjVFi1coVzDAtO2d+Y4JI7GWUePF2G1TVR0aJ6QuPMoFUsQnoSmx5/ooRxBYRiJd4
        fuE9WBGzwGdGid5zd9lAEsICHhLzJ10BGsvBwSKgKnH8qzdImFfAXmLd2vvsENvkJTYc3M4C
        EReUODnzCZjNDBRv3job7HAJgUvsEm+m9bBANLhIHFi2C6pZWOLV8S1QtpTEy/42KLtYYums
        T0wQzQ2MEpe3/WKDSBhLzHrWzghyELOApsT6XfogpoSAssSRW1B7+SQ6Dv9lhwjzSnS0CUE0
        qksc2D4d6gJZie45n1khbA+J/Xt7wQEnJBArceHIRbYJjPKzkHwzC8k3sxD2LmBkXsUollpQ
        nJueWmxUYAiP1eT83E2M4NSo5bqDcfLbD3qHGJk4GA8xSnAwK4nw5rYfTRLiTUmsrEotyo8v
        Ks1JLT7EaAoM3onMUqLJ+cDknFcSb2hiaWBiZmZobmRqYK4kzuuVsiFRSCA9sSQ1OzW1ILUI
        po+Jg1OqgcmFd8mcoJOWqjeeHpte0ZfzSEC0qeWk3v1l6ttnKgd+DpPnu59oNjnu08LKLuXa
        gI/T15rdfzTx3Cx99q9RM7rvun3+1/Np+7lVL9K26l/6d/wvl2Z8allqVkJYifraONET0sqf
        rxR5BCr5HTf8xxF+9dSUoisL18WoON5SV9nq+kqxanmwcf01Q6Z4brYNGUZzUtPmBKVyeR85
        cneJyFSBm/yXhJ7/1Zw/48b+3xYb0r6xTvEokNjM/L7g4etb9Rc0980t+fZy550dX/Yu3/fq
        xabuZRJK93r0NywpvZaYs3nCq3ui/fOEtT6/YPvjcT1n45TlMzwa1tSzLDp5ftF6g45k0UwJ
        O1E9Dy7djaKKSizFGYmGWsxFxYkABUlLOBYEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrILMWRmVeSWpSXmKPExsWy7bCSvO6i2mNJBmdWK1g8mLeNzeLyfm2L
        +UfOsVr0vXjIbLH39VZ2i02Pr7FazDi/j8mide8RdgcOj02rOtk87lzbw+axeUm9R9+WVYwe
        nzfJBbBGcdmkpOZklqUW6dslcGWc6nrBWPBEpKK/6xZzA+M8/i5GTg4JAROJnTO/MYHYQgK7
        GSX2T8+CiMtKPHu3gx3CFpa433KEtYuRC6jmPaPEjGnTwBrYBHQltjx/xQhiiwjES2z+spAF
        pIhZ4DujxKXOVrAiYQEPifmTrjB3MXJwsAioShz/6g0S5hWwl1i39j7UAnmJDQe3s0DEBSVO
        znwCZjMDxZu3zmaewMg3C0lqFpLUAkamVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsY
        waGqpbmDcfuqD3qHGJk4GA8xSnAwK4nw5rYfTRLiTUmsrEotyo8vKs1JLT7EKM3BoiTOe6Hr
        ZLyQQHpiSWp2ampBahFMlomDU6qB6doand1XF2lf7pDc++WVkmn3scf9pk3zn2tnex/MTjMy
        8deMn/pBdIeW/j+xTTNert1jcvT6iicd5l9Zr5zNeOHzvuz8jZcr/Qz2fpLaLVXUJXBugaU1
        Q4vlfq7jT2QUym3FBXQPmzNv5VBo2Wy0Zvp7YwPuw0/msWnqWVs6mQr9+pB7sSft9PLfDQaM
        3/TkTWcr1tusrz5qc6nmhofbXkOj3mcr15a8uD87UFdtexKvmrme6O83O96Vi3+ILdpRcujd
        6tWu/u/rtGPWK55V1tnd26l9/+i+7VdzF51f+2XS5m8PnvHw8iv6743Jb6r0vrpMPYLh/g6e
        KC7rzZqK8Z/DdVaEeIj7NK7ZtFV1mxJLcUaioRZzUXEiAMvLPzzEAgAA
X-CMS-MailID: 20220707063058epcas2p19364a05a5b2fc8aad81fa390ac030f21
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220707063058epcas2p19364a05a5b2fc8aad81fa390ac030f21
References: <CGME20220707063058epcas2p19364a05a5b2fc8aad81fa390ac030f21@epcas2p1.samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Below error is detected from dtbs_check. exynos7-ufs-phy is required
symbol clocks otherwise only PLL ref clock is required.

clock-names: ['ref_clk'] is too short

Reported-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Suggested-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Chanho Park <chanho61.park@samsung.com>
---
Changes since v1:
- Move allOf: block location after required:
- Remove unnecessary spaces of clock descriptions

 .../bindings/phy/samsung,ufs-phy.yaml         | 47 +++++++++++++++----
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
index 8da99461e817..346eb7cf29a5 100644
--- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
@@ -27,18 +27,12 @@ properties:
       - const: phy-pma
 
   clocks:
-    items:
-      - description: PLL reference clock
-      - description: symbol clock for input symbol ( rx0-ch0 symbol clock)
-      - description: symbol clock for input symbol ( rx1-ch1 symbol clock)
-      - description: symbol clock for output symbol ( tx0 symbol clock)
+    minItems: 1
+    maxItems: 4
 
   clock-names:
-    items:
-      - const: ref_clk
-      - const: rx1_symbol_clk
-      - const: rx0_symbol_clk
-      - const: tx0_symbol_clk
+    minItems: 1
+    maxItems: 4
 
   samsung,pmu-syscon:
     $ref: '/schemas/types.yaml#/definitions/phandle-array'
@@ -62,6 +56,39 @@ required:
   - clock-names
   - samsung,pmu-syscon
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos7-ufs-phy
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: PLL reference clock
+            - description: symbol clock for input symbol (rx0-ch0 symbol clock)
+            - description: symbol clock for input symbol (rx1-ch1 symbol clock)
+            - description: symbol clock for output symbol (tx0 symbol clock)
+
+        clock-names:
+          items:
+            - const: ref_clk
+            - const: rx1_symbol_clk
+            - const: rx0_symbol_clk
+            - const: tx0_symbol_clk
+
+    else:
+      properties:
+        clocks:
+          items:
+            - description: PLL reference clock
+
+        clock-names:
+          items:
+            - const: ref_clk
+
 additionalProperties: false
 
 examples:
-- 
2.37.0

