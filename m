Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4775C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE9C9611C7
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239931AbhI1Iwd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 04:52:33 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48590
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239780AbhI1IwI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 04:52:08 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 084A140848
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632819013;
        bh=MrRtMKWESY45De0HF10TbNHiqJiU4JWtrfj4T60+/KM=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=aKC4PBD2LT32Bsz182e/KvY/69M6L4uN3b5JUefHjHH5vUhak8IOLpGDPdmE0ZAUn
         H+V8NPfQZMsbXY4SMuRBxpDclPBfJ0qUSRqnHmra9rUNB+bZKo32YyeGSfPHqn8n0r
         b2yhJzJEYinsfXAKCOXQPKGYi+IwjsvuBM4HH68gbHOu+G14TtVWeyMSRc97tRfK5c
         SroOuOZAnH6mrAHbdlyQ/hzxfqnFBoyHrLPFOnJuG0skVaOfYw52dRz2Sj5Q/RbGhV
         3F2gcEbpwM8MarHSgJkLK8xAh85cL19a6/3jbKyYopzAHJYVfiI8H2fxBfUPz0RPie
         HOnEYl7Q/6okA==
Received: by mail-lf1-f70.google.com with SMTP id d22-20020a0565123d1600b003fd0097d747so729996lfv.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 01:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MrRtMKWESY45De0HF10TbNHiqJiU4JWtrfj4T60+/KM=;
        b=RvhJd9YBOFq/piK3k1ttgpcdPMxxgpteeg4i9Vipxp9cdGNtDKL2tvzKAuGEY6mxk0
         j2wJRKEZ3kbnO+OodZrsn4uTC8AzvUc2yPcBZ6SEH1mLfwdvj0q41RprXTRXWdmwvpME
         j5PdEYLfqVSBthgRT1Nc/X6mUxFhusALLRidBLiLkknXdqGkip5cCDICw9HdfFv/fRYj
         N4khra8tXG+NXu9LiYHGQm2Fsu83xwfpZsZFh8VPH0CAJu+yWvrAQjVRt+YzFcg0jI5q
         Kdtu5R1qIxwKCCHCn3U12ts6DQ1skPGa4ruj24d/ewbDic3/GnC0BMerrwvTqZL8uAch
         POKQ==
X-Gm-Message-State: AOAM532xXgmFf2SPeDV2JO/lbTj99bByqTpkvYN+I6lQDPVtsNze0WDM
        WTyEOtI6kLiKjKYjaFMACRF9YtILxIxEGruitzSgbD37YEH0PItABFU85AqJmmESrdWQXHL8k7+
        DyA+MIWJ75iwzOm8piGYleSN/2OknwxFxy8/HYAYKkRj72sNU
X-Received: by 2002:a05:651c:1124:: with SMTP id e4mr4530590ljo.261.1632819010966;
        Tue, 28 Sep 2021 01:50:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeT9hh5MikDORvgeeNHLdkoBlQ51tYUHQvGyxCDV/oLrmwZnjOgz8Pgq3riPZog98Bec4NGQ==
X-Received: by 2002:a05:651c:1124:: with SMTP id e4mr4530572ljo.261.1632819010805;
        Tue, 28 Sep 2021 01:50:10 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:50:10 -0700 (PDT)
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
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 10/12] mfd: dt-bindings: samsung,s5m8767: document buck and LDO supplies
Date:   Tue, 28 Sep 2021 10:49:47 +0200
Message-Id: <20210928084949.27939-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
References: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Document the properties with regulator supplies for bucks and LDOs.  At
least one board uses it (Exynos5250 Arndale).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/mfd/samsung,s5m8767.yaml         | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml b/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
index 35018346f68b..e97a94cab4e8 100644
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

