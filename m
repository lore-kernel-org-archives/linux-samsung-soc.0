Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77E6EC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 20:21:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54EB9610F9
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 20:21:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbhJMUXU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Oct 2021 16:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229555AbhJMUXS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 16:23:18 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3171EC061746
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 13:21:15 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u21so13848332lff.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 13:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c+pdIjVhlHP+7rLIgR547hoyyJNbKcaM94b/z/uUGNg=;
        b=mUKylLN0rmroc7iuJFfT8v5mKbMKa0vrIVpPwGOZfgE1DA5AMzomYi78UPeXsPtFlD
         JNmzE1mQotpBQy9iA10PpWwn1B7kv04/5mOA43jMANaCCgWI2ZuieVoI6gso6nfd0PYE
         8FfZYOuYw/T+0+uKeE6kvE/Y4it4+nVMKq7hc8VaPRV+zIoId9jA3NON4aA2feMlpS6h
         zj91YsD+GIL1zz4nVj6QuX+/RLU1hFEPmFV6VHaT11D2Eh10t/gX3aibbEZWSt0EBw1x
         owgKRxIRZzFSA1YLAjThZ/k+ExiOVwVz5pecaasIC5Ws+ICpIk/EZWujeHmnn/cl42I8
         t4qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c+pdIjVhlHP+7rLIgR547hoyyJNbKcaM94b/z/uUGNg=;
        b=GWM2SOzX/tpQLlCFZzS4+hAr0VjM5jI4lgO0RqaSyNiq0M4WkYu8cMzIeJgczXe4cP
         GbkCFbqmYvUuId2EV2XxpFZdU5YNwU1KJwBp0ZatC6Hv6qhScIY6kOS9AxFCa/ZPWC8Q
         v2gke+TJv+LKY44mS036DsRCqIuveG0tMbZdL9/HLSAg8eeTcUaBhScF8k1r6jU1SWPj
         SvPOFnxvVidj1HF1c/mm8lxAnuZ3WgjBHiKAHGye2YcgC2S8cVNnvXHhbD8rN5XPvLwt
         hpz6wIbuFPdbxtkDCgSRERkKYylveWRglnkjtpR3QjUd/Pdjm4P2nYguReBsQIGFTtpH
         tGJA==
X-Gm-Message-State: AOAM530clDr0JSs9zTIM1GJiET2oUC87M37YUcO3hJlAD6Iz5RrGd/FO
        JbZj9OWo0I0AmcEnsa9EVnb2dTwgYEJprTMK
X-Google-Smtp-Source: ABdhPJxPwBPXAbXW7RzLbkgwhZFxOovy0H0wBCrL/A7/65cB6zORLS1yJXZVdUrexPiIl7I/lxKVoA==
X-Received: by 2002:a05:6512:3048:: with SMTP id b8mr1041308lfb.517.1634156473544;
        Wed, 13 Oct 2021 13:21:13 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id bd19sm53567ljb.28.2021.10.13.13.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 13:21:13 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: samsung: exynos-chipid: Document Exynos850 compatible
Date:   Wed, 13 Oct 2021 23:21:09 +0300
Message-Id: <20211013202110.31701-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013202110.31701-1-semen.protsenko@linaro.org>
References: <20211013202110.31701-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add compatible string for Exynos850 chip-id. While at it, use enum
instead of items/const, to reduce further cluttering of "compatible"
list.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 .../devicetree/bindings/arm/samsung/exynos-chipid.yaml       | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
index f99c0c6df21b..bfc352a2fdd6 100644
--- a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.yaml
@@ -11,8 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    items:
-      - const: samsung,exynos4210-chipid
+    enum:
+      - samsung,exynos4210-chipid
+      - samsung,exynos850-chipid
 
   reg:
     maxItems: 1
-- 
2.30.2

