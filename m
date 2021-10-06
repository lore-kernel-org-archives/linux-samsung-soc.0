Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC9A9C4167B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D9AC861075
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239069AbhJFN0u (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Oct 2021 09:26:50 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:51986
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238996AbhJFN0X (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Oct 2021 09:26:23 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E9AA33FFF2
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Oct 2021 13:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633526654;
        bh=/TxQjVg4dqdEH2Xf1um2+yFrWocR1Yxndc1y14FaRBg=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=jBxei0CuvIv7U2mU6yuFCvzM6tM/Ym/dETpaPEeiaP1o5+R+R/kuF+uFvhot3G401
         ss1VF3Pccv5TtUZq2vSzdnoOmeyUAeSF2q1IAJmHmzwHhUkbw1vcmR2pmC7QuQ+Zi1
         0dUCalssvz/7H0Jesl6oCUGjQd6yQaHoHhOL5UhvsWjIQXf6zEnkT5XcteRKJvR5qP
         KyfP5c0ilP20FF8jQbceUvBiqJSjAOG9D8Wy66Hnl8L4Ttc4eQo2KdtZJMU5lGbrqb
         jKdcqf3e1KpyvfiKv1kWEy/8LgB6Ypf4CF+WYdYUUrvXyPRyiaCOQoAuz0Hb42lQK3
         pYVpRVyZ7Udrw==
Received: by mail-lf1-f69.google.com with SMTP id f32-20020a0565123b2000b003fd19ba9acaso1992773lfv.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Oct 2021 06:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/TxQjVg4dqdEH2Xf1um2+yFrWocR1Yxndc1y14FaRBg=;
        b=z0eVc9QhlzkSEhvGYGF2trKsHgIz6kHd8LfSFqKMeom/rjCyFFL/vBr7TU+V9noiK2
         e8rvZAurWJmwqLLBzQ9kpD906csqojeSgX+ptN6427Q0p4rBHEASU3Pb31L04iCrbtlg
         7AGglpY1MoR1q6HaVYWg7U1ITlDD4HOTuLd/FC9IFK2ihAPUogHQ3c4wZSzZ1le4bpZo
         p7MhLjAy6GLPKZfwZxValDskHkXTiRHTCecil9HH2mlXTs4cahPt9p0JZic7CxTQx9GX
         q9N24ioMdWDz5Q/eV4dPu2ZZmg3cck6sZAWlsfqWE5MDitH0NCD4Q8E37gwYw0ye1TuD
         DmgQ==
X-Gm-Message-State: AOAM531D8MXA5h/nnZSkSgDjsmGTGx0wdtWi6AXculMY0b6fQAb430X/
        gvbp0tRrPm6WTMlMJWc0FKrlmo0BeOszibNVpYi2pzaqimYnM0SXgioS5lU2MA+ewz5eItpSvC+
        wgCMkwc7es2KgOhuZkhZEof3tSZlalZ+D5IDTI3XljhFO+lpn
X-Received: by 2002:a05:6512:239d:: with SMTP id c29mr4977144lfv.298.1633526654165;
        Wed, 06 Oct 2021 06:24:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzyxI9DCzgHmNifB29wk0t7bWAAJ9cLaVRutS7AHt+PrtijiOQ5EPAj7BrzLpCD5bUEE/p/rw==
X-Received: by 2002:a05:6512:239d:: with SMTP id c29mr4977129lfv.298.1633526653997;
        Wed, 06 Oct 2021 06:24:13 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y12sm2002819lfg.115.2021.10.06.06.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 06:24:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v3 10/10] dt-bindings: mfd: samsung,s5m8767: document buck and LDO supplies
Date:   Wed,  6 Oct 2021 15:23:24 +0200
Message-Id: <20211006132324.76008-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the properties with regulator supplies for bucks and LDOs.  At
least one board uses it (Exynos5250 Arndale).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
index b2529a48c890..12dea5aac8b6 100644
--- a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
+++ b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
@@ -96,6 +96,44 @@ properties:
     description: |
       GPIO specifiers for three host gpio's used for dvs.
 
+  vinb1-supply:
+    description: Power supply for buck1
+  vinb2-supply:
+    description: Power supply for buck1
+  vinb3-supply:
+    description: Power supply for buck1
+  vinb4-supply:
+    description: Power supply for buck1
+  vinb5-supply:
+    description: Power supply for buck1
+  vinb6-supply:
+    description: Power supply for buck1
+  vinb7-supply:
+    description: Power supply for buck1
+  vinb8-supply:
+    description: Power supply for buck1
+  vinb9-supply:
+    description: Power supply for buck1
+
+  vinl1-supply:
+    description: Power supply for LDO3, LDO10, LDO26, LDO27
+  vinl2-supply:
+    description: Power supply for LDO13, LDO16, LDO25, LDO28
+  vinl3-supply:
+    description: Power supply for LDO11, LDO14
+  vinl4-supply:
+    description: Power supply for LDO4, LDO9
+  vinl5-supply:
+    description: Power supply for LDO12, LDO17, LDO19, LDO23
+  vinl6-supply:
+    description: Power supply for LDO18, LDO20, LDO21, LDO24
+  vinl7-supply:
+    description: Power supply for LDO5, LDO22
+  vinl8-supply:
+    description: Power supply for LDO1, LDO6, LDO7, LDO8, LDO15
+  vinl9-supply:
+    description: Power supply for LDO2
+
   wakeup-source: true
 
 required:
-- 
2.30.2

