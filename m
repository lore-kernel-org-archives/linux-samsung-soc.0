Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEF30C433E6
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 12:44:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD59E64EDD
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 15 Mar 2021 12:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbhCOMns (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 15 Mar 2021 08:43:48 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33265 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229787AbhCOMnV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Mar 2021 08:43:21 -0400
Received: from mail-wr1-f69.google.com ([209.85.221.69])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lLmZ6-0004hc-9n
        for linux-samsung-soc@vger.kernel.org; Mon, 15 Mar 2021 12:43:20 +0000
Received: by mail-wr1-f69.google.com with SMTP id l10so15067325wry.16
        for <linux-samsung-soc@vger.kernel.org>; Mon, 15 Mar 2021 05:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uEJ+dGSoJaOl9b6R9srU6s0ehbSLR30XvLByv0VyyrI=;
        b=FGyVCLjGE3+Hnlc8mBGl/FfQBSgV2MDKNwRtJdAJs3Wte6+4Frh2CY/vyJf9OjmWrY
         VHhPyd+JyLD+aMWsbw5BjFO/jPKmXDw+mKprfK65lTEJIxN5ZvclHEQ2OcLpsho6o8+w
         kvsBKf+YfB8Ru4Xk0nQ4h8jm0Ul/5ySeCcMzniZgCg7RQxLX+3ZQ8j0thwBB0WM8XIlc
         WwakNecDkNp0KmyT/AQ1Tsy9d7Rr0w31R/G4pZ5o0O78XdgamePIa1DkBMKw8czdIwaJ
         8z2y40+C6qyKsZj6DauQiF6rpw4E8SjfE2nRBupVUbUQdRvZRBiXRVYqd0soq6P2V4Kp
         JYsQ==
X-Gm-Message-State: AOAM532oq6fTV1nhyRGaRIiyxHl04A/jnUWK79bOb1dn3ZqxqekKOng5
        Gtqj/jAmzIQT65kcClsvKek+jKVaLRTQzenuWR+Go3+6nmFL52qJTCelW+x5gsQGqsM4oHbU06e
        QbZ7FJBRgnfP2lk5Cuhk5s99OUl6MYwDfytp7mp0il7VS1loJ
X-Received: by 2002:a05:600c:1405:: with SMTP id g5mr25401443wmi.140.1615812199951;
        Mon, 15 Mar 2021 05:43:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzWKQZx0GO/2hrw67COu0zD8W7FJdfl5S0esHLhy6NvwmcURPYJI8gyxRsk5tRJGfpgw7MVNQ==
X-Received: by 2002:a05:600c:1405:: with SMTP id g5mr25401423wmi.140.1615812199808;
        Mon, 15 Mar 2021 05:43:19 -0700 (PDT)
Received: from localhost.localdomain (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.gmail.com with ESMTPSA id r10sm14410094wmh.45.2021.03.15.05.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Mar 2021 05:43:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [PATCH 2/3] ARM: dts: exynos: white-space cleanups
Date:   Mon, 15 Mar 2021 13:43:12 +0100
Message-Id: <20210315124313.114842-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315124313.114842-1-krzysztof.kozlowski@canonical.com>
References: <20210315124313.114842-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fixups some white-space issues.  Checkpatch reported:

  WARNING: Block comments should align the * on each line
  WARNING: please, no spaces at the start of a line
  ERROR: code indent should use tabs where possible

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../boot/dts/exynos4412-odroid-common.dtsi    |  2 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts      |  3 +-
 arch/arm/boot/dts/exynos4412-ppmu-common.dtsi | 48 +++++++++----------
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi     | 28 +++++------
 4 files changed, 41 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
index eebe6a3952ce..333f83e93880 100644
--- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
@@ -2,7 +2,7 @@
 /*
  * Common definition for Hardkernel's Exynos4412 based ODROID-X/X2/U2/U3 boards
  * device tree source
-*/
+ */
 
 #include <dt-bindings/sound/samsung-i2s.h>
 #include <dt-bindings/input/input.h>
diff --git a/arch/arm/boot/dts/exynos4412-odroidx.dts b/arch/arm/boot/dts/exynos4412-odroidx.dts
index 0e9d626e740a..440135d0ff2a 100644
--- a/arch/arm/boot/dts/exynos4412-odroidx.dts
+++ b/arch/arm/boot/dts/exynos4412-odroidx.dts
@@ -84,7 +84,8 @@ hub@1 {
 			ethernet: usbether@1 {
 				compatible = "usb0424,ec00";
 				reg = <1>;
-				local-mac-address = [00 00 00 00 00 00]; /* Filled in by a bootloader */
+				/* Filled in by a bootloader */
+				local-mac-address = [00 00 00 00 00 00];
 			};
 		};
 	};
diff --git a/arch/arm/boot/dts/exynos4412-ppmu-common.dtsi b/arch/arm/boot/dts/exynos4412-ppmu-common.dtsi
index 3a3b2fafefdd..7f187a3dedcc 100644
--- a/arch/arm/boot/dts/exynos4412-ppmu-common.dtsi
+++ b/arch/arm/boot/dts/exynos4412-ppmu-common.dtsi
@@ -7,41 +7,41 @@
  */
 
 &ppmu_dmc0 {
-       status = "okay";
+	status = "okay";
 
-       events {
-	       ppmu_dmc0_3: ppmu-event3-dmc0 {
-		       event-name = "ppmu-event3-dmc0";
-	       };
-       };
+	events {
+		ppmu_dmc0_3: ppmu-event3-dmc0 {
+			event-name = "ppmu-event3-dmc0";
+		};
+	};
 };
 
 &ppmu_dmc1 {
-       status = "okay";
+	status = "okay";
 
-       events {
-	       ppmu_dmc1_3: ppmu-event3-dmc1 {
-		       event-name = "ppmu-event3-dmc1";
-	       };
-       };
+	events {
+		ppmu_dmc1_3: ppmu-event3-dmc1 {
+			event-name = "ppmu-event3-dmc1";
+		};
+	};
 };
 
 &ppmu_leftbus {
-       status = "okay";
+	status = "okay";
 
-       events {
-	       ppmu_leftbus_3: ppmu-event3-leftbus {
-		       event-name = "ppmu-event3-leftbus";
-	       };
-       };
+	events {
+		ppmu_leftbus_3: ppmu-event3-leftbus {
+			event-name = "ppmu-event3-leftbus";
+		};
+	};
 };
 
 &ppmu_rightbus {
-       status = "okay";
+	status = "okay";
 
-       events {
-	       ppmu_rightbus_3: ppmu-event3-rightbus {
-		       event-name = "ppmu-event3-rightbus";
-	       };
-       };
+	events {
+		ppmu_rightbus_3: ppmu-event3-rightbus {
+			event-name = "ppmu-event3-rightbus";
+		};
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
index d0aa18443a69..9599ba8ba798 100644
--- a/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
+++ b/arch/arm/boot/dts/exynos5410-pinctrl.dtsi
@@ -235,13 +235,13 @@ gpx0: gpx0 {
 		interrupt-parent = <&combiner>;
 		#interrupt-cells = <2>;
 		interrupts = <23 0>,
-		             <24 0>,
-		             <25 0>,
-		             <25 1>,
-		             <26 0>,
-		             <26 1>,
-		             <27 0>,
-		             <27 1>;
+			     <24 0>,
+			     <25 0>,
+			     <25 1>,
+			     <26 0>,
+			     <26 1>,
+			     <27 0>,
+			     <27 1>;
 	};
 
 	gpx1: gpx1 {
@@ -252,13 +252,13 @@ gpx1: gpx1 {
 		interrupt-parent = <&combiner>;
 		#interrupt-cells = <2>;
 		interrupts = <28 0>,
-		             <28 1>,
-		             <29 0>,
-		             <29 1>,
-		             <30 0>,
-		             <30 1>,
-		             <31 0>,
-		             <31 1>;
+			     <28 1>,
+			     <29 0>,
+			     <29 1>,
+			     <30 0>,
+			     <30 1>,
+			     <31 0>,
+			     <31 1>;
 	};
 
 	gpx2: gpx2 {
-- 
2.25.1

