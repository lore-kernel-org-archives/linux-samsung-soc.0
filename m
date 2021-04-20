Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839EEC433ED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F5E1613D9
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233390AbhDTQuv (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:51 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49847 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233356AbhDTQuq (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:46 -0400
Received: from mail-ed1-f69.google.com ([209.85.208.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZl-0003aN-Cj
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:50:13 +0000
Received: by mail-ed1-f69.google.com with SMTP id m18-20020a0564025112b0290378d2a266ebso13439714edd.15
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TqJ62+H3p8lMBv0o+qNlrq3mJGwE89Butuxlq5byZWw=;
        b=VCjzDh/SCP1ImbIqhd8637DL3eY2OR5lw/0gcgEcgqlNQh8xT1V9NJU3a+31L1l+Re
         verjqap2J2yEWkI782fnafqRbWfnIGGymPAQszJBrOyMnkIQmJW/c7LJ4HHYnBC5/zPa
         1gFqMZC5Kz+OvuYKvXLVOKqTqgjvr5Z1dYIep82LOSu9wjKZ8SJMoB1oViHavbU1RSBp
         7LqoRD6gQr/pASy/w8PopwwLmb9izw4LlnbDF1ZXs8pjNLvvJebKJXi8YXz+vKuJdy/8
         GqDRqkdLgJ1QOstU5+L3wrA00QdiegW3jd6YsEcH0GOoVjmTjioiLaNa15HCPaAVPOW0
         ikRg==
X-Gm-Message-State: AOAM531b5re81lHcU8pX6LwdNZvU1vu3AdinZMSaU9X3/+gnplmJDN0/
        s2E6ptHlzTe4X0mc4Ndh53v6UhWjS2647AQ0TBFPvyOp9zvHXBB7LXuArUknUsuuxlJagMDzBb+
        xs8n62/Ei6IKbSKHfQFQBE7NOj+fdfMONq3jSPd9yRL4GT4Cp
X-Received: by 2002:aa7:cd8b:: with SMTP id x11mr4729064edv.87.1618937413135;
        Tue, 20 Apr 2021 09:50:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDDo9ukF3fqdtjY4XRoahPeCfemNkf0eD5yfTKHEHt5tiIkyXvhXPIhPPUxhSQBt2RR4Vnrg==
X-Received: by 2002:aa7:cd8b:: with SMTP id x11mr4729052edv.87.1618937412975;
        Tue, 20 Apr 2021 09:50:12 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:50:12 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 11/11] arm64: dts: exynos: enable PMIC wakeup from suspend on TM2
Date:   Tue, 20 Apr 2021 18:49:43 +0200
Message-Id: <20210420164943.11152-11-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
References: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The RTC on S2MPS13 PMIC can wakeup the system from suspend to RAM.
Add a generic property for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
index 773d9abe3a44..cbcc01a66aab 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi
@@ -391,6 +391,7 @@ pmic@66 {
 		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x66>;
 		samsung,s2mps11-wrstbi-ground;
+		wakeup-source;
 
 		s2mps13_osc: clocks {
 			compatible = "samsung,s2mps13-clk";
-- 
2.25.1

