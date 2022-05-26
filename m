Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51158C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 26 May 2022 20:44:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348947AbiEZUoG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 26 May 2022 16:44:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349092AbiEZUns (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 26 May 2022 16:43:48 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF194E64FE
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 May 2022 13:43:32 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id y13so5180107eje.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 26 May 2022 13:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2HbAAEhEhYPigEy5cs4rYAx85JfdiA+8XIt4PraJMOg=;
        b=P8tHOTyqEAgQlFw7egTJOe550Ta1tvdTEeiO1gEXgm9y8ZrqrdORGg3oswlcUyeTxI
         y0X7KCXz8A+r1De3ccJvte6lWbPYsnPT2De6GGVA6BdU6J0NpcYI7EvZ1uAErnA9yAYv
         6PYxVjPcoEHdTEqyTlXdD24RfKWavrpPF5HGfI25elFrNM3eMJRYgzeAY3+62dVcOoMv
         Rxns0jt1hPUxLIhlkU+SvCQFx+hqLvWuKwpBI9A+bVCk9MKMDkHejJ+uJCW0uL6tMhDB
         QmlySI77keo7egiGDOxnPa+cjID7uS7PZ3aafB6Z4yUmnCGFWbIE1POak6dMl3Yj+9Ak
         lyEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2HbAAEhEhYPigEy5cs4rYAx85JfdiA+8XIt4PraJMOg=;
        b=QPo59zHxAMVZQvSAk4nv/ZBjSsiuYxhsxEx4NXnEFdEjcjvv4/SnttGKAS1EMxvWN0
         Xrty2PYd7V+VEOxWTHDgan5aAFpaQiV2dx6Ww44ikiMPMNDGnn5dh3qXu5Gia/kNuTqK
         vet2MJIh/0q0ZjNXAYDMtv7gQmfKwaMoNC6iHoeaVuDdz8BbhhxrggFpu4wo7zTQ4zhs
         +ggI6irzGo5fL/qZbrxNZEZQWUU3EFTbZVaNfTjrgRjnsefykvEfNQtmDTaBwys2dCbf
         j59L55YLZGtTv2NW7UZJDWCZ6YetuVP4S+V9E841y03pq3fasnpEokvjBfVz5xMm2cSZ
         q4OA==
X-Gm-Message-State: AOAM532ayrM4PS39IfuVze6MbU/1IkR1x2nZ+mFcAlGnXrXJTPQF8oGZ
        F+NCxxjGcLS6JGkEYbCv7QtaFA==
X-Google-Smtp-Source: ABdhPJxHCgn2QBJAFPGldWA5KZJv7wyYzN6zUcA8bMbI7GXutPNmSdMxYiVHIutNpQV32tf5lqpFFA==
X-Received: by 2002:a17:906:a383:b0:6f5:132c:1a14 with SMTP id k3-20020a170906a38300b006f5132c1a14mr35985269ejz.21.1653597812346;
        Thu, 26 May 2022 13:43:32 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id y11-20020a170906070b00b006fec28bd09fsm816846ejb.22.2022.05.26.13.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 13:43:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: exynos: adjust whitespace around '='
Date:   Thu, 26 May 2022 22:43:23 +0200
Message-Id: <20220526204323.832243-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220526204323.832243-1-krzysztof.kozlowski@linaro.org>
References: <20220526204323.832243-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix whitespace coding style: use single space instead of tabs or
multiple spaces around '=' sign in property assignment.  No functional
changes (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Output compared with dtx_diff and fdtdump.
---
 arch/arm/boot/dts/exynos3250-artik5.dtsi    | 2 +-
 arch/arm/boot/dts/exynos4210-trats.dts      | 2 +-
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi | 2 +-
 arch/arm/boot/dts/exynos5.dtsi              | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
index 7b429622a288..0ac3f284fbb8 100644
--- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
+++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
@@ -357,7 +357,7 @@ &mshc_1 {
 
 &pinctrl_1 {
 	bten: bten-pins {
-		samsung,pins ="gpx1-7";
+		samsung,pins = "gpx1-7";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_DOWN>;
 		samsung,pin-con-pdn = <EXYNOS_PIN_PDN_PREV>;
diff --git a/arch/arm/boot/dts/exynos4210-trats.dts b/arch/arm/boot/dts/exynos4210-trats.dts
index 01f44d95f671..b8e9dd23fc51 100644
--- a/arch/arm/boot/dts/exynos4210-trats.dts
+++ b/arch/arm/boot/dts/exynos4210-trats.dts
@@ -180,7 +180,7 @@ panel@0 {
 		vdd3-supply = <&vcclcd_reg>;
 		vci-supply = <&vlcd_reg>;
 		reset-gpios = <&gpy4 5 GPIO_ACTIVE_HIGH>;
-		power-on-delay= <50>;
+		power-on-delay = <50>;
 		reset-delay = <100>;
 		init-delay = <100>;
 		flip-horizontal;
diff --git a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
index 03dffc690b79..aa7de6de8e19 100644
--- a/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
+++ b/arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi
@@ -107,7 +107,7 @@ panel@0 {
 		vdd3-supply = <&lcd_vdd3_reg>;
 		vci-supply = <&ldo25_reg>;
 		reset-gpios = <&gpf2 1 GPIO_ACTIVE_HIGH>;
-		power-on-delay= <50>;
+		power-on-delay = <50>;
 		reset-delay = <100>;
 		init-delay = <100>;
 		flip-horizontal;
diff --git a/arch/arm/boot/dts/exynos5.dtsi b/arch/arm/boot/dts/exynos5.dtsi
index 9ce9fb3fc190..c8da0d4b1b33 100644
--- a/arch/arm/boot/dts/exynos5.dtsi
+++ b/arch/arm/boot/dts/exynos5.dtsi
@@ -89,7 +89,7 @@ gic: interrupt-controller@10481000 {
 			compatible = "arm,gic-400", "arm,cortex-a15-gic";
 			#interrupt-cells = <3>;
 			interrupt-controller;
-			reg =	<0x10481000 0x1000>,
+			reg = <0x10481000 0x1000>,
 				<0x10482000 0x2000>,
 				<0x10484000 0x2000>,
 				<0x10486000 0x2000>;
-- 
2.34.1

