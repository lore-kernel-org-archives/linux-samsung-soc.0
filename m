Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41478C4321E
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  4 Dec 2022 18:29:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230418AbiLDS3h (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 4 Dec 2022 13:29:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbiLDS31 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 4 Dec 2022 13:29:27 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22FA012D1D
        for <linux-samsung-soc@vger.kernel.org>; Sun,  4 Dec 2022 10:29:23 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b3so15352637lfv.2
        for <linux-samsung-soc@vger.kernel.org>; Sun, 04 Dec 2022 10:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k3M3VyN+gt6ftGeaDe6rXF+qMLaJNZCrheDPOaVNkN4=;
        b=Ds+u0ZbE0sJq/iBjWNK+IxPNbNDviPYZcAp+xql3tG9OD0vWUJ8mfgXG/Vaw9ddwiW
         xEav0N5hivFM+WsRUKsisnKVi+OmcpfL+dZh8IyGIx3ry1F7tciUd61J6xe5BkkBOu35
         qcgH6KTuszPG+CggawH1zVfd+rwsK/WqTeoFO4uhXP40rVGDcGMBqo3AJ7jCC99KeYuS
         3slDIWRZWydsycY6PPEmkDMDfNgcnAMpx0XUZpzcDVZls3N9jS2EkxyZUeIlfG8lW2To
         BbA7HiVcq1qaBvak1jJPKyygT50cVcPfUrAjRvEflATLZXrFKApwLkzPdn4FeUE+3iUa
         XySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k3M3VyN+gt6ftGeaDe6rXF+qMLaJNZCrheDPOaVNkN4=;
        b=JhyMgJV8lRllkHdGyBvIrY6zDgH/hMaihU304cCB02kSRbizOgTxuppgIuCJ3nfE++
         Lawr4HhWW38y8/EwtFI21MjPsVUbvzWtnlag8VM8sBacpdpEHYjqerjLqVoHvmwBvcMY
         o8JbvBzke+jcx1z3TOc+q0cO6+iKdGVYP9qfoAJ4luEU7NuQikZtGv5pifCe17PRBseN
         AnKI1Ti2UeNu0haltjr9O+uRZTjmRuC+uiDeNJBfHEVkrXKwz+QfQBrZRVWpTg6GeSq5
         UMi8eR0kL3lrOze+GoQp0d4DbKrbvkqwEQmFw1aOUmYLAhRNmjBthfrR3BYNJCFIsrx9
         B9Hw==
X-Gm-Message-State: ANoB5plcwrigjQlwY80g1tDxsJMobJicAeIiOQRtliwQ/PVv+ePzGDV3
        yXD56NSOmtpsr4xDxHjc72OCaw==
X-Google-Smtp-Source: AA0mqf6pY51XPJcwK4YklKJNLUWc3bAAU36hqO/Jj5kXIUWVKjswhYHVnyQo7swA5lN98jdcrzxwiA==
X-Received: by 2002:a19:f713:0:b0:498:f36a:76fa with SMTP id z19-20020a19f713000000b00498f36a76famr27418948lfe.532.1670178562707;
        Sun, 04 Dec 2022 10:29:22 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id i15-20020a056512340f00b004b3b2a9f506sm1838996lfr.4.2022.12.04.10.29.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Dec 2022 10:29:22 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Alain Volmat <alain.volmat@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Joe Tessler <jrt@google.com>,
        Yannick Fertre <yannick.fertre@foss.st.com>,
        Jeff Chase <jnchase@google.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 4/9] media: dt-bindings: amlogic,meson-gx-ao-cec: reference common CEC properties
Date:   Sun,  4 Dec 2022 19:29:03 +0100
Message-Id: <20221204182908.138910-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
References: <20221204182908.138910-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Reference common HDMI CEC adapter properties to simplify the binding and
have only one place of definition for common properties.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/media/cec/amlogic,meson-gx-ao-cec.yaml        | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
index f65c9681a9f7..b1fab53418f9 100644
--- a/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
+++ b/Documentation/devicetree/bindings/media/cec/amlogic,meson-gx-ao-cec.yaml
@@ -33,11 +33,8 @@ properties:
   interrupts:
     maxItems: 1
 
-  hdmi-phandle:
-    description: phandle to the HDMI controller
-    $ref: /schemas/types.yaml#/definitions/phandle
-
 allOf:
+  - $ref: cec-common.yaml#
   - if:
       properties:
         compatible:
@@ -81,7 +78,7 @@ required:
   - clocks
   - clock-names
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1

