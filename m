Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D24DCC352A1
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 27 Nov 2022 12:33:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229615AbiK0MdK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 27 Nov 2022 07:33:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229607AbiK0MdI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 27 Nov 2022 07:33:08 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B033DFD2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Nov 2022 04:33:07 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id g12so13502662lfh.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 27 Nov 2022 04:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oPk7pZaW+Js07Ir4q7QUeJVschpmE3FAH9jHHWjWI84=;
        b=xumMlNEqTKOZiUQdPQSK+tLh74W9IPD9qE2L6gqKpx+SpZubP2+FGcLUilHEKVAH8W
         vliKGEci5dFSmd7kV3xcKPB/eZbPFivoOcAhvP7KL0oFLI+pLDvisdeMP6aMHmP4Bhut
         ESu3J1QPow+DUwHCPiE9p1pwhcLuWBaVeW6jOSsNUhgjG3Q958Bwy2tj8DhmMPHim6ps
         hCPTWLt5mZ47FVx7Vb6EM2rljIRid9Tk0CbWVQ57H6SaBm/ZXDcDwnNLAQl+JluZqJko
         B9ubfZXBnKNJTepPpA++5A7BAAsP3d28Nh2D2hXdRo/lvwUXEhKZDMYnNUX6iBFhtXeM
         Llww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oPk7pZaW+Js07Ir4q7QUeJVschpmE3FAH9jHHWjWI84=;
        b=Ul8fhc4Ur/AxWg70QiCDN7WDXzuBqc793MdH0I+DE9Npef9h3sEpt6FsfGokYKp9PK
         Ql47F/x/RPU1YDLQjseva7iS8Vc5QK+guF0gGLWANNS3ZGFZ1fcb8pAuHnSTOrK6lzop
         npk7CfLa2ZNGvAe7NUKQt8A9W0t3bAopIHGdSn0uZVnwsB4jLOZ+sf63Wcaw1wvavbN3
         GInAVxG8bHWwHBr4+2RnH3EiKBgwQHmy+u0Xig+cmlgSf/QZxoaPhhsZNaA02IE9Jx8u
         gM3hxT1iDlWnAlzJ+uPPRkIrW1AcrfIpiyOTuU4OCHZ3Qd4b4C1Dky5VQX1L5FrlRp1Z
         Q6kA==
X-Gm-Message-State: ANoB5pmMpltIIwKU+oBjyTwlQcG9rcK+zOpObDELwbrqOFAZdVM3r2bT
        X/J+okOIYGMBg7FimLCwlFaaYcgV1uxyMVD1
X-Google-Smtp-Source: AA0mqf7+3uqL0EY0aETJxt1pjKKSiEoQY9brryuF6lfSW8A7Qdcx8QvuqQwcqMbNDDC6q9LNfbRQtA==
X-Received: by 2002:ac2:4c27:0:b0:4a2:4df9:4cab with SMTP id u7-20020ac24c27000000b004a24df94cabmr16094272lfq.56.1669552386021;
        Sun, 27 Nov 2022 04:33:06 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id bf36-20020a05651225a400b0049fff3f645esm1270435lfb.70.2022.11.27.04.33.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 04:33:05 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v2 4/4] dt-bindings: soc: samsung: exynos-sysreg: add clocks for Exynos850
Date:   Sun, 27 Nov 2022 13:32:59 +0100
Message-Id: <20221127123259.20339-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127123259.20339-1-krzysztof.kozlowski@linaro.org>
References: <20221127123259.20339-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos850 has dedicated clock for accessing SYSREGs.  Allow it, even
though Linux currently does not enable them and relies on bootloader.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes since v1:
1. Make clocks required on Exynos850.
2. Due to above change, do not add Rb tags.

Cc: Sriranjani P <sriranjani.p@samsung.com>
Cc: Chanho Park <chanho61.park@samsung.com>
Cc: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../soc/samsung/samsung,exynos-sysreg.yaml      | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 42357466005e..9f3fc6406d9d 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -36,10 +36,27 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
 required:
   - compatible
   - reg
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - samsung,exynos850-sysreg
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
 additionalProperties: false
 
 examples:
-- 
2.34.1

