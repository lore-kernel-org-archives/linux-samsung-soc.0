Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCA29C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 866B0613E3
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233278AbhDTQuc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:32 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49810 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233255AbhDTQua (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:30 -0400
Received: from mail-ed1-f70.google.com ([209.85.208.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZV-0003WQ-Sz
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:49:57 +0000
Received: by mail-ed1-f70.google.com with SMTP id n18-20020a0564020612b02903853320059eso4422514edv.0
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:49:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+QGIfs0xu2iWGBhjfxFAoqeLLE0TQoKKNcQGnUSArgQ=;
        b=SCkfKSSaNkVqVh14Ajn7bLVrrTAQ7YNhlHmuvm/ZZPTqZuJTcrVlEw9MG8z0qQNhtU
         tzyfEX8K/BD0X3nQAOOIp3m6eBR7VFMzK2rFhKcMtRf78T9Bg+mgDjqp6gCyA23LeIqt
         SJUElaAKsx0mErJziphlm/VhIm7kDuU3uLcyA3hqQ53XiPVp989KJRpcWQ3MnI+5w0WF
         h06IvSSJsdNtTr/JpT/2tJsOXhPdqHF8tYOOWiqpgJNdNUr98KagBzvmm61cGsR9WfzW
         k1pxG7YQB2nvkI7DOIMc5731T06WNUAm5PF/xL/LbHoqc+Cv46cQUKJ+sTEu7YxCPdbd
         xymg==
X-Gm-Message-State: AOAM532V29fdoWmW2gH2V0bDPMMlOeyj884/xVzFq0rEgeYbOSz9kgLY
        bNsAp5TlrKzcbhW8EFiUHEoFoQrj3T7y+nHhm7nOSbTSmU6RV7sEXN+nrSI5WTX+gm0kjP7F2H4
        E3mn013R3FbwlNBSwmZ2b3K3jD5UTqgkINZigv3u8w1cmP62o
X-Received: by 2002:a50:cc4b:: with SMTP id n11mr33958126edi.186.1618937397620;
        Tue, 20 Apr 2021 09:49:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFpLXaO26NoPnHh4aEiGAmvUqWmrI333nb0Yo3aHX7WOiiVNvUBOWtMLlzw59fq5NlWZRiHQ==
X-Received: by 2002:a50:cc4b:: with SMTP id n11mr33958102edi.186.1618937397373;
        Tue, 20 Apr 2021 09:49:57 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:49:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Midas
Date:   Tue, 20 Apr 2021 18:49:37 +0200
Message-Id: <20210420164943.11152-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
References: <20210420164943.11152-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The RTC on Maxim max77686 PMIC can wakeup the system from suspend to
RAM.  Add a generic property for this.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos4412-midas.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
index fc77c1bfd844..968c7943653e 100644
--- a/arch/arm/boot/dts/exynos4412-midas.dtsi
+++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
@@ -668,6 +668,7 @@ max77686: pmic@9 {
 		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&max77686_irq>;
 		pinctrl-names = "default";
+		wakeup-source;
 		reg = <0x09>;
 		#clock-cells = <1>;
 
-- 
2.25.1

