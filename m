Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 163A0C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Jun 2022 12:35:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232925AbiF2Mft (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Jun 2022 08:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231713AbiF2Mfs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Jun 2022 08:35:48 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAB1828E3D
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 05:35:47 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id g26so32289330ejb.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Jun 2022 05:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q8pCybxjWozGkg4XkxF8hCsdW8FgZKjWDEioFfT4qAc=;
        b=lci++Zen0Iac6DnB8ntK2Y4eGEo+IF3ekd+ab/O8WDauLz4PrhJTqEv6Vk9qLMFruS
         crrxNjPD8t08uTn8wxxzlgVw2wJlYtgPQBnFmdJ7LC0mC706lmEwpasVczB4BTfc71EQ
         rYe6CoWvhSanvSRdOSNLRSqr8RcdyM+jGT1oX68C9qkezsFz80L8MQ8xK/EMtN7vmxUd
         AOWY8Ly/n/gMxgTekdcxrErLkE/4l6mKITxr8zx45+iUA/3knVFG1xRzXKc4UA3Jj0Kq
         fSB7/p5pcwWyfmcecNBa9Ujkf3Zr43209mEshZwTyYmHHtVMlGanVEPF7BLxd9hO7/4q
         m7pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Q8pCybxjWozGkg4XkxF8hCsdW8FgZKjWDEioFfT4qAc=;
        b=tGztjkdrkxjp3WwRPoaeP4APpeUgnL70OUNoHvFo5KHPyVVJ4bQsom6z+Q0noHqTX9
         y92fpW3QXbID5U4taGsXc6kClIHPVRqC8sGLsG3eapqZ7kiNTZDZU9TFJ4zfcJvws6OH
         ROGBivQA3J7GUFji8pODFSfV+OjGt+esVNOZhmjUKGjAl1RLSpXdJdA7U4yJykN+44z3
         1puulLxAMlKMIcJfYHNO/eEwEt4Bn4LXhxBbi4KfzdKqTl1qvaeN7OmGnsZYofhVQqcY
         0jRSJbPvCC0qCUXRihPX4ZR5hxTd4tnZk5n5yuJRY1X1+drrsH8ImoABvmx8BqTLamM0
         JY4A==
X-Gm-Message-State: AJIora/zmTICplSR4fnLyZlDPQs7pRyb553fXdgAbhSsJVChQ/ulUS6G
        tfczye0EDysPHrdqBCPOpFfIsQ==
X-Google-Smtp-Source: AGRyM1u943KaJE2gtYoBez8mvmZ6nHvpsrQFytNjdq485fL9iLkWdn0J4ZOz5mVQgQLA3S/z6G6xqw==
X-Received: by 2002:a17:906:b782:b0:726:f979:7adb with SMTP id dt2-20020a170906b78200b00726f9797adbmr3014643ejb.498.1656506146499;
        Wed, 29 Jun 2022 05:35:46 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s2-20020a1709062ec200b006f4cb79d9a8sm7769345eji.75.2022.06.29.05.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 05:35:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: soc: samsung: s5pv210-chipid: add S5PV210 ChipID
Date:   Wed, 29 Jun 2022 14:35:43 +0200
Message-Id: <20220629123543.94515-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add bindings for the S5PV210 ChipID block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soc/samsung/s5pv210-chipid.yaml  | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/samsung/s5pv210-chipid.yaml

diff --git a/Documentation/devicetree/bindings/soc/samsung/s5pv210-chipid.yaml b/Documentation/devicetree/bindings/soc/samsung/s5pv210-chipid.yaml
new file mode 100644
index 000000000000..7c3f4ec47f7e
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/samsung/s5pv210-chipid.yaml
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/samsung/s5pv210-chipid.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S5PV210 SoC series Chipid driver
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

