Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B0455E63
	for <linux-samsung-soc@vger.kernel.org>; Tue, 30 Jan 2024 20:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706647273; cv=none; b=lF5MzbQTeJH4tPUUohdVu3rt4kUlCIx/IA51kz9QC1BrfyHU7dmZw+ZLx/lPMxpTgp1zKRk6EPo/d5ww4rmVCSS53JVfz62BH4X2KFaVWdzemiz3TefEKnAJm5zPtWb9HULm2uGi9NmP/HUoO/ObQ8nx+F+q849mrGKs/EivKro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706647273; c=relaxed/simple;
	bh=mfgmfT6Y+yAecXwInwSg+9gDbzv0JiMuG/TNlfkMWgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wgv71rWyry2y0XNEXgRHdJepY/MLTeV68qYHncVrSbG2Av6I8zcl3sDw/NKvz/Hf7zbb+XbQ1LpH2i6tsqAQV41l6Robe5X3EFHw1Exip/V/HTG+gsVsJ934FE5yVTYTsy725+P0SjUfHIqH8tvf4VXF+4XtMtXkl1SwkcaN294=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=eUEbIOXw; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="eUEbIOXw"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1706647269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vTXS7Usw65Bg+jTRdlumhmylOFlcOQdVX0MiGUHQrRc=;
	b=eUEbIOXwpx3bESd6400bj0CueBq4EkqNUIn4+CAQHxnzj+pCWdJVzdiO+6JBEVu67DP7vj
	xi9ruFYxfbxFzNnvSzxwH9m+HzCQJupNGCP9GWgFh7kNnpm7A4etJFtwagDkeK4GC3zSKT
	l2Vhl4QCY0Ar3Evemit3F6m40LH47d4=
From: Henrik Grimler <henrik@grimler.se>
Date: Tue, 30 Jan 2024 21:40:40 +0100
Subject: [PATCH 2/3] ARM: dts: samsung: exynos5420-galaxy-tab-common: add
 wifi node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240130-galaxy-tab-s-cleanup-v1-2-d4e17857241d@grimler.se>
References: <20240130-galaxy-tab-s-cleanup-v1-0-d4e17857241d@grimler.se>
In-Reply-To: <20240130-galaxy-tab-s-cleanup-v1-0-d4e17857241d@grimler.se>
To: Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht
X-Developer-Signature: v=1; a=openpgp-sha256; l=1940; i=henrik@grimler.se;
 h=from:subject:message-id; bh=mfgmfT6Y+yAecXwInwSg+9gDbzv0JiMuG/TNlfkMWgk=;
 b=owEBbQGS/pANAwAKAbAHbkkLcWFrAcsmYgBluV7dB/oNjb2olhfimF3Ut6aoVaol0f9xBck7k
 +6PMKr9OpOJATMEAAEKAB0WIQQsfymul4kfZBmp4s2wB25JC3FhawUCZble3QAKCRCwB25JC3Fh
 a2vfCACruJQ/v12UuxMu3lSskVEmOzjYZP76TamvPfeO/Wrs8cS0DxTkx2RNSlN+IAs0XrsBlD+
 MQ1/pzf8sK5UDUG+Uw47o9h4e5KfV8hkGXw7ZeYocEC2aOzKnHDqvFWlGyGPvLw/2K2MFk0CCZG
 XgqxhYk44tl/hW3Xq8vANBXEmpvZdieC7aLBkMeW/pAOrcNKfuqVwAur/HmNA/16G7jrNVRuB7y
 +4h8VIvtJTPnwGxOy4aa2TEUMpEyV4MMxim9O7ds3M539q5AKcSbPk/3lmSL1UyQN4nXDeo0gY1
 U/EpOD65xG7vtSe/MlFGZ79Y78Be9Nb5swo9hlv86CfTdAbm
X-Developer-Key: i=henrik@grimler.se; a=openpgp;
 fpr=2C7F29AE97891F6419A9E2CDB0076E490B71616B
X-Migadu-Flow: FLOW_OUT

By using brcm/brcmfmac4354-sdio.bin from linux-firmware together with
nvram.txt from vendor firmware wifi works well on the chagall-wifi and
klimt-lte.

Signed-off-by: Henrik Grimler <henrik@grimler.se>
---
 .../dts/samsung/exynos5420-galaxy-tab-common.dtsi  | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm/boot/dts/samsung/exynos5420-galaxy-tab-common.dtsi b/arch/arm/boot/dts/samsung/exynos5420-galaxy-tab-common.dtsi
index 0c1aeafc025b..d569fac29b18 100644
--- a/arch/arm/boot/dts/samsung/exynos5420-galaxy-tab-common.dtsi
+++ b/arch/arm/boot/dts/samsung/exynos5420-galaxy-tab-common.dtsi
@@ -30,6 +30,7 @@ / {
 
 	aliases {
 		mmc0 = &mmc_0;
+		mmc1 = &mmc_1;
 		mmc2 = &mmc_2;
 	};
 
@@ -87,6 +88,13 @@ key-volume-down {
 			linux,code = <KEY_VOLUMEDOWN>;
 		};
 	};
+
+	mmc1_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpy7 7 GPIO_ACTIVE_LOW>;
+		clocks = <&s2mps11_osc S2MPS11_CLK_BT>;
+		clock-names = "ext_clock";
+	};
 };
 
 &cci {
@@ -619,6 +627,25 @@ &mmc_0 {
 	status = "okay";
 };
 
+/* WiFi */
+&mmc_1 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	card-detect-delay = <200>;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&mmc1_pwrseq>;
+	non-removable;
+	pinctrl-0 = <&sd1_clk>, <&sd1_cmd>, <&sd1_int>, <&sd1_bus1>,
+		    <&sd1_bus4>, <&wifi_en>;
+	pinctrl-names = "default";
+	vqmmc-supply = <&ldo2_reg>;
+	samsung,dw-mshc-ciu-div = <1>;
+	samsung,dw-mshc-ddr-timing = <0 2>;
+	samsung,dw-mshc-sdr-timing = <0 1>;
+	status = "okay";
+};
+
 /* External sdcard */
 &mmc_2 {
 	bus-width = <4>;
@@ -648,6 +675,11 @@ s2mps11_irq: s2mps11-irq-pins {
 		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
 		samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
 	};
+
+	wifi_en: wifi-en-pins {
+		samsung,pins = "gpy7-7";
+		samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
+	};
 };
 
 &rtc {

-- 
2.30.2

