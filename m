Return-Path: <SRS0=sb5j=YW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F43DCA9EC0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 01:13:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DEF2721721
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 01:13:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bJQ1CAmF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727827AbfJ2BNZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 28 Oct 2019 21:13:25 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:38531 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfJ2BNZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 21:13:25 -0400
Received: by mail-pf1-f196.google.com with SMTP id c13so8266896pfp.5
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Oct 2019 18:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=wM2SbEoxuP3Qc6FY3hlrlapI9AxvJdNttxIu5wUDh4E=;
        b=bJQ1CAmF2+pvXgePE5gnnyco6p/jHeLG/HuFHJ4YKyd3l1F4loFlMvcTEQt9wBuzxS
         iUTHAEbwO5NH7Qh+8EsD5+K2mOrQ0s+507TEHfKAVVtsS/GmDB0yV36zDHwemb5/RPon
         QJhflAxVufm4f3Yj07rUI/fglyJXop1kSSXTGVMs+j6kGPcakl0NMSKe5Sv9bxZXdK7S
         /fO0Dvp3E78UT+3RHBQv88nQZz5sHGSPpxmmwjGe0aOFrL3zm3CN+sWEzouijDoLasFd
         1AQQ+256rcZvjZpMkYBA2UKm3SsGFdj6MU8baXB1KxTMEKaSvPStdFNIlisHPn9UfFRT
         6tnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=wM2SbEoxuP3Qc6FY3hlrlapI9AxvJdNttxIu5wUDh4E=;
        b=uX3a160puBUKBc3RGkBxS98Llm+0P7w7SvX2pS5kITXLrtT95l3WV00jkSGdbFw+2l
         iAL+Q5zQKJBHvjgBg2WZOhnv7w7IvNOjvXq0Qhyb5AbF06udzYHdciuKtKOTV14L+sS5
         wwj7p7VqGTmeRDKbzdlANH4vSszocnW62JyJf87/AMsAzF0IIYycwZgXD+kiA8IZYBEp
         H9aUKGd9dK/LPzLOj5YyRJv1C/w5pzzc/UES6vTVyO421paiau+2Dz9o2izgiS3cmmk1
         q+/MXyoBAkeBj0+2NTOMbFxpjFQgJ3b5xjDwTRqeD0XSR4ZjbLo+jLTdKJLF90Si8qXb
         QMhg==
X-Gm-Message-State: APjAAAXWC61WZfu8b9Uyzx+2jA1kRlkJ73H/h3oKnY9zcEB03HoqQs+Q
        HWhm6W2mNXQfx+Twes9wBivssJMn
X-Google-Smtp-Source: APXvYqwzG5hVX/j8YZ2T/dRfawK90c/KvYZ9ypmt5XHXQekNbFbw4tvqM+xN3OMM2wbBeohK/PNgHw==
X-Received: by 2002:a63:5125:: with SMTP id f37mr12648913pgb.98.1572311604399;
        Mon, 28 Oct 2019 18:13:24 -0700 (PDT)
Received: from odroid.ad.adelaide.edu.au (staff-249-094.wireless.adelaide.edu.au. [129.127.249.94])
        by smtp.googlemail.com with ESMTPSA id l11sm13678491pgf.73.2019.10.28.18.13.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 18:13:23 -0700 (PDT)
From:   Marian Mihailescu <mihailescu2m@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH] ARM: dts: exynos5420: add mali dt bindings and enable mali on Odroid XU3/4
Date:   Tue, 29 Oct 2019 11:43:12 +1030
Message-Id: <20191029011312.4601-1-mihailescu2m@gmail.com>
X-Mailer: git-send-email 2.14.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add device tree bindings for Mali GPU for Exynos 542x SoC.
GPU is disabled by default, and is enabled for each board after the regulator
is defined. Tested on Odroid-XU4.

Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
---
 arch/arm/boot/dts/exynos5420.dtsi             | 49 +++++++++++++++++++++++++++
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |  5 +++
 2 files changed, 54 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 7d51e0f4ab79..5d60e0f1b09a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -670,6 +670,55 @@
 			iommus = <&sysmmu_gscl1>;
 		};
 
+		mali: mali@11800000 {
+			compatible = "samsung,exynos5420-mali", "arm,malit628";
+			reg = <0x11800000 0x5000>;
+			interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+						 <GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+						 <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "JOB", "MMU", "GPU";
+
+			clocks = <&clock CLK_G3D>;
+			clock-names = "core";
+			power-domains = <&g3d_pd>;
+			operating-points-v2 = <&gpu_opp_table>;
+
+			status = "disabled";
+
+			gpu_opp_table: gpu-opp-table {
+				compatible = "operating-points-v2";
+
+				opp@177000000 {
+					opp-hz = /bits/ 64 <177000000>;
+					opp-microvolt = <812500>;
+				};
+				opp@266000000 {
+					opp-hz = /bits/ 64 <266000000>;
+					opp-microvolt = <862500>;
+				};
+				opp@350000000 {
+					opp-hz = /bits/ 64 <350000000>;
+					opp-microvolt = <912500>;
+				};
+				opp-420000000 {
+					opp-hz = /bits/ 64 <420000000>;
+					opp-microvolt = <962500>;
+				};
+				opp-480000000 {
+					opp-hz = /bits/ 64 <480000000>;
+					opp-microvolt = <1000000>;
+				};
+				opp-543000000 {
+					opp-hz = /bits/ 64 <543000000>;
+					opp-microvolt = <1037500>;
+				};
+				opp-600000000 {
+					opp-hz = /bits/ 64 <600000000>;
+					opp-microvolt = <1150000>;
+				};
+			};
+		};
+
 		scaler_0: scaler@12800000 {
 			compatible = "samsung,exynos5420-scaler";
 			reg = <0x12800000 0x1294>;
diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 422692b20c46..210c305a0ce8 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -659,6 +659,11 @@
 	status = "okay";
 };
 
+&mali {
+	mali-supply = <&buck4_reg>;
+	status = "okay";
+};
+
 &rtc {
 	status = "okay";
 	clocks = <&clock CLK_RTC>, <&s2mps11_osc S2MPS11_CLK_AP>;
-- 
2.14.1

