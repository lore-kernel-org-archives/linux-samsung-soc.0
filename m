Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B07C43334
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  6 Jul 2022 09:50:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbiGFJut (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 6 Jul 2022 05:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbiGFJur (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 6 Jul 2022 05:50:47 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 984AB24085
        for <linux-samsung-soc@vger.kernel.org>; Wed,  6 Jul 2022 02:50:43 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y16so24950875lfb.9
        for <linux-samsung-soc@vger.kernel.org>; Wed, 06 Jul 2022 02:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sWRjbLgcGsk+PF/W1vIsSUB7oBAIadGQbfCzHFSPPVQ=;
        b=f7qRKlylJueDKrrf+d2P9hukohACvk/TsGOYTG4mYvAAFuDZC0uO+ig3rASDFoF0Mp
         gQfZ1d6FOUO+Dmh0+fQT6EdiEXn4aYwhrJflCw6MlJuoEL7Gwm4stTi1DiZFsdCx4X+X
         JpXo3tPufY6ToNsi+Ay1LLdyRvfTrMB/GdPGUDu58EvGSZjA7rADl4O3eMaryUTUs4yR
         IBgH8tiW0P4kVsmZpytPbcD58gefa2MhchjOVkaPKFdhR61rolQYvViKVcNCqA2D/ra7
         kOe79TwN+/phw0qNan7apBdzQ1tMQh9PjErZpuAlN6BKMB7t5fh1XAGWt2+lDpEnw5u6
         p3RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sWRjbLgcGsk+PF/W1vIsSUB7oBAIadGQbfCzHFSPPVQ=;
        b=d5viEZcFl9cq8hSE37jA+xhsgIaoj671StvN1qTusbTcCnu29eTxKO4Q01fh1tuKFb
         9w680Fj9O0DZnLU8LMdfNLORcO76UYaho+UraffeQWmBdB/2ZBOazlfkFHwhNPoYX7og
         n2HL2JJnVAqzS3LUxGvp5+Ffb+0kTDjaYCYYaCKatQiVm/VA4lqeMlIJ7Q5EDMhCYQ/R
         d+omDc3EJ91ZGyLdpkGJav9pZgPZAX4WGr+EJzPH+ehIeFlq+8AxjwDhjUCbHsIZ9ucY
         PT3fjQCyccwKhdFItY8ibC6DjThj20cyEr575bN1FjRcrafcHVtzZXVZjqFtJefYNJdN
         Hi4g==
X-Gm-Message-State: AJIora+a54cjDhzt1bVqb+SqWRYEkEJpwaT6wPcy08R8/E27/fZG7gPr
        GhgOgqtBxEPG2Y8odcIacKRV+g==
X-Google-Smtp-Source: AGRyM1tjGIig0pANF2xtlCJtvNimIqOEvE93EGulG/hQOkNwoA9vzQ2U76OfAf1uyeDMAtqyONwWfg==
X-Received: by 2002:ac2:4c42:0:b0:482:cb18:25ac with SMTP id o2-20020ac24c42000000b00482cb1825acmr7358648lfk.643.1657101041810;
        Wed, 06 Jul 2022 02:50:41 -0700 (PDT)
Received: from krzk-bin.home ([84.20.121.239])
        by smtp.gmail.com with ESMTPSA id bp23-20020a056512159700b00478f1e04655sm6202957lfb.14.2022.07.06.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 02:50:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] dt-bindings: soc: samsung: exynos-pmu: use abolute ref paths
Date:   Wed,  6 Jul 2022 11:50:36 +0200
Message-Id: <20220706095037.78542-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706095037.78542-1-krzysztof.kozlowski@linaro.org>
References: <20220706095037.78542-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Preferred coding for referencing other schemas is to use absolute path.
Quotes over path are also not needed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index a5d489acfdca..1835ca08416d 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -75,13 +75,13 @@ properties:
     const: 3
 
   syscon-poweroff:
-    $ref: "../../power/reset/syscon-poweroff.yaml#"
+    $ref: /schemas/power/reset/syscon-poweroff.yaml#
     type: object
     description:
       Node for power off method
 
   syscon-reboot:
-    $ref: "../../power/reset/syscon-reboot.yaml#"
+    $ref: /schemas/power/reset/syscon-reboot.yaml#
     type: object
     description:
       Node for reboot method
-- 
2.34.1

