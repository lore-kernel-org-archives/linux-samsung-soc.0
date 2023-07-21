Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 531DBC001E0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Jul 2023 13:33:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231245AbjGUNdB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Jul 2023 09:33:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231360AbjGUNc4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jul 2023 09:32:56 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD63B30D2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jul 2023 06:32:52 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99342a599e9so307171166b.3
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jul 2023 06:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689946371; x=1690551171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOWJLBf1ty8KzVG8dUmwJsE8IPV8x0Srq0/dtmrSM/A=;
        b=DKpboIZu/eBEk5A5aNIiG3K5eAreQDmJcU5De/RJrEqY9O1e5mKOwm9T8J9cnRQkzh
         U7PPLMILwW0BvjmPNyyWa8QEbDoKvG5knagJSBEDHMlzAbJv/2+CDBERJnUco3eceosO
         +7Um1qhc5eF/+y6NHGUhKjyk9Kz/kIoKWxCi/htydouQ2V8Yfdn86Q39Zrm033kulpUT
         d565tjHsEjr6vlg+XsxaK+GEsPYRLBD+17Ma4zsKTjC3vP/XcQ+EzDKWrss5drD5ozTi
         e78B6CcADLctsjUmEkupmTx+pyOETeuht5hJXXaaN562QxUF3DafFK9Q538tPWBbbn2J
         dpig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689946371; x=1690551171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QOWJLBf1ty8KzVG8dUmwJsE8IPV8x0Srq0/dtmrSM/A=;
        b=AlwVD+h1D17IZc541MnvxZZlYD3hJ/a7cE2zvppTX24dBsEhajplCS81DsjQgUgcxp
         D00+rlkzArLS/P15eKmpxF/zTUb1yPS1eH+AUt8cbl7zk5SfxRE8Yh/39Hska96sBbxX
         pdxfBrcZG+2/Gkhc0SFkZsKidx5VuXlZcpfroBjOZsoDVdHdpg1RLo0v3tM1PLCBMNh6
         fzRIdkG3ZiLrmMV75RM5+MG2jvuu1fg1sjLH4do4Yr7O+NtbfzUseE9N9jmAIy++WvV3
         2QmPcureUyYHSCt7i54AA53ct38takXaMnfaM84G6PBZcnl9iVX/tL+7BlzYpIRgKhf6
         a3GQ==
X-Gm-Message-State: ABy/qLby9ddEb94aumdKiGKbF7Vsf/l2OUBZKQZWaZsPJG8X5yJAv/Y0
        UVqJnpL5IN3Zq8WHjF379dgQgw==
X-Google-Smtp-Source: APBJJlGFk/rv9nGVhk02KNVz6CUfXg+yS5TJPVyYDu6CF7DM/SZEyPteTU7J8/zhCBqx5Hy5DstoHA==
X-Received: by 2002:a17:906:9bcc:b0:991:f7cb:cc3d with SMTP id de12-20020a1709069bcc00b00991f7cbcc3dmr1713361ejc.65.1689946371156;
        Fri, 21 Jul 2023 06:32:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id z3-20020a170906270300b00993017b64a8sm2170613ejc.224.2023.07.21.06.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jul 2023 06:32:50 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] ARM: dts: samsung: exynos5250-snow: switch i2c-arb to new child variant
Date:   Fri, 21 Jul 2023 15:32:46 +0200
Message-Id: <20230721133246.15752-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721133246.15752-1-krzysztof.kozlowski@linaro.org>
References: <20230721133246.15752-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Since commit e8813c15be0a ("dt-bindings: i2c: add support for 'i2c-arb'
subnode") the i2c-arbitrator subnode should not have unit address.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
index 64f00c5fd322..65b000df176e 100644
--- a/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5250-snow-common.dtsi
@@ -60,9 +60,6 @@ vbat: vbat-fixed-regulator {
 
 	i2c-arbitrator {
 		compatible = "i2c-arb-gpio-challenge";
-		#address-cells = <1>;
-		#size-cells = <0>;
-
 		i2c-parent = <&i2c_4>;
 
 		our-claim-gpios = <&gpf0 3 GPIO_ACTIVE_LOW>;
@@ -75,8 +72,7 @@ i2c-arbitrator {
 		pinctrl-0 = <&arb_our_claim &arb_their_claim>;
 
 		/* Use ID 104 as a hint that we're on physical bus 4 */
-		i2c_104: i2c@0 {
-			reg = <0>;
+		i2c_104: i2c-arb {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-- 
2.34.1

