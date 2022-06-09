Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D02BC43334
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Jun 2022 11:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244104AbiFILpZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Jun 2022 07:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244443AbiFILmt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Jun 2022 07:42:49 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ACCC1E048F
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Jun 2022 04:41:06 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id x62so30802165ede.10
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Jun 2022 04:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Gpn7JqseIm0vh0gpd7q4DWQubHQ0jsw35Hsu6S6dEzI=;
        b=kvsnHK++hy6P9FYjJCDS6+qQamnfahcYExnWCuyC3uJTv7PIfm4usqubs3Z8YqvHRO
         DjLsDfaGEhenp9FVqtuELGC9oN7/OhU81DfGMTLH3Wkt65j1a2GLXT0kLncsekghlUsc
         mqLUxv6QfnPxnt8de6j6E/zCndCQnsHF1Mnq+VAHL0oR9fNlaP01f19WZTOFMBshCjiK
         ZjEfStRZnBVsbKiFN9PneFYtPKzFS2poQDeuqz+DHnnud5wkVaGpRu4NZe4W4YF5pACf
         shC5I/G6K8a7Hnomk+Ac93rPRhGfOr6zfc+nslmdB+/lyZxDCNX20n1wi6BHfjcjEhVi
         /xmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Gpn7JqseIm0vh0gpd7q4DWQubHQ0jsw35Hsu6S6dEzI=;
        b=Dx4ciHg3PVzBm0CWDWhFlcJSp6JGMQQoW3lE3oKWpQlEbIRUq7Foo/cU0i28FpVsdx
         4F76yp5ngKXew/71mM8Musx1VxorMd1/paAbN0Ip3jrup/qdJrcWxC69Xdcc4/0ji6aC
         JBbuj2o416IrkMHpvB7O019rz4vllGbiycUckGT7ahR/MVzImBx1PTNtwzWKP11WG7Qu
         yREmHKEINTd40VB+LLyqSrpMxefdjFRIhvndrB3bmtIYl7PYeDqgJdMAfFCBVIR9yTm3
         2CsaX8e/ACnwpWbSPbCTqUE6AzqUHA5O0eypSSrUIK4k/jwAXD5bFsXrDFG8UALIYVN/
         0osw==
X-Gm-Message-State: AOAM532L+Lkd8ghFuBWwjF2yt76INLw6hk8F+X25PV3oDAfg3F2TxJMV
        +PM6IQMh+Lcgz2mGLRBHBVRyBw==
X-Google-Smtp-Source: ABdhPJwT+7kUr2sta77J0wJZy0BuCltCldWfJaTcXTeAdRDkcGZS4UKZb7000TCkaLQnVJ+A6ZoBEQ==
X-Received: by 2002:a05:6402:3906:b0:42a:ad43:6477 with SMTP id fe6-20020a056402390600b0042aad436477mr44503045edb.20.1654774864945;
        Thu, 09 Jun 2022 04:41:04 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bk2-20020a170906b0c200b006fef557bb7asm10498662ejb.80.2022.06.09.04.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 04:41:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        arm@kernel.org, soc@kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 48/48] ARM: dts: s5pv210: align gpio-key node names with dtschema
Date:   Thu,  9 Jun 2022 13:40:47 +0200
Message-Id: <20220609114047.380793-9-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
References: <20220609113721.379932-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The node names should be generic and DT schema expects certain pattern
(e.g. with key/button/switch).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/s5pv210-fascinate4g.dts | 6 +++---
 arch/arm/boot/dts/s5pv210-galaxys.dts     | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/s5pv210-fascinate4g.dts b/arch/arm/boot/dts/s5pv210-fascinate4g.dts
index eae51b197ee9..eaa7c4f0e257 100644
--- a/arch/arm/boot/dts/s5pv210-fascinate4g.dts
+++ b/arch/arm/boot/dts/s5pv210-fascinate4g.dts
@@ -17,20 +17,20 @@ chosen {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
+		key-power {
 			label = "power";
 			gpios = <&gph2 6 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			wakeup-source;
 		};
 
-		vol-down {
+		key-vol-down {
 			label = "volume_down";
 			gpios = <&gph3 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		vol-up {
+		key-vol-up {
 			label = "volume_up";
 			gpios = <&gph3 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
diff --git a/arch/arm/boot/dts/s5pv210-galaxys.dts b/arch/arm/boot/dts/s5pv210-galaxys.dts
index aaf880792f36..cdd3653d487f 100644
--- a/arch/arm/boot/dts/s5pv210-galaxys.dts
+++ b/arch/arm/boot/dts/s5pv210-galaxys.dts
@@ -24,26 +24,26 @@ nand_pwrseq: nand-pwrseq {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		power {
+		key-power {
 			label = "power";
 			gpios = <&gph2 6 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
 			wakeup-source;
 		};
 
-		vol-down {
+		key-vol-down {
 			label = "volume_down";
 			gpios = <&gph3 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 
-		vol-up {
+		key-vol-up {
 			label = "volume_up";
 			gpios = <&gph3 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
 		};
 
-		home {
+		key-home {
 			label = "home";
 			gpios = <&gph3 5 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
-- 
2.34.1

