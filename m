Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDB7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  3 Jul 2022 18:35:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232839AbiGCSf0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 3 Jul 2022 14:35:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232837AbiGCSfZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 3 Jul 2022 14:35:25 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 104A02E5
        for <linux-samsung-soc@vger.kernel.org>; Sun,  3 Jul 2022 11:35:23 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bx13so8588783ljb.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 03 Jul 2022 11:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AP2/efFfUDebdlE0yNTe8GyV2AogZFZgk7dz0GR3fBc=;
        b=zQUHevyZzzdk/XKbU9YZcSPXgVbNKQSP/3VAfGvhTDoY4imJX+B7kJRx8tjWAQDV28
         VSqBbjaqGF/AQmbdqOl7hQGtt1x/KDpxUmJ41WbB070fwvbYZC9Dg+VmvT/9j6GQUJfC
         wDCpuySBT0Q4JL4h/krdHq6ZrwSw/VG90hPzl/xk6y46rKv1WjmFEXhrD4jgbrPyj1f+
         xlEBo8xCFAW3AT8NaCQ4CpSCHSoIA9cHDsS9NrOcXFAVU9jsnWrHKT0JuXrB7iIUXES6
         gHad3sBsv6uUeyBodAMO97pUHyWClr7Zs5xcs6SCbPWYxxXvN7gC+vWO+TBvCvhgJz57
         8mLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AP2/efFfUDebdlE0yNTe8GyV2AogZFZgk7dz0GR3fBc=;
        b=PBVxSO3SR6XvCadQ1YxqkssTRydhNm2fLQ31fxH/QhYAxNewTT7xRfT5acxNEtzpCj
         LfUnNTqWQtvojV3BxID6Sst9bol8e+9Zhz95N/gUKVeAqP/6Z+KveKtq6NcyXDfgbqwP
         cVPGRD5HETHqBZTfbUcWhMqSePmRem4s1JhVxqCjHloxdwdXZIE+mY4sNn6uSp8qv+Ly
         nllUKVtYpfBMoYlxgQCZ67CVGIr/BX3qql8Nt11S0Z997GBDUBtH6AJhiU5S2VoShuTL
         8JiOO/KkB77pWwSYRqhKRVnvYH+coJynAwf0faHxG2Y7xbhC7Z9SJXQzfqDzLRfM2OoF
         hnBg==
X-Gm-Message-State: AJIora+M1H4RgjfV+dVIQM34y5CQCDj0fxHnFyBgcD+ragZYQVZ2VaKs
        ElTFGZyklMNzGZTTehfHimp6MA==
X-Google-Smtp-Source: AGRyM1tzj6MYo9YvTk8sXWmAU4N52ZC5v/l8ZBIasempFqYnY03ZDamXfM5aDNHtpjpaLrPs0M77bQ==
X-Received: by 2002:a2e:8558:0:b0:25a:742f:d7 with SMTP id u24-20020a2e8558000000b0025a742f00d7mr14118804ljj.178.1656873321335;
        Sun, 03 Jul 2022 11:35:21 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id n3-20020a056512310300b0047960b68eb5sm2020412lfb.40.2022.07.03.11.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jul 2022 11:35:20 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: hwinfo: samsung,s5pv210-chipid: add S5PV210 ChipID
Date:   Sun,  3 Jul 2022 20:34:49 +0200
Message-Id: <20220703183449.12917-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220703183449.12917-1-krzysztof.kozlowski@linaro.org>
References: <20220703183449.12917-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document already used S5PV210 ChipID block.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

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

