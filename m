Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AFE6C433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:49:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F270613D3
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:49:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233248AbhDTQu3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:29 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49803 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbhDTQu1 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:27 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZT-0003Vs-Bc
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:49:55 +0000
Received: by mail-ed1-f71.google.com with SMTP id n18-20020a0564020612b02903853320059eso4422455edv.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Fj7Vif2aTzH3tZdsi6YgQzN1WxIkWtk37rnugc0OEF0=;
        b=ESyVh7wa2O+en8Yve1c+AMvtUQ9ojB+umvgrWhUAcGwzeuPgTaoye002M+5piwxLjB
         RZHU9RuYbDuPfL5gF4QBQ5hNLCKDXOftIDwHn4d9acvZXAkUJorxuEonwjcCTyVVLdrA
         S+oh+adEyxm7MLWfFwU0C6KI5M85q0k5Al6ypg1pr7cBm2ZdkGW/0FkY2K88zCWCowFT
         pS5vx9mwSPpZLRKiFOtisXzKxesRfwkdirMDSjOK4152b7hlSOdq6VZx41HYbIUjWJ3w
         lOKKBaoZ9yILfAlALdiIzz2e+2gFPYomeurU/MXq/Yr7GdIiMgIHc76K4GRfGHgUC+gr
         r42Q==
X-Gm-Message-State: AOAM531PoWqddr1kwHGrtSwnUCi7PcnOpmqBvjWEMl/lQ/YpA4jOxmNV
        1i6NDSpdvWRrAwko5iRNO0rrNUwpuEfJugGu29kDmoft/UwnpZvy0g9prKS7CiWOMh2TaaVcLOL
        0yIlIOW3v5k2yH3xWpxJLCM5hdygjEp4v86QpjP7jRrOS3nVh
X-Received: by 2002:a17:906:b6c5:: with SMTP id ec5mr28557655ejb.290.1618937395092;
        Tue, 20 Apr 2021 09:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSRr6NSrHQp8U2jeiaffvf8WYW9iKm2uFgtdWnQa2quGs+NQghxGhwm2wVUg9G15AZRlNR6Q==
X-Received: by 2002:a17:906:b6c5:: with SMTP id ec5mr28557643ejb.290.1618937394964;
        Tue, 20 Apr 2021 09:49:54 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:49:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 04/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid XU
Date:   Tue, 20 Apr 2021 18:49:36 +0200
Message-Id: <20210420164943.11152-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
References: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The RTC on Maxim max77802 PMIC can wakeup the system from suspend to
RAM.  Add a generic property for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5410-odroidxu.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5410-odroidxu.dts b/arch/arm/boot/dts/exynos5410-odroidxu.dts
index 949c0721cdb4..884fef55836c 100644
--- a/arch/arm/boot/dts/exynos5410-odroidxu.dts
+++ b/arch/arm/boot/dts/exynos5410-odroidxu.dts
@@ -190,6 +190,7 @@ max77802: pmic@9 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&max77802_irq>, <&pmic_dvs_1>, <&pmic_dvs_2>,
 			    <&pmic_dvs_3>;
+		wakeup-source;
 		#clock-cells = <1>;
 
 		inl1-supply = <&buck5_reg>;
-- 
2.25.1

