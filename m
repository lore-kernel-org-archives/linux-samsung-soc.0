Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE80C0015E
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 22 Jul 2023 12:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbjGVMRc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 22 Jul 2023 08:17:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230344AbjGVMR2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 22 Jul 2023 08:17:28 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AB4910C6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jul 2023 05:17:27 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-317009c0f9aso2426463f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Sat, 22 Jul 2023 05:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690028245; x=1690633045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYNA0eA6zTpIVrLQIQILDRIMWUDj6tQ3eTCKjVqejNg=;
        b=lTGur3HjPh+24Q/GOoLXJK6GH1QbnIUwPqJ93LQdr9XSyYWSyqiUIuUbtUHFvkIAer
         uF8oWzeUakeP//THm9J2kIR8ZRCY76uNjhIgUvsjY8VnfRkDFFLJ2YokaYz9JjcSqCM4
         EUVsRTnQeIaIcRVSXb0B15DBr7VWGkGS0jG9TJ/Z/MOqQkQ4IEprYHbx6AnpinUXwfSN
         zTSTjkN+9oSPFS4wGmg+F6wpeZyJP1RKlZMTUxKgltYi4HPFa6nbWdoi9iKDq6WkSHSy
         jF0MUXuhRWPrexaUgLU70gyCilPjcRKQ8d0CFltTAnhkygDbG6DnxCEP5hxxCAVI+4aV
         XsoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690028245; x=1690633045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tYNA0eA6zTpIVrLQIQILDRIMWUDj6tQ3eTCKjVqejNg=;
        b=HwNo9K46JkIB1xzax+1CXx5p+aycdzq9p2N35EJeVuSpCSWwG+Ivof0cM+7f7DxuZX
         e+Fv2bsB2aIOFYnfDmeS5VcpkypJhnoPvPgsG2zAiVYpPgFT5dPpGw/TrMeN+lEPU9n0
         pRWfL3jcIe/N/uHFe1zmjL32hj7iT6oaLWJklojo4E9UDOsHvxJ3sEIKxzL9XIdQAXhQ
         w1W8YGbOmaxhLQKCtf2Zy9bEnh1NrHoeE3wuGg5TtPQpNuV1Wsblc9gt1BxmHoqfa7ZN
         BLAjbIqAEpXVvNXGNH+B5qN0mwKLeIjAIgk06ixs1Ryg+Kx0wt9+SvQzhFGVok5NKzrg
         BHNw==
X-Gm-Message-State: ABy/qLaeA+p0FrU6XjuePG1q3/xbK2cRggYHtYXlLhFiRAOR209SZEou
        iCwm4ePbd89Ul7oh/5q1InLKCQ==
X-Google-Smtp-Source: APBJJlFa6HLdZkKgR0Jf0kClb3GPuraMh66N7bcNCziOtQEkeaNrl44e92mgZ7gk6h6dAhxLtU4MUQ==
X-Received: by 2002:a5d:49c1:0:b0:315:9de4:92f0 with SMTP id t1-20020a5d49c1000000b003159de492f0mr4219589wrs.5.1690028245712;
        Sat, 22 Jul 2023 05:17:25 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d5492000000b003142e438e8csm6779086wrv.26.2023.07.22.05.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jul 2023 05:17:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] ARM: dts: samsung: s5pv210: fix camera unit addresses/ranges
Date:   Sat, 22 Jul 2023 14:17:19 +0200
Message-Id: <20230722121719.150094-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230722121719.150094-1-krzysztof.kozlowski@linaro.org>
References: <20230722121719.150094-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The camera node has both unit address and children within the same bus
mapping, thus needs proper ranges property to fix dtc W=1 warnings:

  Warning (unit_address_vs_reg): /soc/camera@fa600000: node has a unit name, but no reg or ranges property
  Warning (simple_bus_reg): /soc/camera@fa600000: missing or empty reg/ranges property

Subtract 0xfa600000 from all its children nodes.  No functional impact
expected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. New patch
---
 arch/arm/boot/dts/samsung/s5pv210.dtsi | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/samsung/s5pv210.dtsi b/arch/arm/boot/dts/samsung/s5pv210.dtsi
index f7de5b5f2f38..ed560c9a3aa1 100644
--- a/arch/arm/boot/dts/samsung/s5pv210.dtsi
+++ b/arch/arm/boot/dts/samsung/s5pv210.dtsi
@@ -549,17 +549,17 @@ i2c1: i2c@fab00000 {
 
 		camera: camera@fa600000 {
 			compatible = "samsung,fimc";
+			ranges = <0x0 0xfa600000 0xe01000>;
 			clocks = <&clocks SCLK_CAM0>, <&clocks SCLK_CAM1>;
 			clock-names = "sclk_cam0", "sclk_cam1";
 			#address-cells = <1>;
 			#size-cells = <1>;
 			#clock-cells = <1>;
 			clock-output-names = "cam_a_clkout", "cam_b_clkout";
-			ranges;
 
-			csis0: csis@fa600000 {
+			csis0: csis@0 {
 				compatible = "samsung,s5pv210-csis";
-				reg = <0xfa600000 0x4000>;
+				reg = <0x00000000 0x4000>;
 				interrupt-parent = <&vic2>;
 				interrupts = <29>;
 				clocks = <&clocks CLK_CSIS>,
@@ -572,9 +572,9 @@ csis0: csis@fa600000 {
 				#size-cells = <0>;
 			};
 
-			fimc0: fimc@fb200000 {
+			fimc0: fimc@c00000 {
 				compatible = "samsung,s5pv210-fimc";
-				reg = <0xfb200000 0x1000>;
+				reg = <0x00c00000 0x1000>;
 				interrupts = <5>;
 				interrupt-parent = <&vic2>;
 				clocks = <&clocks CLK_FIMC0>,
@@ -586,9 +586,9 @@ fimc0: fimc@fb200000 {
 				samsung,cam-if;
 			};
 
-			fimc1: fimc@fb300000 {
+			fimc1: fimc@d00000 {
 				compatible = "samsung,s5pv210-fimc";
-				reg = <0xfb300000 0x1000>;
+				reg = <0x00d00000 0x1000>;
 				interrupt-parent = <&vic2>;
 				interrupts = <6>;
 				clocks = <&clocks CLK_FIMC1>,
@@ -602,9 +602,9 @@ fimc1: fimc@fb300000 {
 				samsung,lcd-wb;
 			};
 
-			fimc2: fimc@fb400000 {
+			fimc2: fimc@e00000 {
 				compatible = "samsung,s5pv210-fimc";
-				reg = <0xfb400000 0x1000>;
+				reg = <0x00e00000 0x1000>;
 				interrupt-parent = <&vic2>;
 				interrupts = <7>;
 				clocks = <&clocks CLK_FIMC2>,
-- 
2.34.1

