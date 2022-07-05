Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA61ACCA480
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  5 Jul 2022 15:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232559AbiGEPrJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 5 Jul 2022 11:47:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232783AbiGEPq1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 5 Jul 2022 11:46:27 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68C4311C23
        for <linux-samsung-soc@vger.kernel.org>; Tue,  5 Jul 2022 08:46:18 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id j21so21310522lfe.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 05 Jul 2022 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=skQdkbBJDPAVydlmX1UM7e+Ff0NvQ2MRAQ4wLe+ZPuo=;
        b=TYURG0V9UTfKD1uPyWAV8bOq4DdCfaabxH6lFyNYgVeNhH0bquO0oY7Tp8XxVLlbl6
         o8hbEulHbeqBtQzkIF1QY9KgiecSob67j6o0lSd7SomrzJkjczbGtdRxruHr4VKI1LAN
         tBsTBPqk5wVI5KT6SyWC+5lq6QNxFSERd1PBUI94e22bXDxdepkcpJ7eEahd0/NPWa0r
         KIfPIQyd+slEsuSEIlf0EojKsx7zxhPJna7Fy2yuKSn/B14g7Q31qK/lgO03ikHw2Kc9
         mqdzmSU7IDvdQFcUXUcfzOBvoei5MPvtavggWq39jYDv3EnhJTdUfNvPHF6NUzDY5hjX
         JcbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=skQdkbBJDPAVydlmX1UM7e+Ff0NvQ2MRAQ4wLe+ZPuo=;
        b=GKqlZ7mxsjqWvHNvI5VH/5QsprorI/AjotSlmWcVFGTLYaF6Jf5+QlkW6UX2jzt0Bk
         2JGVtdtUR9tHX2ZD6l3N79pzt0KmFghtyHrpcudBeIcsJFL+G5CCkiPcas1N2QeVpSU1
         E2nCqVaaha5TFgsq6/pON09NBMXXHMGuBJWQDjwaWpXPqpBj7i0J4PbQAlhL2LUhcuq0
         EGoVw/6oPNHqBtEiAEZkgSyOSF2sAPj23x5Uc/ev9nszzMz0MQz8/ZN/GgyTOJEEBjK9
         6p+qTasTBB1aqm1byAqtYAo5bKTosyrcD47Nl0bwOqnWC/gsDn9ZBzE+FbcnHyvRCN3K
         VS3w==
X-Gm-Message-State: AJIora8hcH8nPzI46wxYM5gqavob/HLG18/+JXSgjW84zwPy2bS5+LGR
        dSx2YkIV7giMW3NrOpB2SFNIrQ==
X-Google-Smtp-Source: AGRyM1ueChz7kcB4Mlr9M8aw0/msbdrYbvGVP/oZ5ymJzVTsp4JAr+dXDzXnbQfdcWpaHbg1lc0vsw==
X-Received: by 2002:a05:6512:3d23:b0:47f:6b6f:f5ba with SMTP id d35-20020a0565123d2300b0047f6b6ff5bamr23383926lfv.160.1657035976786;
        Tue, 05 Jul 2022 08:46:16 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id y14-20020a19750e000000b0047f78ad78bdsm5738394lfe.218.2022.07.05.08.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 08:46:16 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 2/2] dt-bindings: hwinfo: samsung,s5pv210-chipid: add S5PV210 ChipID
Date:   Tue,  5 Jul 2022 17:46:13 +0200
Message-Id: <20220705154613.453096-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220705154613.453096-1-krzysztof.kozlowski@linaro.org>
References: <20220705154613.453096-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document already used S5PV210 ChipID block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v2:
1. None.

Changes since v1:
1. Move to hwinfo and rename.
2. Mention that device is already used.
---
 .../hwinfo/samsung,s5pv210-chipid.yaml        | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwinfo/samsung,s5pv210-chipid.yaml

diff --git a/Documentation/devicetree/bindings/hwinfo/samsung,s5pv210-chipid.yaml b/Documentation/devicetree/bindings/hwinfo/samsung,s5pv210-chipid.yaml
new file mode 100644
index 000000000000..563ded4fca83
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwinfo/samsung,s5pv210-chipid.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwinfo/samsung,s5pv210-chipid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5PV210 SoC ChipID
+
+maintainers:
+  - Krzysztof Kozlowski <krzk@kernel.org>
+
+properties:
+  compatible:
+    const: samsung,s5pv210-chipid
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    chipid@e0000000 {
+        compatible = "samsung,s5pv210-chipid";
+        reg = <0xe0000000 0x1000>;
+    };
-- 
2.34.1

