Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE81E9270D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 16:05:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237356AbjJEQFB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237025AbjJEQDs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 12:03:48 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B722286822
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 08:57:29 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40572aeb73cso9999805e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 08:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521448; x=1697126248; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMWnJU8MsW38YqwezPXC42C6b/YrhBHi3/ZxSDJgFAQ=;
        b=EuT6SeXl8O87yIT6gGd/t4GMSiDJVxyJV0+GlwI+qknSf22O+r1szlTGz3AsB6S727
         piWP5sVc4scD39t2JxilQdHg5uA8/ti+LM4TKhgAdxPqlvEhMkQBFk+AXrx7nU7L0mrZ
         vZzl/umboZSChsG1CxmzOhOVzkMQVZ460bcftFrBYlggKtswZf9e4ahNUoc7W1CFvodw
         mOtolivfM/UXBmJXp/V83p8JxVix3YmFg2qWH+2yb3ensMKCfXT4xJ+DNRkqSqP9ESiL
         etqaxW5yjBxilnX7g8aS6/ge+KrNChoMSZbx+GE00I+dTXSeVWZUMGExfB/KjHOGCKeO
         LkVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521448; x=1697126248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMWnJU8MsW38YqwezPXC42C6b/YrhBHi3/ZxSDJgFAQ=;
        b=M+Mw2sLrE5P0ZYwlfXh65AJR0NhbuMUBGNm1sRZ/67jUN0jRyof2b1Nn/4c5Ql67Sz
         y1ejX1t5JYvaUhhyr47gUXCwD6/X1Tl22EIRdAW2ug+303gz9oXlN7jNywob7UzpNf4c
         Kfot9qBKRb159PpOjRch3nOSkvftt+tgSdvWkp58JGWUGwe8ksCb/j1whaKhBuAGOP+X
         3syIY4DhLodGfWhbatE9NfSgEkqWbqsGZ038rEEwz9XId1OwisqbiatI3jhdOLqMDVtt
         S4Vx4Cmy9h6qSr6slB79YiRYRJ3cwio6JkwvEbHwNvprclFYQvFtmnoeK4YaGih9+yoi
         zEEA==
X-Gm-Message-State: AOJu0YxAd2tg6PY+m+a/I/OA6ECk4td2VNxjt5egMnVw54Xxhhr7SVBe
        3VkWjpPx2MOeWhO/KOyVEboecw==
X-Google-Smtp-Source: AGHT+IElw6k3YNkDW9u8nFOA5PsXxz5xE+xMGpuB2fgKZPK0gtuloOqBwjzaNH/QHLmyKFBNlfOM0g==
X-Received: by 2002:a5d:4286:0:b0:321:651b:4651 with SMTP id k6-20020a5d4286000000b00321651b4651mr5358186wrq.29.1696521448129;
        Thu, 05 Oct 2023 08:57:28 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:27 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 06/21] dt-bindings: arm: google: Add bindings for Google ARM platforms
Date:   Thu,  5 Oct 2023 16:56:03 +0100
Message-ID: <20231005155618.700312-7-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This introduces bindings and dt-schema for the Google tensor SoCs.
Currently just gs101 and pixel 6 are supported.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/arm/google.yaml       | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
new file mode 100644
index 000000000000..3759d423d9cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/google.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor platforms
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description: |
+  ARM platforms using SoCs designed by Google branded "Tensor"
+  used in Pixel devices.
+
+  Currently upstream this is devices using "gs101" SoC which
+  is found in Pixel 6, Pixel 6 Pro and Pixel 6a.
+
+  Google have a few different names for the SoC.
+  - Marketing name ("Tensor")
+  - Codename ("Whitechapel")
+  - SoC ID ("gs101")
+  - Die ID ("S5P9845");
+
+  Likewise there are a couple of names for the actual device
+  - Marketing name ("Pixel 6")
+  - Codename ("Oriole")
+
+  Devicetrees should use the lowercased SoC ID and lowercased
+  board codename. e.g. gs101 and gs101-oriole
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+
+      - description: Google Pixel 6 / Oriole
+        items:
+          - enum:
+              - google,gs101-oriole
+          - const: google,gs101
+
+additionalProperties: true
+
+...
-- 
2.42.0.582.g8ccd20d70d-goog

