Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C8239AC7
	for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 10:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386956; cv=none; b=Vh6Cvj9Z9cP3xldr/0zEBWEFSUk/SWUac4kz2gS0IAuI6Ob1gGikrUNJKs2LHeG6w61FwyAQMmdLy84A+OcM+kIa1JMZf1EeB/8wT8VN1ZQc6F0tnl+B65J4JY0IlGMMu+x+tTse5ZlNBWJ9sp7yWyHOGCYfXfmEsXwk/r3Uv70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386956; c=relaxed/simple;
	bh=D4hROTlU0kdQTa7T42f1g071O1XrjI4wtd36yDhM8oc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TdnnrAC/FyIIqk9esK6gdo1BaLYyb1TqmMi4ttO3zTMDi9daidvrAoc6QZ6OPg9jx7/uyEA7FLtbafsWlYyBzqRDaOfFNs7cg+LQ9POKfEskE2q+6zUPCuDYiKC0fZqx/9WlPxqYafeVok5bufmCbiVFT3GsrDMHJMtHnLlNTN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=osimp+Wi; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="osimp+Wi"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a58e7628aeaso213079166b.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 29 Apr 2024 03:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714386951; x=1714991751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1P++aQSPc6pWnY3non1DpBZNviMvxG8QQjODyNDwQzI=;
        b=osimp+WiytLxDG8KJBdBU4qUKR0yFjLp58CqKkInZ1buLLuJWQgY0k8JHLCnx+1ko0
         qM8YpGjINTPHivPOYGB5dEzTxgRmGFpIDTCvo8mFfjqQTuaQmBW9an3CWRhtBBxSWa0o
         8kJszKALlUxg7PPdm2EpddNFndP6tDLx/aeNyCCJEKIunzOGbxXRccxnyNpnwgZwVZeW
         ck/yDREus4+8srQ/CRAjVwHnAv5aoiPyc87yGz7yFv53maGkQFebOTKnuK2xPb2ksRcH
         RHImQckeOZPJQgXI0oHcTTOVkWmYHYg364lMOG5KiJGcrQKIHTVUVItZjhCWfY/potfw
         H1JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714386951; x=1714991751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1P++aQSPc6pWnY3non1DpBZNviMvxG8QQjODyNDwQzI=;
        b=HGDbARCkv+nvZGsQIwQ55uS3cIh+yN6WGDCKixESN4YTdtoZzDYDsNxS4HFLAKxO2/
         nBMS2agJT234cWRQSNBtnYRG/VHd/FkwHEfsyvE4HepfHNqOzmtCwfo8b0cuSpXtw7b+
         B4O10RZXvcfzsACWJdkRhrp98zvPVZ4vuBqnMnj+bafbR02T8vPLt00CcrNgWhmY0d1j
         oTsUGz2qWxU9486R9xf6xfI66OuSJ+KmstfEWoJ4haWuYuER45d4HNXX6BZrxVx7vJZo
         3y6KvIueXvY4yj/OPFQ+NVN4rcMirvadIYyhbBkoBDP45fR5HCedzBT1kE1zmXMSEXxQ
         f54g==
X-Forwarded-Encrypted: i=1; AJvYcCUjVUVyo1+GEDNWxE2gd8VMTmwKIdIrf6u5bZdXj7opyXVq5Gt5TWPi1wSGCH+yGr1agGH1mDTyjK/oMX7lqsEuNmeksY8AJnMUZCp19Jo22kg=
X-Gm-Message-State: AOJu0YwvyvMNpTpgFbM/nVmD2to57pwmsJHAEGMIYoTMLnhaOdy7XzNc
	6LfonwNiCp1PX+GJ/KZqpy0eGcO7d0CYy/UTwWN0bO3NKQtPPGTT1HM1vhkQ/2U=
X-Google-Smtp-Source: AGHT+IG2LaIhBRpKrhiNyxNfVcTeKVZT84nL2xVtGWqcgk4hja1Hk5xHRR/xQujTgEuZrNki/5RqzQ==
X-Received: by 2002:a17:906:5fd3:b0:a58:e8c7:c0b8 with SMTP id k19-20020a1709065fd300b00a58e8c7c0b8mr4308756ejv.7.1714386951704;
        Mon, 29 Apr 2024 03:35:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id a7-20020a170906670700b00a522bef9f06sm13717707ejp.181.2024.04.29.03.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Apr 2024 03:35:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 29 Apr 2024 11:35:49 +0100
Subject: [PATCH v2 1/2] arm64: dts: exynos: gs101: add USB & USB-phy nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240429-usb-dts-gs101-v2-1-7c1797c9db80@linaro.org>
References: <20240429-usb-dts-gs101-v2-0-7c1797c9db80@linaro.org>
In-Reply-To: <20240429-usb-dts-gs101-v2-0-7c1797c9db80@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.12.4

Add the USB 3.1 Dual Role Device (DRD) controller and USB-PHY nodes for
Google Tensor GS101.

The USB 3.1 DRD controller has the following features:
* compliant with both USB device 3.1 and USB device 2.0 standards
* compliant with USB host 3.1 and USB host 2.0 standards
* supports USB device 3.1 and USB device 2.0 interfaces
* supports USB host 3.1 and USB host 2.0 interfaces
* full-speed (12 Mbps) and high-speed (480 Mbps) modes with USB device
  2.0 interface
* super-speed (5 Gbps) mode with USB device 3.1 Gen1 interface
* super-speed plus (10 Gbps) mode with USB device 3.1 Gen2 interface
* single USB port which can be used for USB 3.1 or USB 2.0
* on-chip USB PHY transceiver
* DWC3 compatible
* supports up to 16 bi-directional endpoints
* compliant with xHCI 1.1 specification

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2: fix commit message
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 41 ++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index 9755a0bb70a1..217699477b32 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1261,6 +1261,47 @@ cmu_hsi0: clock-controller@11000000 {
 				      "usbdpdbg";
 		};
 
+		usbdrd31_phy: phy@11100000 {
+			compatible = "google,gs101-usb31drd-phy";
+			reg = <0x11100000 0x0100>,
+			      <0x110f0000 0x0800>,
+			      <0x110e0000 0x2800>;
+			reg-names = "phy", "pcs", "pma";
+			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_ACLK_PHYCTRL>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB20_PHY_REFCLK_26>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_CTRL_ACLK>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_CTRL_PCLK>,
+				 <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USBDPPHY_SCL_APB_PCLK>;
+			clock-names = "phy", "ref", "ctrl_aclk", "ctrl_pclk", "scl_pclk";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		usbdrd31: usb@11110000 {
+			compatible = "google,gs101-dwusb3";
+			clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_BUS_CLK_EARLY>,
+				<&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_SUSPEND_CLK_26>,
+				<&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_ACLK>,
+				<&cmu_hsi0 CLK_GOUT_HSI0_UASC_HSI0_LINK_PCLK>;
+			clock-names = "bus_early", "susp_clk", "link_aclk", "link_pclk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges = <0x0 0x11110000 0x10000>;
+			status = "disabled";
+
+			usbdrd31_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				clocks = <&cmu_hsi0 CLK_GOUT_HSI0_USB31DRD_I_USB31DRD_REF_CLK_40>;
+				clock-names = "ref";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH 0>;
+				phys = <&usbdrd31_phy 0>, <&usbdrd31_phy 1>;
+				phy-names = "usb2-phy", "usb3-phy";
+				status = "disabled";
+			};
+		};
+
 		pinctrl_hsi1: pinctrl@11840000 {
 			compatible = "google,gs101-pinctrl";
 			reg = <0x11840000 0x00001000>;

-- 
2.44.0.769.g3c40516874-goog

