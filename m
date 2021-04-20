Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D2BAC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 255EB60200
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233348AbhDTQum (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:42 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49832 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233288AbhDTQui (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:38 -0400
Received: from mail-ej1-f70.google.com ([209.85.218.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZe-0003Yu-9C
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:50:06 +0000
Received: by mail-ej1-f70.google.com with SMTP id r14-20020a1709062cceb0290373a80b4002so5014242ejr.20
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bj1M9QiCdlb898I0Pyior9VNVYymfqUZCE25Z1A8C8I=;
        b=Rwx0YKHHKIRxGB7Vo1PeR5U0eTTL2GmcnGEAKBKTkblXlxpdUiny5HzQPhtM5u08Ug
         62/ngoSXCgL3SIxwfMrzfYNLWd7CWyR/8rhLA5jQLgzF+sieV+GeiwBfa1UFSuSk2SnL
         tMmNwqXB3ZsZz+vM6pZgT50/dpKWKmvfHTlRXz8anRuQ7A4ZzMkRjwlha/SdRccRoLt7
         VybeY9jqsI+KBu44lbxsujLO3/CSDoPgNVLUK14uX4iEfjrNJkws8R4+FfPvTow+ENet
         b1/fpAlbHX9TOP9a0msVtWsggdL4v0PtpwIza1PLSyWKuCD3ZE/YXm0YK/gAkUfOPfd4
         AE0Q==
X-Gm-Message-State: AOAM530fQWDNhHl1qtOS8+hKAxd50eTZ5nu1zObYO3iT3peYz9raQe7i
        u6ThqXEtyF2+aAdk3MkrHEccGGXPyegUz9JSNtb8VHbI1nyGhLjS+T60De20d1QPbTO1i+Rs8hq
        R5MsovNwkJ9/Z+bIFxKV8o4keEm1FTYmbhHWqwxsYYTbe54aF
X-Received: by 2002:aa7:c40b:: with SMTP id j11mr33821643edq.219.1618937406069;
        Tue, 20 Apr 2021 09:50:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwOX41yAZ5d2I/3hC672/0TlhE2JqeKmJHyH8IhJtZIpVrL1kp4tD55KzYPmGl8DVxg0Ztc4Q==
X-Received: by 2002:aa7:c40b:: with SMTP id j11mr33821630edq.219.1618937405920;
        Tue, 20 Apr 2021 09:50:05 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:50:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Arndale Octa
Date:   Tue, 20 Apr 2021 18:49:40 +0200
Message-Id: <20210420164943.11152-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
References: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The RTC on S2MPS11 PMIC can wakeup the system from suspend to RAM.
Add a generic property for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-arndale-octa.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5420-arndale-octa.dts b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
index 1aad4859c5f1..dfc7f14f5772 100644
--- a/arch/arm/boot/dts/exynos5420-arndale-octa.dts
+++ b/arch/arm/boot/dts/exynos5420-arndale-octa.dts
@@ -352,6 +352,7 @@ pmic@66 {
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&s2mps11_irq>;
+		wakeup-source;
 
 		s2mps11_osc: clocks {
 			compatible = "samsung,s2mps11-clk";
-- 
2.25.1

