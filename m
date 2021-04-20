Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CF7C43462
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 283F2613D9
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233306AbhDTQup (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:45 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49845 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233304AbhDTQuo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:44 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZk-0003aJ-AE
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:50:12 +0000
Received: by mail-ed1-f71.google.com with SMTP id l22-20020a0564021256b0290384ebfba68cso9613138edw.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:50:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fn7WNZfjW0ssAzIaE1Bkd1jfIrVSqjALIl9VWkYNFrI=;
        b=faUkjc7UVYmiDj82OTnQ6EDa57kXv0R+uTSyzkTvvaO0gUpwWBhX44uOQH2FtQ1jqb
         181fQlz8d5rkMYu8RR6ptS4WGsHTNsVHAc4MHnbyZK5OTMim5FdmcRSHg4fU1vsDTsUd
         rAf/dqE6Lz9QaXnJRJ5/mUmrQ1X3mCxPRAnq9VqAlvns13ZEGZXoMblsBFJPcQmRxM/+
         8+JCzc0YLrtYU83cOctT3GhckpyOyxwzwwwYEfSC9mx0dtp2qs8PyyPZm4IOYzPK21oc
         X25NYMsvYtwgj8Tufkn31I+K9vPPNUmTwvD6T1lV9+7UaMcSFN0qdewcxdBdMJxfolka
         tf5w==
X-Gm-Message-State: AOAM533QghD2OjgzCUloXnCQ5tNnuJlX4rOLYwnE0ryCyNt3UDW6ITnr
        kK8KhfkQbxMo2DvpshT2huBfsefEsbIShEghYrST2cIR+e+EaKK05EmTXpF4uA8UT6Xhv78SC35
        YtDYJxNhglBAgrsGe9QE7khFNGzFeO4J2baVBqWt0VuqkI+FG
X-Received: by 2002:a17:906:ecb8:: with SMTP id qh24mr29480541ejb.162.1618937410727;
        Tue, 20 Apr 2021 09:50:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQSsSBBW1PF+n0XJ+szv31xF4/G4mzXij8EuyYawNnaIWsWmfuu6kMMnZ5Oveq3ByZm6pv8w==
X-Received: by 2002:a17:906:ecb8:: with SMTP id qh24mr29480531ejb.162.1618937410609;
        Tue, 20 Apr 2021 09:50:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:50:09 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 10/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid XU3/XU4 family
Date:   Tue, 20 Apr 2021 18:49:42 +0200
Message-Id: <20210420164943.11152-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
References: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The RTC on S2MPS11 PMIC on Odroid XU3/XU4 family of boards can wakeup
the system from suspend to RAM.  Add a generic property for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 6d690b1db099..e7958dbecfd2 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -512,6 +512,7 @@ pmic@66 {
 		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&s2mps11_irq>;
+		wakeup-source;
 
 		s2mps11_osc: clocks {
 			compatible = "samsung,s2mps11-clk";
-- 
2.25.1

