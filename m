Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F5C72E1F02
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 21:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758143071; cv=none; b=NYzsAXQn+yO96y61zOs3vwuHYd9s82VNNFaJKaWOhdDbzPcrO5LojB5YuciYEOuL8ZO+1k7trOG4hqHEpSsRR8lOocHSrDUc48sE78S2GobpHWvhJZ1aAlqXg37/SvV6DZFichuyMGekSZYr//BievJw1O1o09LfeFd0dafxAaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758143071; c=relaxed/simple;
	bh=dpzH3ZgZfhAHeookD5eV+FtY/q5RImJCHodew0fPSVw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZAX11OwsSiV6uzSV3puotoZoLtJ6doHFE21HW2wvaVXD1enpAdJIrZPCuhAlRt+C/vnpfpz5InUUSmzVDKELkShSNdcF7T/V6OMmoc/Mo296DLQaaCTrFX05xzOt7IbWUsQSiNfqNEU0P3w2sAabY7esAvm3UZEOFHymvrQf0Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZeGsShaT; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZeGsShaT"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-778d99112fbso2712556d6.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 14:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758143067; x=1758747867; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rScmOcK/Kz2XNUOFOt6dJ286EcKY4tMZMYUqUQHpaYg=;
        b=ZeGsShaTmxDAVtApix4bayEHtWhb8LsKK8t52Wsotfm/QnjEFrwwJIYmmoaB+JfVDw
         EI6q86F736YuN6txsW8OyfKt+vY+SKdumWlewpLMtukU3Iq8bSiHzyoHclWDdS145lfV
         TjxdUelO5wlHrm8N+qtKVnSxxnlsC3XE+QyYoroEDKBN8ex33g1ftuqHb7ZzGl+UdObD
         5O8H/ypU5momudp9okYcedtr35/pzR+NPmYaaJW5kSzikyZWFj06vaYWPHfSVbtbBiXa
         A04sWgyrnX7jrddHyNhb6fnBesj8dBiYdf5ZXQuUXxB1WpIQIHjbpR9X5ZM2uv4rbBCx
         lREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758143067; x=1758747867;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rScmOcK/Kz2XNUOFOt6dJ286EcKY4tMZMYUqUQHpaYg=;
        b=MsMRGvU+wgFbn5o/PRAGwabrvPSoGWlGjxVnC/f8H7wUTkt6+DeqOz6vhskNxtPJ+7
         0wyDiUK5x130pcFvcnsaZxlOM+EHmQ9Db6xZViIWPQC6Ch4Iw3hb3+Vz2n6QMQzPEw4R
         Ij4c5a0A/+ouGD+e6v6YqSX1edTYSozeiLY1JruWnUkN0WJOOS0c4u5nBGv+TCQBYrzb
         UJ6X+IqTYs2AwG4nK8xyh5DGCSkrl30K9h21VbGAL5LHtkRv55nquD5Sbs43oncZwIx+
         7M6D1lRAXoawUHwIfbT3gPZPvmii4Dob5k/piLyVfON1n+5VA5CCYFJ9glumqKw27maq
         N8oQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOw3rPCGNrUrHzNgAqHT4haJtm4peXIp6JxPcKhDNUTqsXiXIrFYUH9QBI1PAuBrY0keN5zxnizF/kWPyhZr3uiQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsAUFCaQDO8U0/qqbCzyvjcBvw5M7NG+fO9CdcEQ5G5f45uhhC
	GeGY6IpiBIyo2zyJ3iu6Dt76I+UDciVK5jnLdSN1nbp+OQiyEP2ttdZr
X-Gm-Gg: ASbGncsGXCH3Agi4L0ctALR8e+0kzXvMiWdEzOhuOGv5XhIJoLQVkpLY1tmHs9UrOTK
	bQn5gwIQwXHFvVkSf035NMq5nKFeNLCt96CKJZ9gXePv5bv50CEQc6ErWMue5fYRG8gAgh2Ltlr
	m0LX5upfcsEyKP55P3LGX8PCof9m3dPqWTzcOBdZG2i/rBT+0kiSB9wQAkm2OJrApP4PO8Yl9IR
	T5JJDhSYq2whbuTVIVALAq/UlTB9RdxRgTVU1bhJaLtgyk8UjWJeCyxSWr5zxDl3aU9HS1YeWfg
	/mRH5kciPxWDx14mPM9//8LgYvctBDSPE/+BFBhsH8STq7z26u+4Wkm3ah4vzsPEatv3sAb3qoR
	VQNb8z/RADVi1moHvHJAR62CEHC8j4GlHC0ElozNloT8t
X-Google-Smtp-Source: AGHT+IExuzovxP8Zn5vlfq5BEJhcOcbH3jOSulS76F9O+uegFBEF1Mh7x8YWAUPDWU56s84wZ9djlw==
X-Received: by 2002:a05:6214:5183:b0:77a:29ba:1b68 with SMTP id 6a1803df08f44-78ecf309395mr40268536d6.63.1758143066759;
        Wed, 17 Sep 2025 14:04:26 -0700 (PDT)
Received: from [127.0.0.1] ([51.8.152.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-793543ffae5sm1897226d6.53.2025.09.17.14.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 14:04:26 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Date: Wed, 17 Sep 2025 21:04:24 +0000
Subject: [PATCH v3 4/7] arm64: dts: exynos990: Add USI nodes for PERIC0 and
 PERIC1
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250917-perics-add-usinodes-v3-4-a3629e4666ef@gmail.com>
References: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
In-Reply-To: <20250917-perics-add-usinodes-v3-0-a3629e4666ef@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-serial@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758143062; l=9012;
 i=wachiturroxd150@gmail.com; s=20250831; h=from:subject:message-id;
 bh=dpzH3ZgZfhAHeookD5eV+FtY/q5RImJCHodew0fPSVw=;
 b=XR7xcpWVxcZIHpVBO57uE9viom3J0Pq6mzGf3veugSWl76SHxT7RB0V4yl4YmE5SRe8q1kGE8
 vZshDF7HGEtBhwL6CU9L1xjGXHc52dMs2A8r9fHgEqKkm8xFhECio9+
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=3fZmF8+BzoNPhZuzL19/BkBXzCDwLBPlLqQYILU0U5k=

Add USI nodes for PERIC0 and PERIC1 blocks.
These nodes provide the base for serial communication controllers like
I2C, SPI and UART.

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
 arch/arm64/boot/dts/exynos/exynos990.dtsi | 247 ++++++++++++++++++++++++++++++
 1 file changed, 247 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos990.dtsi b/arch/arm64/boot/dts/exynos/exynos990.dtsi
index f8e2a31b4b7519b83aa31deefbc40e5edbb8186a..1e09f3efe685748789ffd346cd914f9a8ba68f8b 100644
--- a/arch/arm64/boot/dts/exynos/exynos990.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos990.dtsi
@@ -272,6 +272,123 @@ pinctrl_peric0: pinctrl@10430000 {
 			interrupts = <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usi0: usi@105500c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_5>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1004>;
+			status = "disabled";
+		};
+
+		usi1: usi@105700c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105700c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_7>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x100c>;
+			status = "disabled";
+		};
+
+		usi2: usi@105900c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105900c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_9>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_9>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1014>;
+			status = "disabled";
+		};
+
+		usi3: usi@105b00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105b00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_11>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_11>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x101c>;
+			status = "disabled";
+		};
+
+		usi4: usi@105d00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105d00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_13>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_13>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1024>;
+			status = "disabled";
+		};
+
+		usi5: usi@105f00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x105f00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_PCLK_15>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP0_IPCLK_15>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x102c>;
+			status = "disabled";
+		};
+
+		usi13: usi@106300c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106300c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_3>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_3>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x103c>;
+			status = "disabled";
+		};
+
+		usi14: usi@106500c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106500c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_5>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_5>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x1044>;
+			status = "disabled";
+		};
+
+		usi15: usi@106700c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x106700c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_PCLK_7>,
+				 <&cmu_peric0 CLK_GOUT_PERIC0_TOP1_IPCLK_7>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric0 0x104c>;
+			status = "disabled";
+		};
+
 		cmu_peric1: clock-controller@10700000 {
 			compatible = "samsung,exynos990-cmu-peric1";
 			reg = <0x10700000 0x8000>;
@@ -295,6 +412,136 @@ pinctrl_peric1: pinctrl@10730000 {
 			interrupts = <GIC_SPI 417 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		usi6: usi@108a00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108a00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_10>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_10>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1018>;
+			status = "disabled";
+		};
+
+		usi7: usi@108c00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108c00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_12>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_12>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1020>;
+			status = "disabled";
+		};
+
+		usi8: usi@108e00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x108e00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_PCLK_14>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP0_IPCLK_14>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1028>;
+			status = "disabled";
+		};
+
+		usi9: usi@109000c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109000c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_0>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_0>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1030>;
+			status = "disabled";
+		};
+
+		usi10: usi@109200c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109200c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_2>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_2>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1038>;
+			status = "disabled";
+		};
+
+		usi11: usi@109400c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109400c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_4>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_4>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1040>;
+			status = "disabled";
+		};
+
+		usi12: usi@109c00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109c00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_12>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_12>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x2000>;
+			status = "disabled";
+		};
+
+		usi16: usi@109600c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109600c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_6>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_6>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1048>;
+			status = "disabled";
+		};
+
+		usi17: usi@109900c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109900c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_9>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_9>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x1050>;
+			status = "disabled";
+		};
+
+		usi18: usi@109e00c0 {
+			compatible = "samsung,exynos990-usi", "samsung,exynos850-usi";
+			reg = <0x109e00c0 0x20>;
+			ranges;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			clocks = <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_PCLK_14>,
+				 <&cmu_peric1 CLK_GOUT_PERIC1_TOP1_IPCLK_14>;
+			clock-names = "pclk", "ipclk";
+			samsung,sysreg = <&sysreg_peric1 0x2008>;
+			status = "disabled";
+		};
+
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos990-cmu-hsi0";
 			reg = <0x10a00000 0x8000>;

-- 
2.50.1

