Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66645C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:49:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22A1260200
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:49:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232835AbhDTQu0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:26 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49797 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233207AbhDTQu0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:26 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZR-0003VX-Qo
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:49:53 +0000
Received: by mail-ed1-f70.google.com with SMTP id v5-20020a0564023485b029037ff13253bcso13440095edc.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:49:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3dMD592ElHi8nMETJZuVYSTLboZNsfqcXUmwdRPVf7o=;
        b=OkehA1M25NSmjcmLP+YphTAJ7uE1ZSW9J0hpjUcr+SSuokfKhaoSUIao0sFhSVncRI
         pJyHCXIiFmM1lylbzEQT+OD6uu/GPMxFKdLywxzhRCG5PQj8VYOTXZQUTAPsMKSWICwL
         ZVZfiUD6ehNaLVMCi88eUhk1WNj3aMYD4ieEiX4gzJ5Dede2M55YOuPfBGSZ7U0cPGRL
         OHSBMhQEASW62/jsyAX9QeXzl4szQ69as79X6SSxK4RBbRzwC3oTUdrCm4RV5i8MDV7O
         E5fcSPMoDLayTI7pHDbF0bkf6dwGVfImkNX4GInAlQh6i0rDj1NaKDhMZJ6cxpaTkbAj
         LVwA==
X-Gm-Message-State: AOAM533fz7QDVBDcwwwe25i3dPbm0WL3d7A1kP2CGaIpo871N67vwBwR
        df9DJCkXDXX1muw8o6Tp0j/uU+HK44A7E7buptp/Y4ZPAtJOgYYZMnY2wFFR8jk1Af064Ez9um2
        VobSY0Giwza3W5esRCe5avme72uwqUM1ul/dUeR4pQIxWoRgb
X-Received: by 2002:a17:906:3544:: with SMTP id s4mr29389527eja.73.1618937393514;
        Tue, 20 Apr 2021 09:49:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxml5h0MCp/k5aMeRiDFOFNo/wwzl9BNnecPMV2V8bC7mVCzWrVVPBCya4E8qd8HJd3A8nb9g==
X-Received: by 2002:a17:906:3544:: with SMTP id s4mr29389514eja.73.1618937393389;
        Tue, 20 Apr 2021 09:49:53 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:49:52 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Arndale
Date:   Tue, 20 Apr 2021 18:49:35 +0200
Message-Id: <20210420164943.11152-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
References: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The RTC on S5M8767 PMIC can wakeup the system from suspend to RAM.
Add a generic property for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5250-arndale.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5250-arndale.dts b/arch/arm/boot/dts/exynos5250-arndale.dts
index a161f6237c7f..a771542e28b8 100644
--- a/arch/arm/boot/dts/exynos5250-arndale.dts
+++ b/arch/arm/boot/dts/exynos5250-arndale.dts
@@ -218,6 +218,7 @@ pmic@66 {
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&s5m8767_irq>;
+		wakeup-source;
 
 		vinb1-supply = <&main_dc_reg>;
 		vinb2-supply = <&main_dc_reg>;
-- 
2.25.1

