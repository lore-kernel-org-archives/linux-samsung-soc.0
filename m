Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFAA4C2B9F4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Jun 2021 19:33:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EA0B61246
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 14 Jun 2021 19:33:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235050AbhFNTfV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 14 Jun 2021 15:35:21 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35363 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234772AbhFNTfS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 14 Jun 2021 15:35:18 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lssKg-00009Z-MV
        for linux-samsung-soc@vger.kernel.org; Mon, 14 Jun 2021 19:33:14 +0000
Received: by mail-ed1-f70.google.com with SMTP id c12-20020aa7d60c0000b029038fccdf4390so20804602edr.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Jun 2021 12:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P0NAZ9mvHQKtho19Kodk6x42SkLdwGG//84ME/Va0gs=;
        b=mKx9y10yNJnQCaVvGDjmtAFsCS/sjGQB0Z4+joQV8qsQiy/0FONs6Y2ihVsOlI4/HT
         IiXw2FcjBf0DsOhpFydCRlYUW0koJ+tgcx8n03CjsxoI10qkKbcozM0TNiQyZ+MEpVZl
         w2U8nZt8m/cRcG57KVLKQtwOowX+E5UQMhb5G7slycdtCNSR70GbXkXJBEcgL0aV6EGI
         TC9Oq/n/rjaKlzD24lkfjDVwL9nNBfVgSHriCssrXukaLL/kDxbBm4NZinclMLvArgxS
         +7g7AU0eI2YJ/zamKS0PPl4fp8SizPe5AerdjDH/C8fddbrv3lmuncWYqjIKOQzyUGzf
         hMAg==
X-Gm-Message-State: AOAM532weOv1ubGgy4Dawciy3ZzOkaPcIrALDM1Sz8KTUXeL5Uk5jLhn
        rP7nGvlRXoEM8M2Jk/FBtUFUnfeGNKoAiOrKpfRBi44zApUH0NOQoN85n/S0xnV+QTebj8M7g4i
        eIossA67yKr4m5fszsaOSXDWvNlRgcsEwETee5CVVU4AMPPQL
X-Received: by 2002:a17:907:948c:: with SMTP id dm12mr16836646ejc.484.1623699194475;
        Mon, 14 Jun 2021 12:33:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyegN5ZDLDC6CBLPN9tGzm/ZZQeDNEXIQaiFCbsU2xFKTD2cPTtg93ymP/DXtEWH2egOhXeeA==
X-Received: by 2002:a17:907:948c:: with SMTP id dm12mr16836631ejc.484.1623699194295;
        Mon, 14 Jun 2021 12:33:14 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id gw7sm8029291ejb.5.2021.06.14.12.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 12:33:13 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2][PATCH] arm64: dts: exynos: enable PMIC wakeup from suspend on TM2
Date:   Mon, 14 Jun 2021 21:33:08 +0200
Message-Id: <20210614193309.20248-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
References: <20210614193309.20248-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The RTC on S2MPS13 PMIC can wakeup the system from suspend to RAM.
Add a generic property for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Link: https://lore.kernel.org/r/20210420164943.11152-11-krzysztof.kozlowski@canonical.com
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
2.27.0

