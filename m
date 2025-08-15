Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106252D1913;
	Fri, 15 Aug 2025 07:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241523; cv=none; b=gm2dtfGdWd0I8oH7Ur46dIFR4GmLQX+jhcVXEDW2/cMUY2r/0q8iN5nQZ71JnjIBAe1mN8u02Tw0KMX/K9S/qcIG/hkVjdi4NNo1My+dUS2Pr8VOwkTBQlqtTi0BzX8RnfBFWT0+Vm+TJGWnuTxFzdQCpai2i6Dx6dt2psJVNn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241523; c=relaxed/simple;
	bh=KFldk5gBYr0jPJAMa2NrdCs2OJ64JIykOPZpaZCB2R8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uE1pMoxXaIAaDaj4YSLrgcp/XhVYMxTA8BW4dcNEdFl99hHZwB2IJ31LbtGrFtmpbfiHGS4sU3teTF/ZzrZwgZm8DcJKzXpk/Uur+tLlvcr8YiHM60Osnv0bMSZ2L2ykV4kNV/TSqBcMxwVyw1bdExOWch9grMBNM66Ro/wFIr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E3gQnh3f; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E3gQnh3f"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb732eee6so301996866b.0;
        Fri, 15 Aug 2025 00:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755241517; x=1755846317; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y85zsZDQKxK8sD7ttJKCoLuHRw4j4DeYk5X8DxnnGnM=;
        b=E3gQnh3fSpbJVauDnLokhQMxvEkFGbahhOpEZMGrqSz4zNe7ynynzU44YBS8eoEjfl
         WFU6BvJbn6lAq2OlmodVEd+h97J+xmpy83UWZ6kTmVhD6HootRuX4Nt8sVCE4MksGujc
         6fAFBiRJd+IUCJnFum8di6X8ltoyRlXKl3l/Ng0auV59+J/dINKRb/3bPv73z6qT61rL
         Z5SzNDdQyU6ZDnCAqRlFGOYle617frC+JU6eUlhSE/KoI1uoU9BLiuJNClcaGjjljq4/
         nu/tUiu79U2Gn5DCdLMQPKrGblv0lzcABAkxAjc5hdk8t/1xEC/aLvJS+2HwDqGZNauO
         pv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755241517; x=1755846317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y85zsZDQKxK8sD7ttJKCoLuHRw4j4DeYk5X8DxnnGnM=;
        b=PkC8u8po3iQjuK/CmydNF0fM4yffEzizCxJJug8EO2s07fze5mdOp6Gup2pFeQadx1
         OSGtPK6XyHMGwS1+aJyQTK0MPfmZIH6C9cowO3rZ2zN5xEKsxYZom4EOo/KL2RrdzSzI
         PirJor6a7/w4HK4zbFOm0qXhhyVbyOIwL+Gd1DERHfnDu5oOFl2rPLVYtAmlG2OEDRzK
         0BdXeWIAi4AM0TssXFiilppvDH0JdjFYVycNb2GrPZ2/iIxFj70mNxJmOC7UwLlJ0GH1
         +63kJYKlnKBW4cvLxESL5DQkkhwzo5lf2Jcrktp5OHU1plUY4xYRW889PBISjUqCjdje
         c3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWKLLvjXyNnm9+e9hO1TP2LKEjLfunvwDiES36JN4VopYZsgOcHFDXjkt5Oz9Mrr57Q2zvRxg085KXHmBEy@vger.kernel.org, AJvYcCX/0gIcrP5yXUBmV4eIkSsQx9Ch1wNCMamHF/z1OgQs9cYQ6t4D481zFfGs402ydoAB4ovlURuLabPM@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ138yWndmc2D8LaErK7l41P/LezKp5gmGsTsJ48W1rqsK5bm/
	OXO1C4abwqdWH7twu3MmwiydIFks8lz80DH6E3zxPScyqQlTuhQFVSNe
X-Gm-Gg: ASbGncuJPykPsB/e+23AX711IPQXI+v2uPXG451/RAxKIStECTJRAmMHuRcJr+E7MNU
	yvSzT7nQ1k4OW2OcqnBQxqcWemXdbR368eBP/JW2R+M1pDiAtywdl2UnFQy/jjmu+biCvLGuzL2
	synBeHCeEGeOo10vsGNjFFF0/DPeswcXi6Np/Ir6gjYgMs4YW3Fiwy7hIDWUMb7UY2507kwXG/W
	+HYixW6qAn+/9JdZiA+Ub/x37+vkZUuEu6QVh+Tl0PgOmxFp+AA7at5eEDzhvAtao5AhqIBdnD7
	Ur8w16o5LUATu0B45oi+aukH8rPg5kioEbdopx6/Dhe9Wyg5IWtmr9HyQKht2UVneUEjjZQ54I9
	iA0vh5fZ/5Jqku1uPh2/PTfefdcEMCcEe53+R0jhmcMg8pFuPQPkxJXNGUSvVAqaA3ZMqtzX8Iw
	==
X-Google-Smtp-Source: AGHT+IFh//es/9+sWoVhDlPCizn4RkmKiZ2SJp3F9fhVcL4Iza4SCu0VZsuSos1QjjpgbKmXip+6xg==
X-Received: by 2002:a17:907:3e1a:b0:ad4:f517:ca3 with SMTP id a640c23a62f3a-afcdc1a3d54mr98349466b.20.1755241516911;
        Fri, 15 Aug 2025 00:05:16 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcb2ddsm74269266b.74.2025.08.15.00.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:05:16 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] arm64: dts: exynos2200: use 32-bit address space for /soc
Date: Fri, 15 Aug 2025 10:04:58 +0300
Message-ID: <20250815070500.3275491-3-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
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
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

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

