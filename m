Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 680B0C54794
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 15:54:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231629AbjATPyh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:54:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231604AbjATPyd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:33 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 231C9DF954
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:23 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id fl11-20020a05600c0b8b00b003daf72fc844so6166057wmb.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmvkahJnJPGZHnYSzbVDVni5JGwF4pYBp1CYe5p5z9g=;
        b=JSREVOLUC18RqwaXMd7Zkdfwk2edeiKs39U+FngduPFHHcw7Ylmr3bbDFlMMkrBxbH
         RyTeMmhifDDjDjZN68KnhDMf8Je469Kbjprn3fsvjHvJeI7lWBwfqoevCgL9vfdLrdKS
         5w7xOdWn0G4OSgXSSG5cjIakHa+RlvJdiqT7Pzq+VT128Fuk+ay0R1jyG/wy35WifCDo
         EahNQ5KaDKzx3ADBmcAwa2rRxbPU35Yw2mHIE2/3F5lgGfyB2TPOB0u0M1hNjbl5a/Rx
         zMPChhMLJa5ovxv+hhPejoIhjuOrp7ix1OMgGYdxdfvMgYRrULkN2DtVmdCcFqAeo4As
         tkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FmvkahJnJPGZHnYSzbVDVni5JGwF4pYBp1CYe5p5z9g=;
        b=JO29saHDkzjoH1rtMKEbYfmMzgqMLoo1UYnYiVl+2Ll4OgZuIK/iy52GOS66CJxWVW
         U7xsHfXEXumPZEPOVRpQzgMV+8EmsygHlPfXeDNTw/QyWdl8iDdhn1uwamLZf25D52Y6
         EyvpuaTQdfXhg//xjv2Ed7NxtuQMMdTD0i4P3AXnGuewaJYpeAykBwwjeOHBINaz1oTI
         k4js7w+2P/ItBbd5JCFKVm0QjZIZF7VJufuWpjS1mk/7ICRr8lgT/q0ulABYwJwp2q37
         XhyqLxhZNnMoWs6IAS2GhUQQNsur10nsfrwJDg/LBvSG+HwdFuXf4SQlfUJE7gCSk9xG
         RQWw==
X-Gm-Message-State: AFqh2kqbZ68TnyZg3xYfcI9EJLMxhbSy3P42Xb1q9xBL2VFz3s3Au43o
        w/VvWemfIJe+lhVFUPklpt3h+Q==
X-Google-Smtp-Source: AMrXdXtT+/pjtAzumRFn7MR9+GO3xfqIabangPY5gfiLmeuvvw3RNhnTSCieqQLklmOSM63c7oiBqg==
X-Received: by 2002:a05:600c:1e21:b0:3d0:7fee:8a70 with SMTP id ay33-20020a05600c1e2100b003d07fee8a70mr14995666wmb.19.1674230061636;
        Fri, 20 Jan 2023 07:54:21 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:21 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 06/11] ARM: dts: exynos: add panel supply in Tiny4412
Date:   Fri, 20 Jan 2023 16:53:59 +0100
Message-Id: <20230120155404.323386-7-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
References: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The simple panel should have a supply.  Provide a stub, as the board DTS
does not have a PMIC node, to silence warning:

  exynos4412-tiny4412.dtb: panel: 'power-supply' is a required property

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/exynos4412-tiny4412.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4412-tiny4412.dts b/arch/arm/boot/dts/exynos4412-tiny4412.dts
index 04388c575efe..e0b6162d2e2a 100644
--- a/arch/arm/boot/dts/exynos4412-tiny4412.dts
+++ b/arch/arm/boot/dts/exynos4412-tiny4412.dts
@@ -79,6 +79,7 @@ pmic_ap_clk: pmic-ap-clk {
 
 	panel {
 		compatible = "innolux,at070tn92";
+		power-supply = <&vddq_lcd>;
 
 		port {
 			panel_input: endpoint {
@@ -86,6 +87,13 @@ panel_input: endpoint {
 			};
 		};
 	};
+
+	vddq_lcd: regulator-vddq-lcd {
+		compatible = "regulator-fixed";
+		regulator-name = "vddq-lcd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
 };
 
 &cpu_thermal {
-- 
2.34.1

