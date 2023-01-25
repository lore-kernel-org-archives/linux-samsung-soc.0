Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F3B1C27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:08:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234742AbjAYJI4 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:08:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233619AbjAYJIz (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:08:55 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8DCF3D905
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:08:53 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so742046wml.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sF+NbwG3d0SXyd+w9CGOwS5V+wHVHgGRIB1Vv65RfW4=;
        b=ZWrIKDuUi3xvqvKgoHlNBI3N5mKVytsVXnEpwpDbLuTaqSBniGX+ox9bf938gpk8jt
         H9efII5W8y6VumMOo7nTj2EnIXWml7+JW2SxwQTLXg5W3aKQyLTCQBOZoNxROtjHlp4h
         NMbGirP+YenRX6bdA/md5/UjuzkwkdfUR87pPS5i6uqhn5suxigqU478/Zb2OJIqRvYT
         h/z2c07uxlv8IO4tWj85LYStXlZamuppYXBBObn1JhykQiP8G4fj/TZbJHBJLdyE1bkz
         JlNz4iFeEzqRWuPy8tfWt3tQnn8qvhZ92rIKApzJjLo1EQIge/J3u4FmbhxUJ1jJZDmW
         8IBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sF+NbwG3d0SXyd+w9CGOwS5V+wHVHgGRIB1Vv65RfW4=;
        b=75HaLIJKIFrXKuXEYE0p+zTA78GPnQ+QVSwnubFTtjCh9KJNvMpxQOnrYkH6ku9Cch
         eauWBS1qr+pRB4gYP3mkeOM7GFkVFW3BygNC2yFh79Huvf3fvkqPcypsYqQUnZLG6Vuu
         VnRc/TSvWgIhQT9VWLJg8AHpQGpc0ICJgLwMtHxqNX/2vTIQN5jCHO7Lh8Q4sk4akwXj
         Ab3Zt0RRA9H6z+1hVimD3FQHyHCj3VbiGbBg9WLM+YJOyM+GFcKgrLTwtTP4DJU7rK29
         0Wdio8OFNLj+GWOSUA0B55nOxuXOnLFDSl/Ch9poMET8dXktRMuzrz+UHlikd8Wb6mxL
         2xhw==
X-Gm-Message-State: AFqh2kr0yOK3W8iJhecY8fKbg0p15qy3jKxRXz5gLZrcaDRgJo93nyxd
        BCJNQQwaAK3aXFIec9G4flo1pw==
X-Google-Smtp-Source: AMrXdXvspCLpjak/blAkqScmjuu7tOfRkMdKuuRUnkH3nrmuuQvbcbNJUkPnLwAuNPDyLikW11ck/g==
X-Received: by 2002:a05:600c:35d5:b0:3db:fc4:d018 with SMTP id r21-20020a05600c35d500b003db0fc4d018mr28490606wmq.40.1674637732378;
        Wed, 25 Jan 2023 01:08:52 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c13d300b003daf98d7e35sm1198258wmg.14.2023.01.25.01.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:08:51 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: interconnect: samsung,exynos-bus: allow opp-table
Date:   Wed, 25 Jan 2023 10:08:49 +0100
Message-Id: <20230125090849.122189-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The opp-table can be located in the exynos-bus node which uses it, so
allow such child node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../interconnect/samsung,exynos-bus.yaml      | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/samsung,exynos-bus.yaml b/Documentation/devicetree/bindings/interconnect/samsung,exynos-bus.yaml
index ad9ed596dfef..5e26e48c7217 100644
--- a/Documentation/devicetree/bindings/interconnect/samsung,exynos-bus.yaml
+++ b/Documentation/devicetree/bindings/interconnect/samsung,exynos-bus.yaml
@@ -196,6 +196,8 @@ properties:
     maxItems: 2
 
   operating-points-v2: true
+  opp-table:
+    type: object
 
   samsung,data-clock-ratio:
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -227,6 +229,31 @@ examples:
         operating-points-v2 = <&bus_dmc_opp_table>;
         devfreq-events = <&ppmu_dmc0_3>, <&ppmu_dmc1_3>;
         vdd-supply = <&buck1_reg>;
+
+        bus_dmc_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-50000000 {
+                opp-hz = /bits/ 64 <50000000>;
+                opp-microvolt = <800000>;
+            };
+            opp-100000000 {
+                opp-hz = /bits/ 64 <100000000>;
+                opp-microvolt = <800000>;
+            };
+            opp-134000000 {
+                opp-hz = /bits/ 64 <134000000>;
+                opp-microvolt = <800000>;
+            };
+            opp-200000000 {
+                opp-hz = /bits/ 64 <200000000>;
+                opp-microvolt = <825000>;
+            };
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>;
+                opp-microvolt = <875000>;
+            };
+        };
     };
 
     ppmu_dmc0: ppmu@106a0000 {
-- 
2.34.1

