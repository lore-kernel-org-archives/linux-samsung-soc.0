Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A968143C69
	for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 20:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713905574; cv=none; b=i52ufhXi22xnN0JpUkNqE9O25q2c4OBwgpBOpPOZD0Xnf4AvxKssKiodHSfv6STIzIcwYPCKHJm9G/yu5y7qDKawSMDwpJ521zoQWM3C6o9OOSrL3K0J8d9qKBbtV5WLmGXNhGPlCwELa+6404qxnlPPTcxfqDvyEhzHJaTCnEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713905574; c=relaxed/simple;
	bh=7n2qiRxfXj0RhQJoPJ2Jx1nLhQPN1ajHcYUQIS8AbvY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CYmqRoAXUakYhCtGkCtLAej37mBh5rUUr7P9AV/o0MRhIf/FGg/JAhnKuSrgyrpqV0i2BuQJheJBkkvc2l127n1iGfqlrh1KQ7vH01VFNfhI4Cz/7Hucc+KXWkuqqugjjbXRKXP8mChgxtijoEna/Lb57m/vgJ9jF9TxdtuK/S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kLFQjipZ; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kLFQjipZ"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-349545c3eb8so4460839f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 23 Apr 2024 13:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713905571; x=1714510371; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+1GZJJLKOpK1Q+g+fKW1mL5kKY9CXXEvR0RLPI154Do=;
        b=kLFQjipZCU8TkamC5b5w0oFq+LEnP4Pgy2cMg+gMnlMoO0vQm13A9vMh1PNgrt8pTW
         SU7qOcQ7Ei4TfvK1h6cNirN4ZoP+eE/bXPmUopsuSux77jkC7nA2Ip8q6UCMRxbergLA
         vcNWDNZm2JwYOYwhFbTjT4MPAiRma/gD9xaMMDmkGSeqF5VWuUveTtRhEpEuavAfe1+G
         xQmqK3jKBFQHIwa562ltcn1gbaCH5qgh+qbGsDWswPOGDq2KZmBVkvfHExfXMoLd0I6C
         Mfsk4d4RjMmeAgmHeULWkRi6kz9kYvoGdJgc/IQdn+rkc+thFfXBn3Mz6H6ZtrkyZfsn
         kkcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713905571; x=1714510371;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1GZJJLKOpK1Q+g+fKW1mL5kKY9CXXEvR0RLPI154Do=;
        b=WPIQM0PTFqzbeJ4YS8VHSBapQkDp6YVv/2Tc3cdg4KD8rlPl0IIS9vRayxS3gOvVp8
         3rBEjb35uK0rTGxQsbo39rfymEci7wfCG0WZWNVs90LUgneDoNnTTzIZasIJduNGmJhJ
         brhC6GsnAhyX/iZGhRlNt9eBoOkcDz0T2GRc6gbYRq4vOTkCq7+LNGG+GmExS5F3hhKX
         LN4c25UR7bvWyCgYJeqtoH7k46Zv3GdHQa0Q+hf3NJ7wrckDFayiHq5Obh20WsKXF89z
         IJmsJEGVakPA7ZsKNcZBcQznpAXR79mVFRXKTb1N/kIEYms9RGTDtnHTr/WRA95CmeEy
         Jhvw==
X-Forwarded-Encrypted: i=1; AJvYcCWykw8Jl9kxJb4qVfgOVtnpofGO2dV8akv2i14UDui27gVbcW/Hrey5Cc3fH2mozkN2K0GUNH61AUH67Ao0TCT5cGTl+FAbmUg6mxsHQC5vCeY=
X-Gm-Message-State: AOJu0YxgBhuHCGKGPBjR5Mr4J+QQXpGChDupqIC/a9KBojv16MBsigGP
	7KDreDtwCfy+YUzkN+UC1cijXD6MXyEOv71MXJcRe/P8QupBa3j9rMC0P86YAf4=
X-Google-Smtp-Source: AGHT+IGPqJXCIDxoj6NAZw3IbNqMNkT4Uv70uq1zZQXA3Olp0L8WIOCIUWsqcEistgn+Tb18fIngGA==
X-Received: by 2002:adf:e603:0:b0:33e:c03e:62 with SMTP id p3-20020adfe603000000b0033ec03e0062mr236757wrm.40.1713905571224;
        Tue, 23 Apr 2024 13:52:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id ww4-20020a170907084400b00a51d88e6164sm7443632ejb.203.2024.04.23.13.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 13:52:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Tue, 23 Apr 2024 21:52:48 +0100
Subject: [PATCH 1/2] arm64: dts: exynos: gs101: add USB & USB-phy nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240423-usb-dts-gs101-v1-1-3421b0371298@linaro.org>
References: <20240423-usb-dts-gs101-v1-0-3421b0371298@linaro.org>
In-Reply-To: <20240423-usb-dts-gs101-v1-0-3421b0371298@linaro.org>
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
* single USB port which can be be used for USB 3.1 or USB 2.0
* on-chip USB PHY transceiver
* DWC3 compatible
* supports up to 16 bi-directional endpoints
* compliant with xHCI 1.1 specification

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 41 ++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index eddb6b326fde..b4e48ab890a6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -1247,6 +1247,47 @@ spi_13: spi@10d60000 {
 			};
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

