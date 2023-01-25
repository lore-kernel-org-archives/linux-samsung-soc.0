Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69B6AC27C76
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Jan 2023 09:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235418AbjAYJqK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Jan 2023 04:46:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235402AbjAYJqA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Jan 2023 04:46:00 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735725529A
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:45:38 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso829557wmq.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Jan 2023 01:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qowa73WP5NuRjvO5wPyeCoJPVND+FUWPXASJeoJltuk=;
        b=A4oITa5Dh8BwEtimUPHoDIoZCnTZYenCTS0CR7eNA73AuJsDakDXa4ZT1ppZRJ0lbZ
         KFSLw9Rx+3L4x89DR5QkeVmatu9uVi2oAILfwKAszpk3vBnvjCcSkc2x46E+Uwdm0t7Z
         pgvfTW6UO/1MQjJXNRuaIZMFk/5VXpLRNW30RwTJ+v/qBvOKogKrRxUQhnD5kuJ6T89B
         DWXn+hDcr+b9f9Sx2I6b8mEIsdRGouUaKbvzJsQhz0EqvxjfDaqCAep78qqvRiSxsLUK
         XmvMB9shGgGzs2a/pI4JyF8459kQerH2Qx4d4blHLAOjoplDGjdaQipGnCqmxhHDG3Ow
         Aa/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qowa73WP5NuRjvO5wPyeCoJPVND+FUWPXASJeoJltuk=;
        b=KOgca8MBqkN8FDd8RFH1kUq8idr6icJ4j0cHgi3bI/a5xR105qHrBIghc0vAy6TzSe
         dBisL/NorUMXyoKPmShpDxYDTRxE4yfngLvdcNafUsp4WYNdYUpTOkFI5UaLSgJofx6o
         OldhoCTNwt9QJdELzG1BIMcbVjSS710HYeJT93BEmy3+JPMnLaqsTrSiDCKT0cfu4s2k
         Rf3SfJy7G3u5ND8q18MiPGKohlPDh1Ma1yaddnDVUZ0YIerAgAP6E2UmEo/C+T0X/uOh
         qDP/8ltL4iCD2oHUc+DdDWjkRVUD9xm187JHcnD+HVtHVbAMhvJp01fOX5xs+jY/mwDQ
         /nOQ==
X-Gm-Message-State: AFqh2kqhoH8dzUgb8SCcqxKZxOEGxJf/tO626egr9RsoqDGiW2pC9HLu
        pNi3AVlCOwxzMuCpgFb0v0mfXA==
X-Google-Smtp-Source: AMrXdXskG/XdWvQ8HFtIP8Q1Be1CwtVN1Og3jDz+l8UwvIOhe+iStq/VegfkuqYT7yo40FJJdmhk3A==
X-Received: by 2002:a05:600c:c12:b0:3da:28a9:a900 with SMTP id fm18-20020a05600c0c1200b003da28a9a900mr29642068wmb.41.1674639930039;
        Wed, 25 Jan 2023 01:45:30 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id fl22-20020a05600c0b9600b003d1e3b1624dsm1419238wmb.2.2023.01.25.01.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 01:45:29 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 6/9] ARM: dts: exynos: use generic node names for phy
Date:   Wed, 25 Jan 2023 10:45:10 +0100
Message-Id: <20230125094513.155063-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
References: <20230125094513.155063-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Align HDMI and USB phy node names with bindings expectation.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 arch/arm/boot/dts/exynos4.dtsi    | 4 ++--
 arch/arm/boot/dts/exynos5250.dtsi | 2 +-
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 2e81371e04c2..b91a66cda0a5 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -588,7 +588,7 @@ mshc_2: mmc@12530000 {
 			status = "disabled";
 		};
 
-		exynos_usbphy: exynos-usbphy@125b0000 {
+		exynos_usbphy: usb-phy@125b0000 {
 			compatible = "samsung,exynos3250-usb2-phy";
 			reg = <0x125B0000 0x100>;
 			samsung,pmureg-phandle = <&pmu_system_controller>;
diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index d1adaee2af58..a421f11b3a57 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -352,7 +352,7 @@ sdhci_3: mmc@12540000 {
 			status = "disabled";
 		};
 
-		exynos_usbphy: exynos-usbphy@125b0000 {
+		exynos_usbphy: usb-phy@125b0000 {
 			compatible = "samsung,exynos4210-usb2-phy";
 			reg = <0x125B0000 0x100>;
 			samsung,pmureg-phandle = <&pmu_system_controller>;
@@ -604,7 +604,7 @@ i2c_8: i2c@138e0000 {
 			clock-names = "i2c";
 			status = "disabled";
 
-			hdmi_i2c_phy: hdmiphy@38 {
+			hdmi_i2c_phy: hdmi-phy@38 {
 				compatible = "samsung,exynos4210-hdmiphy";
 				reg = <0x38>;
 			};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 9225f3552837..5b5aa79988e9 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -470,7 +470,7 @@ i2c_8: i2c@12ce0000 {
 			clock-names = "i2c";
 			status = "disabled";
 
-			hdmiphy: hdmiphy@38 {
+			hdmiphy: hdmi-phy@38 {
 				compatible = "samsung,exynos4212-hdmiphy";
 				reg = <0x38>;
 			};
diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index cea92f175d46..96f92faa70e0 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -776,7 +776,7 @@ hdmi: hdmi@14530000 {
 			#sound-dai-cells = <0>;
 		};
 
-		hdmiphy: hdmiphy@145d0000 {
+		hdmiphy: hdmi-phy@145d0000 {
 			reg = <0x145D0000 0x20>;
 		};
 
-- 
2.34.1

