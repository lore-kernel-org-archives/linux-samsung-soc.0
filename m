Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECF56C7EE2C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Aug 2023 21:55:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbjHYVy7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Aug 2023 17:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbjHYVyu (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Aug 2023 17:54:50 -0400
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE39C26B2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Aug 2023 14:54:47 -0700 (PDT)
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-3a812843f0fso880945b6e.2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Aug 2023 14:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693000487; x=1693605287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biEa1K9qjP5wRSXkBfGSs8U4rFVAjb1zKI5IMPs39Jw=;
        b=xDpZfI4xx12HndT5FhmxsDcpxlYaeOx5ohuFiPuWPgZ7QxicELjJ2qaHYn+x7fyAcx
         clApEhUF5NaVlP/usxb/fJLGK7LTVE3ST2C9dkIIQMzPvPKvnErD/Stp+CIIRuWr/tM8
         /CfWeXYcp41SOIbAHs1KGsNrUFEADcn5K3+eWrLF6FTTgFO1rn9zMUj4+yIJYuIfHd22
         CPW7NqSaGHV254TxXKzfUh5py3WFyT8QCSHBuo4WTwyEBEfWu+UeMRTSMVAyuDyHR1Nn
         YL3fq3f1b41VTmmjbZewb3ZfByxgxBSFjaw7E1RIT+oIKGErDfkxaebVeYbppbCzih1R
         dV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693000487; x=1693605287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biEa1K9qjP5wRSXkBfGSs8U4rFVAjb1zKI5IMPs39Jw=;
        b=Hxf7Q3h5J+HFNZN9ozQwEWzx2SEztsOuMTMAKwAkH119q/dDERVGMtlUm0a9VaIhGY
         8OFncIQoVPhvpbCcMiItflGcfta+X/4/yN5e4p838CGMYD/4V9cP49kk1CK56r1g/5zB
         4rchiZ8N9w/zzZPVjy8N0UbudpDS9NWkxntUHQdp1VOhZkq56cEhsMuvLJ2f5Eezbytu
         V8hvB6KgrfX/Pia/rsH3bq/1arLd97dpZNS3Np9AFQXg5V91/ef2wxU3sod2OgsaZBSw
         vQI736QtzB0W5BbEBx5ePF6v409XOL57IWRVll3oT6w1Bbjvxp7UsLKfULKtXFfx/pFM
         E/Ww==
X-Gm-Message-State: AOJu0YzBP+qmio11ERmw/6M5SLmAMfzMLfRhTsvyCRJT1KVqAf6GZui1
        ttqxn0p+CWtvEIDCiKdeDUHIL/hMECJb8IddTIw=
X-Google-Smtp-Source: AGHT+IEFHhXWOdPz1pvJu2XmLQUai8oqXZdsZwboIzFEgLUHvjMNnfLp5RyprhrihzQcg6pOcQvyZQ==
X-Received: by 2002:a05:6808:144d:b0:3a4:6691:9340 with SMTP id x13-20020a056808144d00b003a466919340mr5353831oiv.41.1693000487314;
        Fri, 25 Aug 2023 14:54:47 -0700 (PDT)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id bg20-20020a056808179400b003a7a34a4ed8sm1197752oib.33.2023.08.25.14.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 14:54:47 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        JaeHun Jung <jh0801.jung@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: exynos: Enable USB in Exynos850
Date:   Fri, 25 Aug 2023 16:54:44 -0500
Message-Id: <20230825215445.28309-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230825215445.28309-1-semen.protsenko@linaro.org>
References: <20230825215445.28309-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add USB controller and USB PHY controller nodes for Exynos850 SoC.

The USB controller has next features:
  - Dual Role Device (DRD) controller
  - DWC3 compatible
  - Supports USB 2.0 host and USB 2.0 device interfaces
  - Supports  full-speed (12 Mbps) and high-speed (480 Mbps) modes with
    USB device 2.0 interface
  - Supports on-chip USB PHY transceiver
  - Supports up to 16 bi-directional endpoints (that includes control
    endpoint 0)
  - Complies with xHCI 1.00 specification

Only USB 2.0 is supported in Exynos850, so only UTMI+ PHY interface is
specified in "phys" property (index 0) and PIPE3 is omitted (index 1).

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Put ranges after compatible in usbdrd node

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 30 +++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index aa077008b3be..53104e65b9c6 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -570,6 +570,36 @@ sysreg_cmgp: syscon@11c20000 {
 			clocks = <&cmu_cmgp CLK_GOUT_SYSREG_CMGP_PCLK>;
 		};
 
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos850-dwusb3";
+			ranges = <0x0 0x13600000 0x10000>;
+			clocks = <&cmu_hsi CLK_GOUT_USB_BUS_EARLY_CLK>,
+				 <&cmu_hsi CLK_GOUT_USB_REF_CLK>;
+			clock-names = "bus_early", "ref";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+			};
+		};
+
+		usbdrd_phy: phy@135d0000 {
+			compatible = "samsung,exynos850-usbdrd-phy";
+			reg = <0x135d0000 0x100>;
+			clocks = <&cmu_hsi CLK_GOUT_USB_PHY_ACLK>,
+				 <&cmu_hsi CLK_GOUT_USB_PHY_REF_CLK>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
 		usi_uart: usi@138200c0 {
 			compatible = "samsung,exynos850-usi";
 			reg = <0x138200c0 0x20>;
-- 
2.39.2

