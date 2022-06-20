Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA85CCA479
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 20 Jun 2022 17:50:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243929AbiFTRup (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Jun 2022 13:50:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243613AbiFTRun (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Jun 2022 13:50:43 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA0CDCE03
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:50:41 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id g26so1206744ejb.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Jun 2022 10:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vawR+AKsr/69UkXXi73qth6MiAdc5ZxxVTAr6kwXEOY=;
        b=J4yOAnnI91X+Vinzvn0WwG64HhjEEIaLZLVcAXEQP9eVWDDTyo9uudAc8SEK3Msyh9
         ZxgBvxacfdSKgn9V+y6EMfLDSx31r7gS+JbXmocuUqlEqcHFuWULm/DR/VhgQ1zDbEvh
         yUiykLGAjjhnuqikmH59MnJERXN/zvkc8U6wKIJICWyXPLRRk6Pp9f4xypyJf7W6r9Zh
         2IXY9qKReCE7zYW6G6N4++QxVPIPQ7llQMulHDvXXX7S+V0t0i+T5FItVF9+btU0CnYW
         4Y4yvZm1PUhzLSNRy1QQcNIxOuZZyVf69tPSC2A/CU8P74twQ+8yPTf+tpXQjtmc5enr
         VBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vawR+AKsr/69UkXXi73qth6MiAdc5ZxxVTAr6kwXEOY=;
        b=L1Hk4ClVuWuo+UMxGIm46dtA2VRk9kjyGQBwkamJFjE+zZYbOSdCbOasEoN+kXN9v+
         +leWYwfPhz2ARntym4VvXSu9hGe5QfAxRjL2a8jHUUpxJlPsXQ+8poRwvK9Gqe93fjGe
         7jidcoaAX5/3bbAYioZt9IKyF2GYiuuV7iTIyqtjATOq6QzVVc9GEBkkW5NUo68UG7NK
         ilR1ehXkB//8w/yvd922Go5x4zM81lY8KUSMwupgYmxcsZpqFnqArJeMM7tJlhEFDtZ2
         fadnQvdzqND1nT/sbq90JAFZISqOcjW2WrphXB2yzT/EskxhOFTBNCSHSdPLwXt90Ujk
         boSQ==
X-Gm-Message-State: AJIora8nUR6cqy+u2NHZewkL1H7ogP5vHyV3UyYNc99TLfZOmnShYXoM
        1GEl8FsDAHd6e8uARC8927uhtQ==
X-Google-Smtp-Source: AGRyM1t/5tJyjuc7r045NqsNdhCJ7jAP96f2MPgVeZfCzLGEwgBY51/w/4SQBTbISEMawxJtUWfbaw==
X-Received: by 2002:a17:907:7da8:b0:722:ca29:b58e with SMTP id oz40-20020a1709077da800b00722ca29b58emr3989638ejc.732.1655747440374;
        Mon, 20 Jun 2022 10:50:40 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id d13-20020a170906304d00b00704757b1debsm6346056ejd.9.2022.06.20.10.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 10:50:39 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/3] ARM: dts: exynos: align aat1290 flash LED node with bindings in Galaxy S3
Date:   Mon, 20 Jun 2022 19:50:32 +0200
Message-Id: <20220620175033.130468-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
References: <20220620175033.130468-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The bindings expect aat1290 flash LED child node to be named "led".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index aa7de6de8e19..46640b490a8c 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -25,7 +25,7 @@ led-controller {
 		pinctrl-1 = <&camera_flash_host>;
 		pinctrl-2 = <&camera_flash_isp>;
 
-		flash-led {
+		led {
 			label = "flash";
 			led-max-microamp = <520833>;
 			flash-max-microamp = <1012500>;
-- 
2.34.1

