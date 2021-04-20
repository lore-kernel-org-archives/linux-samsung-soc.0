Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB941C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6C4C6115C
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233297AbhDTQui (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:38 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49829 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233266AbhDTQuh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:37 -0400
Received: from mail-ed1-f72.google.com ([209.85.208.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZc-0003Yk-SF
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:50:04 +0000
Received: by mail-ed1-f72.google.com with SMTP id y10-20020a50f1ca0000b0290382d654f75eso13446763edl.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:50:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ox2bZeNVgpS1SkdFcOmweP3XNPduD7g1GALJyeZlfYk=;
        b=mPtvsbGyuZsKA5HzarK8pP2kEkvXC81sKOCCMk85hic3uhs4cSBul86wnq7h+G2Uaj
         jPRZnJELjhKZ55VaXsfWWCkDQIsmA/nogLZeRpKuKy+p/iXJQec6ZJfGR0Zny0y6rpV6
         MWgx9U4M5pmcFewSfY1ksNduu1TGA2cnw4KgoGq12wZoNhYYed0rK7qXE6wYdi0gVRAr
         kFWOHcW/07frhY/VSrOKfrlylRB/CDmdsLN4JGn4gj4T1QF6N59XyYanV5PsyMuJT5UM
         2dVBiOr+Z3MpW2RFGSChRG0fOYA0UbkiEiAR1dwLaoY/G2QpgWeuq+359vMiQXL9ytr9
         Xo6A==
X-Gm-Message-State: AOAM530yf4tHDe7r3Ql39SMs6d5TIY1PhyHkZIutKT4+v3CDj0/kGLRH
        S4kkAq+tKZo/rrvvqPQxp7MUlMLI9+zyxKxRbybeE5YnMBxyYt1T5P1WSCHUOjWSey7fVfuCRhO
        2CVfAVdy8keqS+okQSIDYTxXCwdTIgZesMm9dgTDNMDu903j8
X-Received: by 2002:a17:906:4154:: with SMTP id l20mr28695054ejk.509.1618937404023;
        Tue, 20 Apr 2021 09:50:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6d/waBt2sVLq9uOF/lRJOJSgWQN2YdHM4Z7ZbxFFY9PB7veMrUXGjUS9WeWx6EgSJnxtcVA==
X-Received: by 2002:a17:906:4154:: with SMTP id l20mr28695045ejk.509.1618937403896;
        Tue, 20 Apr 2021 09:50:03 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:50:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 07/11] ARM: dts: exynos: enable PMIC wakeup from suspend on P4 Note
Date:   Tue, 20 Apr 2021 18:49:39 +0200
Message-Id: <20210420164943.11152-7-krzysztof.kozlowski@canonical.com>
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
 arch/arm/boot/dts/exynos4412-p4note.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4412-p4note.dtsi b/arch/arm/boot/dts/exynos4412-p4note.dtsi
index 9e750890edb8..22c3086e0076 100644
--- a/arch/arm/boot/dts/exynos4412-p4note.dtsi
+++ b/arch/arm/boot/dts/exynos4412-p4note.dtsi
@@ -325,6 +325,7 @@ max77686: pmic@9 {
 		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&max77686_irq>;
 		pinctrl-names = "default";
+		wakeup-source;
 		reg = <0x09>;
 		#clock-cells = <1>;
 
-- 
2.25.1

