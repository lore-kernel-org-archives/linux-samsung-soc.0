Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46BA5C43334
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Jul 2022 16:13:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230342AbiGEQNu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Jul 2022 12:13:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231515AbiGEQNs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 12:13:48 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D38918E0E
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 09:13:47 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id t25so21385496lfg.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 09:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nEMULX3caekxu6IpY9n8CKmBGs6wAVmggM/WX7upL/g=;
        b=Rl/7x4CQYuJWvdvPRT/Fd12K+OtOYzZyehhYXXybqaX5Pi1Fm79tfO97h/nw4uRwTN
         enn7gP8dyPyoOt3/06dnhdb+FAmJ3RVJediqdupFIuxalILZIU6vcCV5dANfG66eE4gs
         Nz8L9XajeDNNTRI0LGqndecWA7pnAx57WTaYqmLbDFnT8vOhptPErY68v0Fx6WN75stX
         XYf9RepWt5n5rR09DrFMwnzcgYdt+kmXdJ7yKmUX7Ev4nMFAxpKOWW0BHudnX0zNNTA7
         01Pg7KWVUX4Z6gfIx+4QFkkMblccgNY8Bhs+ORw9n0V3W4aVbQYTzTV2KnxaH9zEp5ht
         7B3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nEMULX3caekxu6IpY9n8CKmBGs6wAVmggM/WX7upL/g=;
        b=DxROz5xv9eRwpeVKeERGpPw0RKM0ry0+AxwhkGM9TTWPJZzGY8cwQeafbqzKFGj7Ei
         d4/Pmf4AssQLvY0HSY/ul45qOLFfCtvBLyW2KIeYiLUVH2utA2ld2cJGtBKrbQJtxtuT
         3LTgHLGo8DJZDTUYJVeZQVCOUQeoHDBcbIpNsxx2y31QVYIAX3l92VBHLy87NqNCLBsw
         B56YPhHgX/j+QQW1Kykmtm8z29hlyCuFIb3ujvAwON+7XEW5cA9HmWzopd5v3gBTgXSl
         b/hsV1x5qX1KHkl7/5O0Dka8egK/uHXYQeopgYJjH25s/DbPR5mFmrTJIZq2b9QsAji1
         q7yg==
X-Gm-Message-State: AJIora8GP4/GzEIgXcva3Jpkz8sMtfHUbz/4PzTQ18rcZ1j4KeZwux7M
        d4MEYOmAa+1V/fVd2KJ1F+zDjQ==
X-Google-Smtp-Source: AGRyM1uXPNWr5J019pOwxyaVBGGm+iRfywVs4R8TnnmZUvoBDkzQOea44sJZsQ0iWjDVlozwoQVC6g==
X-Received: by 2002:a05:6512:220c:b0:483:d9ad:b56c with SMTP id h12-20020a056512220c00b00483d9adb56cmr2240655lfu.150.1657037624199;
        Tue, 05 Jul 2022 09:13:44 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id r25-20020a2e9959000000b0025a70f7ea3asm5638346ljj.138.2022.07.05.09.13.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 09:13:43 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: samsung: document preferred compatible naming
Date:   Tue,  5 Jul 2022 18:13:40 +0200
Message-Id: <20220705161340.493474-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Compatibles can come in two formats.  Either "vendor,ip-soc" or
"vendor,soc-ip".  Add a DT schema documenting preferred policy and
enforcing it for all new compatibles, except few existing patterns.  The
schema also disallows wild-cards used in SoC compatibles.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Update comment.
---
 .../bindings/arm/samsung/samsung-soc.yaml     | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml

diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
new file mode 100644
index 000000000000..653f85997643
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/samsung/samsung-soc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S3C, S5P and Exynos SoC compatibles naming convention
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+description: |
+  Guidelines for new compatibles for SoC blocks/components.
+  When adding new compatibles in new bindings, use the format::
+    samsung,SoC-IP
+
+  For example::
+    samsung,exynos5433-cmu-isp
+
+select:
+  properties:
+    compatible:
+      pattern: "^samsung,.*(s3c|s5pv|exynos)[0-9a-z]+.*$"
+  required:
+    - compatible
+
+properties:
+  compatible:
+    oneOf:
+      - description: Preferred naming style for compatibles of SoC components
+        pattern: "^samsung,(s3c|s5pv|exynos|exynosautov)[0-9]+-.*$"
+
+      # Legacy compatibles with wild-cards - list cannot grow with new bindings:
+      - enum:
+          - samsung,exynos4x12-pinctrl
+          - samsung,exynos4x12-usb2-phy
+          - samsung,s3c64xx-pinctrl
+          - samsung,s3c64xx-wakeup-eint
+
+additionalProperties: true
-- 
2.34.1

