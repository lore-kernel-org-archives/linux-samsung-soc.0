Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B4E9C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Dec 2021 12:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239193AbhL2MrY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Dec 2021 07:47:24 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:39796
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238903AbhL2MrM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 07:47:12 -0500
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A0E82402E2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 12:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640782026;
        bh=iLh2tlnNUtVUmnMt4eZqM7IntfyNeEM0k2CAHpGK5VM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Xt6pXXmUBbMxdEqk5szvOEw9YSCCjQt3evSRfTXUCEa0kUZ1/2bW8vD0u2Yi7pCS8
         NFKgB3DJy/FruQVkUDsggPZxbjYPcLyCZxDXTKdknQRwq5sdT8NNeMOlzuGzXbLyqM
         mm5/yb2qKK5E01xw6Vsq/rwFGPfL0Ct4E3s7hmV/hXrpWwP2A0Muq8KVfAtGn/eGd+
         9BeXox8qlwwZk+bSeflTJT8JzH/zrNKi1JsviJf3jbZMOMM14JjJJNAZAq58D/zmuJ
         yCIQJQPSSzFH2D1o9LW7Qm/gzKXkkauGe8D8+QWu2LUzP0uOdrjirB8RjuaSUJN6Zo
         ysyVnj0O5/MsA==
Received: by mail-lj1-f198.google.com with SMTP id v19-20020a2e87d3000000b0022dbe4687f1so4457657ljj.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 04:47:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iLh2tlnNUtVUmnMt4eZqM7IntfyNeEM0k2CAHpGK5VM=;
        b=VCUKDRoRIvS13odagBItHdpRbEoKCD+fEOVKclE+MM8q+MWVaivd9lv01+GVdwpRvW
         vjmF7o5NavHvBvJjOovw23SgMoBPSSzwIg7ExWrHdx/UUCgUxpU1y/A+hWypg93WR539
         XKh9iMzb6TxXu2Tze87UqqK8bAFWNiEDwOguUJwdm/Fs81tE+P0fZzUtoCpZctGvwQ8m
         PPBZd3dv/ptUdmoSkgautnyzzGwVWRBfrAr65XJogLrXr66WxNK1uypzJlO7+ra1bFMk
         uOFF+W+UlHClnloQg+z1cDiaE82XDBOFfQjftXk8NyDhv3/N8NX2wxCV5PDD80QFz58J
         7u/Q==
X-Gm-Message-State: AOAM533YK0R0ZjKanfH2BqgKWskmO78jzyo/cuK5Z9nVRCKr7w/QiyY3
        rd+gcti8wU56XHK/XM7f9Moto70QeW9rHTcAph/7J1pT1LGCj12ROLheu6zHA+OGVT6gHuHq7+8
        dFbKU6zS8HGLTFaatu0wWFE82ybaU2AtxJ0MdQuxdxTBmRgj/
X-Received: by 2002:ac2:5f55:: with SMTP id 21mr23246724lfz.283.1640782022892;
        Wed, 29 Dec 2021 04:47:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzQwlfEHGHgz1XhNgkfKoJmRVwi/su6Y8k5CHBskV1bmWZtSjIVx4kz65FqRHcXJCAf0dw7zw==
X-Received: by 2002:ac2:5f55:: with SMTP id 21mr23246702lfz.283.1640782022719;
        Wed, 29 Dec 2021 04:47:02 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id e11sm711158ljn.73.2021.12.29.04.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 04:47:02 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Inki Dae <inki.dae@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Beomho Seo <beomho.seo@samsung.com>
Subject: [PATCH 2/5] dt-bindings: extcon: maxim,max77843: add MAX77843 bindings
Date:   Wed, 29 Dec 2021 13:46:28 +0100
Message-Id: <20211229124631.21576-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211229124631.21576-1-krzysztof.kozlowski@canonical.com>
References: <20211229124631.21576-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the bindings for MAX77843 MUIC/extcon driver, based on
Exynos5433 TM2 devicetree.  These are neither accurate nor finished
bindings but at least allow parsing existing DTS files.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/extcon/maxim,max77843.yaml       | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/extcon/maxim,max77843.yaml

diff --git a/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml b/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml
new file mode 100644
index 000000000000..1f15a6c700f6
--- /dev/null
+++ b/Documentation/devicetree/bindings/extcon/maxim,max77843.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/extcon/maxim,max77843.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim MAX77843 MicroUSB and Companion Power Management IC Extcon
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for Maxim MAX77843 MicroUSB
+  Integrated Circuit (MUIC).
+
+  See also Documentation/devicetree/bindings/mfd/maxim,max77843.yaml for
+  additional information and example.
+
+properties:
+  compatible:
+    const: maxim,max77843-muic
+
+  connector:
+    $ref: ../connector/usb-connector.yaml#
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/port
+    description:
+      Any connector to the data bus of this controller should be modelled using
+      the OF graph bindings specified
+    properties:
+      port:
+        $ref: /schemas/graph.yaml#/properties/port
+
+required:
+  - compatible
+  - connector
+
+additionalProperties: false
-- 
2.32.0

