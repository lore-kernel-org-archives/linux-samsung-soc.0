Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37C18C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 31 Dec 2021 16:20:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231348AbhLaQU1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 31 Dec 2021 11:20:27 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46678
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231324AbhLaQUZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Dec 2021 11:20:25 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C9ADD3FFD5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 16:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640967623;
        bh=zzMyOeYd4lATlu6SXmtUhZks+PFFAFcrD95at+LMCx4=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=GlWw43dul/H3vWXGcKWv90VNKi0pckISOPK4nVYpq3S9pl5nqHZaZ7DsBBMVS9Edw
         34by2YUKa8RmlQJAGSc1L6I1XQEDDDkcwIm/boRV1uu/4qHpnDa0lH/0sUxizF1Kp0
         MrlVtZP/e0RUe5wZLndrUZh2ilpmSOXrwe7nqfzwvmMxvn2NU5rMXAlooLjCoSR66f
         yQZQqCxXkfxRiAO8YcAlMd52PkXf6kl2HM1XHHfBFtxEZLoIY+GdAg9KoYAIRmfDKr
         VO0vK9D0Pma/bUlvb4WTu6ud4t6+PqEhq7UYeOpPwSWt9OtQGyTNZIwSFDoUK9stxe
         yMdo9mWZibjVA==
Received: by mail-lj1-f200.google.com with SMTP id e7-20020a05651c090700b0022d70efe931so9486544ljq.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Dec 2021 08:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zzMyOeYd4lATlu6SXmtUhZks+PFFAFcrD95at+LMCx4=;
        b=naC26jkjkxzqrdb3gNg0IiCIm3N4YYiL1IMBCFn2nkZSa7Sfq87gChMbEQSeU4Vuz+
         4uONVzAjVFBi/o2O8xzbDUEX9nvti2qRvNFVx8YqwN4iK2dUkkJqbkboaunamCd32s1P
         gkkhAoGdlNr7na1vxYhGiQAc9iCyt3Eig7QfzoMhep245BooD9sKiKaqDzcYpihBKbw8
         o74o/94hQgI8bwGDf6YAX+M1Y/hQ2pAbxxBfszWMLpK3pRH7wJ06PLSukVVep6sdPubU
         Re40dLVSVQX+NhOVKsa0CtxZmoJJWsblhNsDSg0aDGKuGqdh+N038nQhaaKliPy+PpM1
         3XAg==
X-Gm-Message-State: AOAM531GglyBsjOLnlGeyQW5+BHCH2NeewSunooPCZfNU9mTl3w+8RtI
        2AwuQEHxt+WWZ5At+HEZlwejFcpi63/av8yr2Ee8cPBuCqlbd29jCs40yip22DCuTtxbNzvfDLI
        Opoe4qNdcW7a8A4Ys90Zv9o8NzStSseZrPq6avigQNcIafz6g
X-Received: by 2002:a05:651c:160a:: with SMTP id f10mr7148767ljq.212.1640967621418;
        Fri, 31 Dec 2021 08:20:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyC2D5vkNTcMFTSCOPSDggWUC6MqsDk41XLjuzA/XDwAuE2biajEVb5529Uv3BnT9+pNaMXqw==
X-Received: by 2002:a05:651c:160a:: with SMTP id f10mr7148760ljq.212.1640967621254;
        Fri, 31 Dec 2021 08:20:21 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id bx10sm2817607ljb.3.2021.12.31.08.20.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Dec 2021 08:20:20 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: [PATCH 06/24] ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pit
Date:   Fri, 31 Dec 2021 17:19:12 +0100
Message-Id: <20211231161930.256733-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The pin configuration for PMIC DVS (pmic-dvs-2 and pmic-dvs-3) are
exactly the same, so merge them.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index 1ae5528e9ebf..e8819659081a 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -212,7 +212,7 @@ max77802: pmic@9 {
 		interrupts = <1 IRQ_TYPE_NONE>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&max77802_irq>, <&pmic_selb>,
-			    <&pmic_dvs_1>, <&pmic_dvs_2>, <&pmic_dvs_3>;
+			    <&pmic_dvs_1>, <&pmic_dvs_2>;
 		wakeup-source;
 		reg = <0x9>;
 		#clock-cells = <1>;
@@ -892,14 +892,7 @@ &sd1_cmd {
 
 &pinctrl_2 {
 	pmic_dvs_2: pmic-dvs-2 {
-		samsung,pins = "gpj4-2";
-		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
-		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
-		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-	};
-
-	pmic_dvs_3: pmic-dvs-3 {
-		samsung,pins = "gpj4-3";
+		samsung,pins = "gpj4-2", "gpj4-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
-- 
2.32.0

