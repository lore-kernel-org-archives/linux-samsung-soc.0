Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A9AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 17:16:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0896C60F21
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 12 Oct 2021 17:16:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232221AbhJLRSb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 12 Oct 2021 13:18:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232134AbhJLRSb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 12 Oct 2021 13:18:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31020C061746
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2021 10:16:29 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id r19so87661779lfe.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 12 Oct 2021 10:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c+pdIjVhlHP+7rLIgR547hoyyJNbKcaM94b/z/uUGNg=;
        b=RMnxV/1YtFxE7Q8wud9+d7bLEPHNyIGrs+cww//wo4ndpXbcuTDow3HrHd081pG4V0
         5Q0k/GeBegYJYpQwP59zv7lkhB+1vGA0LnH8HkXvBuMiEA+mWhcppcijyksHAuqvwFF3
         13h+A+uTXW8KeKFP2BhWCwfdlsdNu+lwzVP1FuH6zbTvMlaDoPNhUVPuZUB8s5OfrVAG
         ofn2YRiZhB65RZMJNoM4priMldiaw809Gq7hhCATJ8ly45jDGSjrFKKGprZJaXwEb707
         LaJSy66soeYeZ5CPhdFwaa/NMMcEWH9nV80y3vcuG/ncHGn/YAAt4KjE2wGwWGZTslVM
         HVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c+pdIjVhlHP+7rLIgR547hoyyJNbKcaM94b/z/uUGNg=;
        b=QeQPYTg/3qTZpjJK50q/PdBNidlRy1aEeDfKc0DHfO0dyWTqRvoRxL/vIdfcCFVft+
         9mOeQD+cjpY9kkRTbRnOJOCstfM5/6shxBd6dprJ6eP7A0VE+G4pXS0b4FZj5WTyuQW9
         l/yee7f3isuBuxWdu1BKE3bn2ptoXpnq8ajxCnGFm4Ibhh0cTkBgiDw2Al4egleS0JCk
         w2GWYO+KZxHiiqMUv/AXsZqB1RzH4pUeVGi/UF5AQM2pW5R8v0dWWdIvqrbasXRf0LPa
         RoFqWZpnAvbrQOD167M1K89moKlE7bhq8qqWjM7wCx4vJqAokQl8laaGvBjZJVzZN1RD
         Z40w==
X-Gm-Message-State: AOAM532TiusGPlGNkIb/obJtqUDejlTZLdf4hULrcd73JoLgLYS5h4LF
        Dh0pI2rlNup00ho9i1/o32rIpjd3F2lk0QP7
X-Google-Smtp-Source: ABdhPJwwNkuxXjuENhbZ78o1lnzW5pPti+1zbyB4pQWzpRNwws0NrIb+iSfvg3PU0C0WWVi2Z3/cRQ==
X-Received: by 2002:ac2:4bc2:: with SMTP id o2mr32675620lfq.462.1634058987323;
        Tue, 12 Oct 2021 10:16:27 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id k24sm989627lfe.76.2021.10.12.10.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 10:16:26 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: samsung: exynos-chipid: Document Exynos850 compatible
Date:   Tue, 12 Oct 2021 20:16:23 +0300
Message-Id: <20211012171624.14338-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211012171624.14338-1-semen.protsenko@linaro.org>
References: <20211012171624.14338-1-semen.protsenko@linaro.org>
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

