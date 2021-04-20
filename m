Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA03C43460
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 559D6613D9
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233309AbhDTQun (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:43 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49836 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233340AbhDTQuk (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:40 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZg-0003Zc-3q
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:50:08 +0000
Received: by mail-ed1-f71.google.com with SMTP id d2-20020aa7d6820000b0290384ee872881so9371798edr.10
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qfjGBaYEFblHkd553VwSn0+2ZqklK3J6fJwIYGGKLB0=;
        b=kiFdnzzlluKpLL/lGQC7v5689nvi2Y1Yxt7yYXGrrfQQoK6JUnfSEQy1M8BLeub26e
         J40qdGkeW3TOZPvrnjKepbJOv02ZHB/lcT3Eu77qMs1Kb4qf29Z+e6NQZMd7WzbZd8OJ
         VkLQwmYFAENXob4eFmeUpTG7quqaDfW98A4mplL7yi4BMWp9ZZz/qkUjivTUYN45ZeKt
         9aY4KojInXXSylpwSuwFu9bUee6EYsQgr7FBI1U7DzJknphZQHGiI2bABY0hxcc+/n9p
         5Y00MGNeJHqexZ8NDTsEL8IarBu0UkfMaNIgV7IT70EORQDR8mE1J/cmSUJV0sN5yYnQ
         tHUQ==
X-Gm-Message-State: AOAM532vwtNhBsmMMf0j1X2QQs82wm0EwaM4Ybw/AM+YgaxfQsG5ir+6
        vMnzW0Xsuq2wYck2NCgF2ScYb/E5673hLUrCHNPi5NA78vXXvDsIGEFI4VMFJFtPJAKIbbo4b6S
        uQCxRHmlDhoj7Cv5u89XAzFKg7Fh7DKniDbjHYKD7XabYO8ZT
X-Received: by 2002:a17:907:78d0:: with SMTP id kv16mr28383298ejc.174.1618937407839;
        Tue, 20 Apr 2021 09:50:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzt3lRVGoh8cst179jB4h9NfUTzzv+DW0UzRFLMekwlH45M2Ca2I32/cl7/sLnXBL+g1VBbqQ==
X-Received: by 2002:a17:907:78d0:: with SMTP id kv16mr28383289ejc.174.1618937407728;
        Tue, 20 Apr 2021 09:50:07 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:50:06 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 09/11] ARM: dts: exynos: enable PMIC wakeup from suspend on SMDK5420
Date:   Tue, 20 Apr 2021 18:49:41 +0200
Message-Id: <20210420164943.11152-9-krzysztof.kozlowski@canonical.com>
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
 arch/arm/boot/dts/exynos5420-smdk5420.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index d506da9fa661..a4f0e3ffedbd 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -132,6 +132,7 @@ &hsi2c_4 {
 	pmic@66 {
 		compatible = "samsung,s2mps11-pmic";
 		reg = <0x66>;
+		wakeup-source;
 
 		s2mps11_osc: clocks {
 			compatible = "samsung,s2mps11-clk";
-- 
2.25.1

