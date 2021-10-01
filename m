Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA95C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 09:42:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 17370613A0
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  1 Oct 2021 09:42:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353244AbhJAJoK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 1 Oct 2021 05:44:10 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46856
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353240AbhJAJnp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 1 Oct 2021 05:43:45 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9BD0C402DE
        for <linux-samsung-soc@vger.kernel.org>; Fri,  1 Oct 2021 09:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633081320;
        bh=ckAlTotIT3HkVFofNi6oKZ9ggPor2IJzjyZD14XCv6I=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=Q/bWqUCrglWFHmdcM/y07AdlbSlNDZGH7L21cyKGtKGmq3rgo+AwYQXjjzMGoQpoW
         f03FZnvcwA9DTH5JiYXRhOdhBY8UbtsInMynyCT/5kEeh7rhNkcbr5mApySvJGZ6CJ
         LEnD/6Z5u0ykFgQZZtK9P7Wd+wso3qVR9FyRJ67aV1WgHerBIJyCEJ3G4Jp0Pd3WlB
         vVwPnj2uKT8ivkA68QFKNZ6lfcmE6ljNoIYLTPPaGsFz1lUBp1b1EGtRC1F7DDGtHp
         ijR6avYH6D3k5+GsrgT6r2qZxcdcQS2/w23QKcRHJFt4YbXKND0sJzN76fSwr8F9+L
         L0Y99DqHuNS0A==
Received: by mail-lf1-f70.google.com with SMTP id c18-20020a056512075200b003fd0e54a0deso7554052lfs.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 01 Oct 2021 02:42:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ckAlTotIT3HkVFofNi6oKZ9ggPor2IJzjyZD14XCv6I=;
        b=O2/Cv0TjIX7pu8AMG51lUC+lnxY5mbDy9zyw5fFPsnf89+MbmYA3AMXoWuOj0jwYs8
         4xC1y9pCS3kcPls2tUUrCG3mQHqQ1T5neCoujaC7pS2VjnV/rmNJ8+NaR/B9uhkxFwqL
         80q0SqBe4pd2rJEiKrleHOjx6sN72scvgPVucpLpDFnLWlt5UiM5Zf5B38HaMhH6WVYM
         S0WSrq0M1l9rYxfCkjNnIjP9bg8y64ScukYfqe4u+i31wfEl6Hk34WOEO9BjK/IFPYnw
         Zc4poblSkQx4VrSni6nLICZhmVs063Qg986wZYGbWSDoX3ktU1BRersu0P61AODaH0d3
         6tQw==
X-Gm-Message-State: AOAM532JGMUDVZom5ygVJMEMv6iTJLorn+NM8uTza1rci8OqoeVAo1iP
        4vkvc+osGu1s/a+L3R62cCRcBT1vVZ5HkcwEkLJlu9ikNTV6V1dhDfOnF/+tFTcJjx7outMlpmF
        IAXwVvDraoHB+KohSclaO3uZL2J0L9H0J+aa26LA95k1luHiH
X-Received: by 2002:a05:6512:3082:: with SMTP id z2mr4517804lfd.330.1633081319783;
        Fri, 01 Oct 2021 02:41:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwL+pVrLU2hACEbfMq1WCV0FKqNZxMiAkc83hd5rhMaSi/yXZ6C79H7J6ivvISYJNv9CRkFwA==
X-Received: by 2002:a05:6512:3082:: with SMTP id z2mr4517793lfd.330.1633081319619;
        Fri, 01 Oct 2021 02:41:59 -0700 (PDT)
Received: from localhost.localdomain ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id g29sm673784lfj.212.2021.10.01.02.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 02:41:58 -0700 (PDT)
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
Subject: [PATCH v2 10/10] dt-bindings: mfd: samsung,s5m8767: document buck and LDO supplies
Date:   Fri,  1 Oct 2021 11:41:06 +0200
Message-Id: <20211001094106.52412-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
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

