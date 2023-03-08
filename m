Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85B54C678D5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 23:09:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230110AbjCHXJj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230093AbjCHXJg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 18:09:36 -0500
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com [IPv6:2607:f8b0:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE0A62B43
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:09:35 -0800 (PST)
Received: by mail-ot1-x329.google.com with SMTP id f19-20020a9d5f13000000b00693ce5a2f3eso97153oti.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 15:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678316975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J5PJqs5BsEDG1wdBjWwvXsmxEV4UYqM9XMe4BPKxtuE=;
        b=ZU2X+gAAyNbrZY+ccoI8srKvzJyr8um35igO3wIc7sMBIwllqYYzfzRU6hDuVGzBr0
         Z1nYOwbnWSEU2h/QgERS5S+ydFsTvlH6nNRE6m/j2Ky9GxN0Ci41a7LPYHEiiTVxReeS
         5/rsNyudWq6Ka5nqw1VCHvBgAFvmaBpkSChwE6nZBj4I59II15cjF9FSygL2ikudqtxw
         qHohzOZJtqX/gh0emEUgvxEyOY7gXKgDlB3fses6xEISy921rs9AcR/5Pl2Aa9G8erh1
         ykGcKppFLstx1j6aEsp4/FwxKopraCwUk/BgBZrvZbWjl35uDJagPNrJBvQ8ucaq8GfB
         0JTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678316975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5PJqs5BsEDG1wdBjWwvXsmxEV4UYqM9XMe4BPKxtuE=;
        b=xMELbmNpFnhyu39KwMBKPqneQXP3afQBFXNgOkPrK++sSg7l8qI6bossFVIVt+1mEA
         tdJsM0XKh5FbSTgaKWz0y5I7X33mM4X4iAC8xcY4DG88oosAPYHhhxVsSWbAhcL8Yr6r
         EWy45/YTz++Km6MeBbG6Md0+yiu3k/GpFC12yycbn6QyxjSvnIi16MtAKkmgjd/vkF/d
         aTVWqF378bLnx/GEmlRCL3uerflSn7hfjJNFnYZ8wBza/DsbP4NG7UPWdZzY/se8UVS0
         +78Q5CLrlhx4khBK3FzQAy3RdLMzD9LlcJTRwWU9WtiW3pKVI4SUbEIK1nJ+hQmhEVqq
         IV/Q==
X-Gm-Message-State: AO0yUKV6F8u8mJl5OuetoLc4WbNK7VNRFxYWzGjt7OmL0MyJv+68t/6M
        vtcfB3MDPY/MSb6g5QTo5XG7kA==
X-Google-Smtp-Source: AK7set9Bws1cMOebllDwvv/UMswljCg2/saQYhCNiwvbJgz55DbPlRXex9ohzIAXXIZMreMO0qAwgA==
X-Received: by 2002:a05:6830:1f42:b0:68d:41b2:5b75 with SMTP id u2-20020a0568301f4200b0068d41b25b75mr9166479oth.11.1678316975008;
        Wed, 08 Mar 2023 15:09:35 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id q24-20020a05683031b800b0068bc48c61a5sm6976067ots.19.2023.03.08.15.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:09:34 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] dt-bindings: power: pd-samsung: Allow pd nodes to be children of PMU
Date:   Wed,  8 Mar 2023 17:09:27 -0600
Message-Id: <20230308230931.27261-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308230931.27261-1-semen.protsenko@linaro.org>
References: <20230308230931.27261-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Introduce a new "samsung,pd-index" property to choose a specific power
domain. This way it would be possible to avoid specifying any addresses
in power domain nodes, relying solely on syscon regmap from the parent
node (which should be a PMU system controller). Therefore the "reg"
property is deprecated now, as it's more logical to describe power
domains as children of PMU node, because PD registers reside in the PMU
area.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../devicetree/bindings/power/pd-samsung.yaml         | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/power/pd-samsung.yaml b/Documentation/devicetree/bindings/power/pd-samsung.yaml
index a353a705292c..73178b1a56ea 100644
--- a/Documentation/devicetree/bindings/power/pd-samsung.yaml
+++ b/Documentation/devicetree/bindings/power/pd-samsung.yaml
@@ -25,6 +25,10 @@ properties:
 
   reg:
     maxItems: 1
+    deprecated: true
+    description:
+      Physical base address and length of Power Domains area (if not a child of
+      PMU).
 
   clocks:
     deprecated: true
@@ -45,10 +49,15 @@ properties:
   power-domains:
     maxItems: 1
 
+  samsung,pd-index:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: |
+      Power domain index (if a child of PMU). Valid values are defined in::
+        "include/dt-bindings/power/samsung,exynos850-power.h" - for Exynos850
+
 required:
   - compatible
   - "#power-domain-cells"
-  - reg
 
 unevaluatedProperties: false
 
-- 
2.39.2

