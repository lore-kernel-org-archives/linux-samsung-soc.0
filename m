Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF086C4708F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Jun 2021 11:05:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCD8D613D0
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  2 Jun 2021 11:05:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbhFBLHA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 2 Jun 2021 07:07:00 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:52364 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231952AbhFBLGj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 2 Jun 2021 07:06:39 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1loOgB-0003w1-VS
        for linux-samsung-soc@vger.kernel.org; Wed, 02 Jun 2021 11:04:56 +0000
Received: by mail-wr1-f69.google.com with SMTP id v15-20020a5d4a4f0000b0290118dc518878so864735wrs.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 02 Jun 2021 04:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YMY2yvxHNG1nkzYJPg4/G4TbXbdFqsqs8hq2uBFV7DI=;
        b=bOUQ2tc+HXrxdzmnk7TGpsDX+61FM2/6Z0joqeouTyWZhCbocRBSvJF62KkLdvPIy7
         J07x8K9hgdlxQCGw5MUFQWhZVYHUtRi1Wd9XZyda5yajy1PCBI0HzIpTZyd0+eSXmfjR
         n5UPWZM2oSP0JlJ4K1QTsIonRmVc6rQUS7gtPOS2dYoeBZZz4uv3WFoEtoLwuFuit+2T
         oIviRs2O/8yaPaKXenZTdz+EBzK480EMBW5Mph5E6nI6WorpCNNYaS9AnOJY3pvRwf8v
         EZog6c6KzFpYZ3ZumTK3ggKyGg0DQpPqj3nkBpU/lLYCHlaGU2OTJsfgEjiR2fNDuB6T
         OHMg==
X-Gm-Message-State: AOAM533Z95oKP4Od0Fb8PhJzF9icMz9FJhRYLTfq4PJ6Se1qbvakv7PD
        9Znb/tYsRZU0MPfhxyBAlFF/eSCFAmw+TVeMTVhWBMoqh1HdT90Yh0a5N7WnR8RLHsxqHTBGNIT
        tACQ+RP/5XHKJH9SW1E9mZO035T4imZBKYnaTdSzCp3xFXOO5
X-Received: by 2002:a05:600c:2142:: with SMTP id v2mr14060785wml.9.1622631895527;
        Wed, 02 Jun 2021 04:04:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKXz5EM/oisdvTpplEupoMA1J+9P6wti5Cm763etHOe09mPhvU440/BxTIrLEkoio/aL0mpg==
X-Received: by 2002:a05:600c:2142:: with SMTP id v2mr14060782wml.9.1622631895415;
        Wed, 02 Jun 2021 04:04:55 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-185-9.adslplus.ch. [188.155.185.9])
        by smtp.gmail.com with ESMTPSA id f5sm6948175wrf.22.2021.06.02.04.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 04:04:54 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Herring <robh@kernel.org>
Subject: [RESEND PATCH v2 2/4] mfd: max77686: Do not enforce (incorrect) interrupt trigger type
Date:   Wed,  2 Jun 2021 13:04:43 +0200
Message-Id: <20210602110445.33536-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
References: <20210602110445.33536-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

Interrupt line can be configured on different hardware in different way,
even inverted.  Therefore driver should not enforce specific trigger
type - edge falling - but instead rely on Devicetree to configure it.

The Maxim 77686 datasheet describes the interrupt line as active low
with a requirement of acknowledge from the CPU therefore the edge
falling is not correct.

The interrupt line is shared between PMIC and RTC driver, so using level
sensitive interrupt is here especially important to avoid races.  With
an edge configuration in case if first PMIC signals interrupt followed
shortly after by the RTC, the interrupt might not be yet cleared/acked
thus the second one would not be noticed.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Rob Herring <robh@kernel.org>

---

Changes since v1:
1. Add ack.
---
 Documentation/devicetree/bindings/clock/maxim,max77686.txt | 4 ++--
 Documentation/devicetree/bindings/mfd/max77686.txt         | 2 +-
 Documentation/devicetree/bindings/regulator/max77686.txt   | 2 +-
 drivers/mfd/max77686.c                                     | 3 +--
 4 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/maxim,max77686.txt b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
index 3472b461ca93..c10849efb444 100644
--- a/Documentation/devicetree/bindings/clock/maxim,max77686.txt
+++ b/Documentation/devicetree/bindings/clock/maxim,max77686.txt
@@ -49,7 +49,7 @@ Example:
 		max77686: max77686@9 {
 			compatible = "maxim,max77686";
 			interrupt-parent = <&wakeup_eint>;
-			interrupts = <26 0>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			reg = <0x09>;
 			#clock-cells = <1>;
 
@@ -74,7 +74,7 @@ Example:
 		max77802: max77802@9 {
 			compatible = "maxim,max77802";
 			interrupt-parent = <&wakeup_eint>;
-			interrupts = <26 0>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			reg = <0x09>;
 			#clock-cells = <1>;
 
diff --git a/Documentation/devicetree/bindings/mfd/max77686.txt b/Documentation/devicetree/bindings/mfd/max77686.txt
index 42968b7144e0..4447d074894a 100644
--- a/Documentation/devicetree/bindings/mfd/max77686.txt
+++ b/Documentation/devicetree/bindings/mfd/max77686.txt
@@ -21,6 +21,6 @@ Example:
 	max77686: pmic@9 {
 		compatible = "maxim,max77686";
 		interrupt-parent = <&wakeup_eint>;
-		interrupts = <26 0>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x09>;
 	};
diff --git a/Documentation/devicetree/bindings/regulator/max77686.txt b/Documentation/devicetree/bindings/regulator/max77686.txt
index e9f7578ca09a..ff3d2dec8c4b 100644
--- a/Documentation/devicetree/bindings/regulator/max77686.txt
+++ b/Documentation/devicetree/bindings/regulator/max77686.txt
@@ -43,7 +43,7 @@ Example:
 	max77686: pmic@9 {
 		compatible = "maxim,max77686";
 		interrupt-parent = <&wakeup_eint>;
-		interrupts = <26 IRQ_TYPE_NONE>;
+		interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x09>;
 
 		voltage-regulators {
diff --git a/drivers/mfd/max77686.c b/drivers/mfd/max77686.c
index 2ad554b921d9..f9e12ab2bc75 100644
--- a/drivers/mfd/max77686.c
+++ b/drivers/mfd/max77686.c
@@ -209,8 +209,7 @@ static int max77686_i2c_probe(struct i2c_client *i2c)
 
 	ret = devm_regmap_add_irq_chip(&i2c->dev, max77686->regmap,
 				       max77686->irq,
-				       IRQF_TRIGGER_FALLING | IRQF_ONESHOT |
-				       IRQF_SHARED, 0, irq_chip,
+				       IRQF_ONESHOT | IRQF_SHARED, 0, irq_chip,
 				       &max77686->irq_data);
 	if (ret < 0) {
 		dev_err(&i2c->dev, "failed to add PMIC irq chip: %d\n", ret);
-- 
2.27.0

