Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E899FC43470
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B461060200
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 20 Apr 2021 16:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233293AbhDTQud (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 20 Apr 2021 12:50:33 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49820 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233274AbhDTQuc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 20 Apr 2021 12:50:32 -0400
Received: from mail-ed1-f71.google.com ([209.85.208.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lYtZY-0003Wq-2J
        for linux-samsung-soc@vger.kernel.org; Tue, 20 Apr 2021 16:50:00 +0000
Received: by mail-ed1-f71.google.com with SMTP id bf25-20020a0564021a59b0290385169cebf8so6062787edb.8
        for <linux-samsung-soc@vger.kernel.org>; Tue, 20 Apr 2021 09:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SZDfcyCZwVylLX5TsAAAA/wUyySKv8eKHfB4MShW5ZM=;
        b=nXzbbU2tLctE24gg46Ee6UL0+3I0B7F55Oi19pPyaiyOd7e4B/ZMfv907xGE78Ago9
         SZAdcO8/yHoDeFVjySk9bq4e2mBBTx7PiK6hlseXBgSpPtQWaNnVz1qH3zMNnh5RRrR8
         CLylSzC3vP6JgHD1kqf0ZT+5PfM2avYuVXdHyUBbvihYm5jniXPe1ijE4d97YF5sH5GO
         xTECSCSw3l3bm4dkEJwpsqtDF8T4egrIMm91PKt73cqeBZZaNYwAkNuO5CGr7emVMQft
         YWI6wCuA3bGXXmhIknjZY6dtR9HD4noxNKaDZ9IdQSQlFfAXZkPwPeks/fw5ZSkLguhM
         7B3g==
X-Gm-Message-State: AOAM533CNC4qwr8zq8f7rzpMB5PbgfM0oxVxxntPQfnSp6dmA87QGLaM
        7TAPBlpRmUEyeLs6xFeaTPQqinHo7ezR0AUNau0FHBHRG4DzvkQ/2/bPBb7LoBa0wa6+P5AqboD
        FXzYatfKKciylza/c37aWRKIT6UGWNdRVRldgACvPWY/R76Qy
X-Received: by 2002:aa7:c7da:: with SMTP id o26mr33442347eds.244.1618937399819;
        Tue, 20 Apr 2021 09:49:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvd13jGax0cMnNAZv3uD8tJgdViFUxJlK5G4XxKdlgdYp76PfhEquTOjft8MVprNuWSmmdKw==
X-Received: by 2002:aa7:c7da:: with SMTP id o26mr33442335eds.244.1618937399717;
        Tue, 20 Apr 2021 09:49:59 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-180-75.adslplus.ch. [188.155.180.75])
        by smtp.gmail.com with ESMTPSA id c12sm18252873edx.54.2021.04.20.09.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Apr 2021 09:49:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 06/11] ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid X/U3
Date:   Tue, 20 Apr 2021 18:49:38 +0200
Message-Id: <20210420164943.11152-6-krzysztof.kozlowski@canonical.com>
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
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index 5bd05866d7a3..5b1d4591b35c 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -282,6 +282,7 @@ max77686: pmic@9 {
 		interrupts = <2 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&max77686_irq>;
+		wakeup-source;
 		reg = <0x09>;
 		#clock-cells = <1>;
 
-- 
2.25.1

