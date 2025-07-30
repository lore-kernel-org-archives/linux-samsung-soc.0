Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F187B290D81;
	Wed, 30 Jul 2025 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753861382; cv=none; b=GngHG5kGARzA321kFlXKmsrfBEm4AMm8+1kyKX+dPkuP2gGsSCwBMaMOhiGuWUyg7pT3DgVATtCt2YXRJvo4gx6mtL1eytsdUX1uQwfMbkCKXO/vdn73w9gzZQ6qoioWeNwBuBsVeprkeRqZ+LJNhpnSkRlOR55qEKJKsyHZYJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753861382; c=relaxed/simple;
	bh=O2pOeoVNeNdh4HRXZlK8yXIwnjFusw+7V/Sbd5h3ZWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HVg9w0tbtY+OvqiYxuqsJfayM3/CcbD5sbiED+cv3XpxbOliHERMLYuj/uPjLkryUw9wo4eWxjl780Beu8bvYgT5WzZTCNMhBM9LTFo8HM+AVlRbEvJ+MBHHYc5Af9Kps4xXP1otBZb9vo5k8AAaIt5GoSVxNRr/iTjIN3e0ybQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njA8b+uW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njA8b+uW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3b786421e36so337967f8f.3;
        Wed, 30 Jul 2025 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753861379; x=1754466179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0hLEz604jvcXEN/T2mEEGr6WT4Oxp/78DXXL0VyUnc=;
        b=njA8b+uWvAObn3gM2D++ftCxv+XG2dnFtGoknDtjp+kptT2JS6KS25ukUvjkW8Iah2
         ZJUmmuunut866GUn/8c2SZ55O4ExYXcmCE/aq7mojMGrfHNgz49HJjq7NfNZ6xJ+aYdq
         oKV1/FjodqRSTXXHQpOWZZTs+v+/f0NsFf4V0p5U5Agl3NKNHNrgdmFV//GY2p3T2FJP
         Ane5KQZHg22vPXboaF/6NEuAgKyMhJ0RRdd+nvNXmjI5LeNGIEYnre+RLf0dSwSUqbAO
         4TPFAQF/V8g3g7PPViMvbTvz+jZGSVy/vJPY7k2kEkjfXu2lIWpxV5WhhAK4oojpNqmt
         wUig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753861379; x=1754466179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0hLEz604jvcXEN/T2mEEGr6WT4Oxp/78DXXL0VyUnc=;
        b=IIQQIWy1g6oztTyl+pIZOzDG9ujGBG1uJ4RXhYKIc+FgYbSP42JFOe4UNUtiffvpxl
         luolTTa4Itq8dQYXq+K4iahh2gr9v8Rldv9ZOnPAUKyXkkmNZwlc+yUA1Q1d73zX4qP4
         GL2P+gw+HZVmxjHifgKcwu2nx7ww3AopyGkEjfQm/zz9jQrghboUauVAHiz222xQT9nH
         s7oB9ZSAkPNrjrhhEINomzkcit8QBZwKs/LpgKryRiTvDWC03pHkhD7k0BC3C/pMzh0n
         wpdmAu/OdWHenT+NJw3dVn0j06mLnKk6ifSQS//ZS5MEXQdqDBql3Tt89yixNPsOjJmv
         3xJA==
X-Forwarded-Encrypted: i=1; AJvYcCXeCnap+vbTpZ8pmfbD88b6Lg2jIrSHbFAejvg3gc9G11B9ukkZvYe3UgEe1r/7hKYS3JKfUA/mDRITaxp1@vger.kernel.org, AJvYcCXr1yVvpRdQGYRPcA7y4xYRasZjOEMvCcme9CWPa+17ixKG1+JD/ORMSgvOETM1n+VTbnb7CuE1tYkM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ZKmiS3yz6JRez7ruVG8Fa096KGc5J9raTrEZWfuZNsUuVhBp
	E3zJO/xfUVcnZ4e7Yc/zA+ZDxi7/eD7UOf7+AlGNNy2z3YpkSY75UWYBwdXmVw==
X-Gm-Gg: ASbGnctM/7Pte/5VtjjKft9MAx8CzHEIh092y+X5ebkK82uU4CTbKO+YkJCNGukqFmi
	cVTlNhJZe6f5YUG/crrbatRLI8WSBieabwM9980yW5vhfU8Ap/zFV6zzbRkO3b+g8FN2VNuCNfs
	pRcrkdyVrchYTrICvl6wOf1f3L/KqiGJb364ycdQHm33ixlUz6LrZ1/lynTwQEmF+Gdqvm08vEH
	AW7/L94yjKgtP7yQDnHjyidYUvBZQhshmcgmLHEDFVmVAZGuOc1j8YAI7uvphZnYWJJ+75uh58K
	jkz8w2JLQK+SdSHqm/m1CE5EyQ/yBC+VBjGTkDalCqqLeVxrJqeUjLcZG6UNWDkQF5U0DTy9HK8
	I5LJ7jSdH6X9jq8aKg/+GA1dYMkCemm2jqVQ1ZoU7blPEN1ZbGqX6SwDo2tWn78GQcGTcOp1MNQ
	==
X-Google-Smtp-Source: AGHT+IGhFmO4oF6kD0Ko40MEOLP56KuDL+105SXE8A6OwScEL3wiW4/hCwb6fHK70dZK1plOzP/mqg==
X-Received: by 2002:a05:6000:2008:b0:3b7:8fcc:a1e3 with SMTP id ffacd0b85a97d-3b795032797mr1716620f8f.48.1753861379038;
        Wed, 30 Jul 2025 00:42:59 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458953eaed4sm14783835e9.27.2025.07.30.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 00:42:58 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: dts: exynos2200: use 32-bit address space for /soc
Date: Wed, 30 Jul 2025 10:42:50 +0300
Message-ID: <20250730074253.1884111-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250730074253.1884111-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All peripherals on this SoC are mapped under the 32-bit address space
(0x0 -> 0x20000000), so enforce that.

Suggested-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>

---
This was suggested at [1].

[1] https://lore.kernel.org/all/CAPLW+4kPN65uX0tyG_F-4u5FQpPnwX9y6F1zrobq5UyVbks+-w@mail.gmail.com
---
 arch/arm64/boot/dts/exynos/exynos2200.dtsi | 72 +++++++++++-----------
 1 file changed, 36 insertions(+), 36 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200.dtsi b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
index 6b5ac02d0..943e83851 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200.dtsi
@@ -221,22 +221,22 @@ psci {
 		method = "smc";
 	};
 
-	soc {
+	soc@0 {
 		compatible = "simple-bus";
-		ranges;
+		ranges = <0x0 0x0 0x0 0x20000000>;
 
-		#address-cells = <2>;
-		#size-cells = <2>;
+		#address-cells = <1>;
+		#size-cells = <1>;
 
 		chipid@10000000 {
 			compatible = "samsung,exynos2200-chipid",
 				     "samsung,exynos850-chipid";
-			reg = <0x0 0x10000000 0x0 0x24>;
+			reg = <0x10000000 0x24>;
 		};
 
 		cmu_peris: clock-controller@10020000 {
 			compatible = "samsung,exynos2200-cmu-peris";
-			reg = <0x0 0x10020000 0x0 0x8000>;
+			reg = <0x10020000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&cmu_top CLK_DOUT_TCXO_DIV3>,
@@ -250,7 +250,7 @@ cmu_peris: clock-controller@10020000 {
 		mct_peris: timer@10040000 {
 			compatible = "samsung,exynos2200-mct-peris",
 				     "samsung,exynos4210-mct";
-			reg = <0x0 0x10040000 0x0 0x800>;
+			reg = <0x10040000 0x800>;
 			clocks = <&cmu_top CLK_DOUT_TCXO_DIV3>, <&cmu_peris CLK_MOUT_PERIS_GIC>;
 			clock-names = "fin_pll", "mct";
 			interrupts = <GIC_SPI 943 IRQ_TYPE_LEVEL_HIGH 0>,
@@ -270,8 +270,8 @@ mct_peris: timer@10040000 {
 
 		gic: interrupt-controller@10200000 {
 			compatible = "arm,gic-v3";
-			reg = <0x0 0x10200000 0x0 0x10000>,     /* GICD */
-			      <0x0 0x10240000 0x0 0x200000>;    /* GICR * 8 */
+			reg = <0x10200000 0x10000>,     /* GICD */
+			      <0x10240000 0x200000>;    /* GICR * 8 */
 
 			#interrupt-cells = <4>;
 			interrupt-controller;
@@ -294,7 +294,7 @@ ppi_cluster2: interrupt-partition-2 {
 
 		cmu_peric0: clock-controller@10400000 {
 			compatible = "samsung,exynos2200-cmu-peric0";
-			reg = <0x0 0x10400000 0x0 0x8000>;
+			reg = <0x10400000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -306,17 +306,17 @@ cmu_peric0: clock-controller@10400000 {
 
 		syscon_peric0: syscon@10420000 {
 			compatible = "samsung,exynos2200-peric0-sysreg", "syscon";
-			reg = <0x0 0x10420000 0x0 0x2000>;
+			reg = <0x10420000 0x2000>;
 		};
 
 		pinctrl_peric0: pinctrl@10430000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x10430000 0x0 0x1000>;
+			reg = <0x10430000 0x1000>;
 		};
 
 		cmu_peric1: clock-controller@10700000 {
 			compatible = "samsung,exynos2200-cmu-peric1";
-			reg = <0x0 0x10700000 0x0 0x8000>;
+			reg = <0x10700000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -328,23 +328,23 @@ cmu_peric1: clock-controller@10700000 {
 
 		syscon_peric1: syscon@10720000 {
 			compatible = "samsung,exynos2200-peric1-sysreg", "syscon";
-			reg = <0x0 0x10720000 0x0 0x2000>;
+			reg = <0x10720000 0x2000>;
 		};
 
 		pinctrl_peric1: pinctrl@10730000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x10730000 0x0 0x1000>;
+			reg = <0x10730000 0x1000>;
 		};
 
 		cmu_hsi0: clock-controller@10a00000 {
 			compatible = "samsung,exynos2200-cmu-hsi0";
-			reg = <0x0 0x10a00000 0x0 0x8000>;
+			reg = <0x10a00000 0x8000>;
 			#clock-cells = <1>;
 		};
 
 		usb32drd: phy@10aa0000 {
 			compatible = "samsung,exynos2200-usb32drd-phy";
-			reg = <0x0 0x10aa0000 0x0 0x10000>;
+			reg = <0x10aa0000 0x10000>;
 
 			clocks = <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
 			clock-names = "phy";
@@ -360,7 +360,7 @@ usb32drd: phy@10aa0000 {
 
 		usb_hsphy: phy@10ab0000 {
 			compatible = "samsung,exynos2200-eusb2-phy";
-			reg = <0x0 0x10ab0000 0x0 0x10000>;
+			reg = <0x10ab0000 0x10000>;
 
 			clocks = <&cmu_hsi0 CLK_MOUT_HSI0_USB32DRD>,
 				 <&cmu_hsi0 CLK_MOUT_HSI0_NOC>,
@@ -374,7 +374,7 @@ usb_hsphy: phy@10ab0000 {
 
 		usb: usb@10b00000 {
 			compatible = "samsung,exynos2200-dwusb3";
-			ranges = <0x0 0x0 0x10b00000 0x10000>;
+			ranges = <0x0 0x10b00000 0x10000>;
 
 			clocks = <&cmu_hsi0 CLK_MOUT_HSI0_NOC>;
 			clock-names = "link_aclk";
@@ -406,7 +406,7 @@ usb_dwc3: usb@0 {
 
 		cmu_ufs: clock-controller@11000000 {
 			compatible = "samsung,exynos2200-cmu-ufs";
-			reg = <0x0 0x11000000 0x0 0x8000>;
+			reg = <0x11000000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -418,27 +418,27 @@ cmu_ufs: clock-controller@11000000 {
 
 		syscon_ufs: syscon@11020000 {
 			compatible = "samsung,exynos2200-ufs-sysreg", "syscon";
-			reg = <0x0 0x11020000 0x0 0x2000>;
+			reg = <0x11020000 0x2000>;
 		};
 
 		pinctrl_ufs: pinctrl@11040000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x11040000 0x0 0x1000>;
+			reg = <0x11040000 0x1000>;
 		};
 
 		pinctrl_hsi1ufs: pinctrl@11060000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x11060000 0x0 0x1000>;
+			reg = <0x11060000 0x1000>;
 		};
 
 		pinctrl_hsi1: pinctrl@11240000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x11240000 0x0 0x1000>;
+			reg = <0x11240000 0x1000>;
 		};
 
 		cmu_peric2: clock-controller@11c00000 {
 			compatible = "samsung,exynos2200-cmu-peric2";
-			reg = <0x0 0x11c00000 0x0 0x8000>;
+			reg = <0x11c00000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -450,17 +450,17 @@ cmu_peric2: clock-controller@11c00000 {
 
 		syscon_peric2: syscon@11c20000 {
 			compatible = "samsung,exynos2200-peric2-sysreg", "syscon";
-			reg = <0x0 0x11c20000 0x0 0x4000>;
+			reg = <0x11c20000 0x4000>;
 		};
 
 		pinctrl_peric2: pinctrl@11c30000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x11c30000 0x0 0x1000>;
+			reg = <0x11c30000 0x1000>;
 		};
 
 		cmu_cmgp: clock-controller@14e00000 {
 			compatible = "samsung,exynos2200-cmu-cmgp";
-			reg = <0x0 0x14e00000 0x0 0x8000>;
+			reg = <0x14e00000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -471,12 +471,12 @@ cmu_cmgp: clock-controller@14e00000 {
 
 		syscon_cmgp: syscon@14e20000 {
 			compatible = "samsung,exynos2200-cmgp-sysreg", "syscon";
-			reg = <0x0 0x14e20000 0x0 0x2000>;
+			reg = <0x14e20000 0x2000>;
 		};
 
 		pinctrl_cmgp: pinctrl@14e30000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x14e30000 0x0 0x1000>;
+			reg = <0x14e30000 0x1000>;
 
 			wakeup-interrupt-controller {
 				compatible = "samsung,exynos2200-wakeup-eint",
@@ -487,7 +487,7 @@ wakeup-interrupt-controller {
 
 		cmu_vts: clock-controller@15300000 {
 			compatible = "samsung,exynos2200-cmu-vts";
-			reg = <0x0 0x15300000 0x0 0x8000>;
+			reg = <0x15300000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -497,12 +497,12 @@ cmu_vts: clock-controller@15300000 {
 
 		pinctrl_vts: pinctrl@15320000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x15320000 0x0 0x1000>;
+			reg = <0x15320000 0x1000>;
 		};
 
 		cmu_alive: clock-controller@15800000 {
 			compatible = "samsung,exynos2200-cmu-alive";
-			reg = <0x0 0x15800000 0x0 0x8000>;
+			reg = <0x15800000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>,
@@ -512,7 +512,7 @@ cmu_alive: clock-controller@15800000 {
 
 		pinctrl_alive: pinctrl@15850000 {
 			compatible = "samsung,exynos2200-pinctrl";
-			reg = <0x0 0x15850000 0x0 0x1000>;
+			reg = <0x15850000 0x1000>;
 
 			wakeup-interrupt-controller {
 				compatible = "samsung,exynos2200-wakeup-eint",
@@ -524,7 +524,7 @@ wakeup-interrupt-controller {
 		pmu_system_controller: system-controller@15860000 {
 			compatible = "samsung,exynos2200-pmu",
 				     "samsung,exynos7-pmu", "syscon";
-			reg = <0x0 0x15860000 0x0 0x10000>;
+			reg = <0x15860000 0x10000>;
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
@@ -536,7 +536,7 @@ reboot: syscon-reboot {
 
 		cmu_top: clock-controller@1a320000 {
 			compatible = "samsung,exynos2200-cmu-top";
-			reg = <0x0 0x1a320000 0x0 0x8000>;
+			reg = <0x1a320000 0x8000>;
 			#clock-cells = <1>;
 
 			clocks = <&xtcxo>;
-- 
2.43.0

