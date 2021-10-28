Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA18BC43217
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 18:35:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 93EFC61040
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Oct 2021 18:35:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231178AbhJ1SiA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Oct 2021 14:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231211AbhJ1Sh7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Oct 2021 14:37:59 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCDB5C061767
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 11:35:31 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id l2so12284285lji.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Oct 2021 11:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0h9MI5+nWpL7nv3kn46aEjYMVGjl4934m5PO+DJKiLI=;
        b=MKEq0geXa1eT2tQFBS/WYl3gwCPfOmg2L0DmJjAS75wUxFQaLny2BqlgQqgc67JX8T
         1eU7Wo7elUOYI5w08gD3ujyLzYlT74MOXokrkpIJa3HLZiW8cVqXWM5wNjU2lfLhkLoI
         TIKI3YVP4DAws7hoQGvLzFOJqLhnG+mGZKyrMxjOt2lddr1jFBEIhgnXREPdMIDT+T31
         verhiIhT6LNatzJB3wZGR/qostXudLyIli6eDJiV0Fx6Q8yxhqKjjeDGQRt0C8169sdQ
         UbzsDpDwLlZt2GoI3GEuLPz4Tb+qDIrJsNkcK6Q0LHC8HEjEzaAXwPJrcC9w34NYfJhK
         2U9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0h9MI5+nWpL7nv3kn46aEjYMVGjl4934m5PO+DJKiLI=;
        b=xykhaml0Q83FHiNcfwC8dMcgiWlAzsyiO6kvqByNXx3WtxgNa8Jfnq5C7ztdynDepv
         zP4gO1lnIR7ih3OFbc9C7gwwczXRA1iHtkHj82ZSvlgonf2RRpzZIHa1I66CoJJ892KS
         No7/91F0xlhfpWMwJf19avIWOjqSmQplsio69GYELV1Z4igBOplWEUuMk87TWCqS4CJE
         x78VUNoBUFDLo57wj8EM9fBGGhTG142pqAlesAfXuyRWdkPODb9nj7LyR+46E90WoMjT
         HVpmJEjBx1+jwj+xVMgdr7BZ4nWJhlx5vHrNtlZeJe0UxkhdrwbQuvSdcb9H+oMmLvjk
         TYXQ==
X-Gm-Message-State: AOAM530mEBwUI00h69St6IH+2wNb1SMdrygh8BwW7/KquymLHDnl8zZz
        s6DVyUZP+JoG86xWwAL08D5Bpg==
X-Google-Smtp-Source: ABdhPJwxy/T1TXHAOSTfUZChLQnwHDSBgFoC2mGqdGsqWUdVRmYvf9KqsTRArBLOPGpZRJYiCdK+lQ==
X-Received: by 2002:a2e:a40f:: with SMTP id p15mr6597055ljn.497.1635446130085;
        Thu, 28 Oct 2021 11:35:30 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id r127sm389488lff.62.2021.10.28.11.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 11:35:29 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/7] dt-bindings: watchdog: Require samsung,syscon-phandle for Exynos7
Date:   Thu, 28 Oct 2021 21:35:21 +0300
Message-Id: <20211028183527.3050-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211028183527.3050-1-semen.protsenko@linaro.org>
References: <20211028183527.3050-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos7 watchdog driver is clearly indicating that its dts node must
define syscon phandle property. That was probably forgotten, so add it.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
index 76cb9586ee00..93cd77a6e92c 100644
--- a/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/samsung-wdt.yaml
@@ -39,8 +39,8 @@ properties:
   samsung,syscon-phandle:
     $ref: /schemas/types.yaml#/definitions/phandle
     description:
-      Phandle to the PMU system controller node (in case of Exynos5250
-      and Exynos5420).
+      Phandle to the PMU system controller node (in case of Exynos5250,
+      Exynos5420 and Exynos7).
 
 required:
   - compatible
@@ -58,6 +58,7 @@ allOf:
             enum:
               - samsung,exynos5250-wdt
               - samsung,exynos5420-wdt
+              - samsung,exynos7-wdt
     then:
       required:
         - samsung,syscon-phandle
-- 
2.30.2

