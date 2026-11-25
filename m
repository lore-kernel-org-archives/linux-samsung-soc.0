Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618569;
	b=nYU7e8WVSZP+YH8QhpeiNZuiUrBgL+ke163QQh38YBTVX9b1Pt1l6Fp5l43fL3GGDrzy
	 U1ZGFKucgfaM8ypK0cvh2V80J4vXARXy3leCudK5hd55+5jDfmmMzfJGjmdeRhYqPpKOm
	 iQ/5EDMJJIJySUHgNZIR4wI6KxXlOrQUa/b9FyIflNmDZjkPozJGntyDOHsz/b8HjoNZp
	 QuYEHmN9rF4+z6lLipfH3WGORovWp4FiUVNBZXbKb1oRdIFkrSWV1Y1+ISPFuslSGnqmQ
	 Kh4S39+svqCXpbkkIwgcZvB5nXF0Onx9/R+PskW0hs2uQslhRXDCaVFoBn2pEdVGOAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
	b=Y4OYlA4b2nXYT97VKTzrj3eWgTpb57Xo8aO4k8cCw+HVIPhoUaJXSwurSwYXauKGHT7X
	 OSPQGemxHe9xrePDUW3j9QaimVg8zALjjpqGBtnfDSLgjv31DoMMnKcG1OFLZcf1Uh3hG
	 apsyR3CYfoKuy62D9S4E9gE82bq2nVnes9oV9ViCgFdqTBfNNbpGVmclLNsNUcoO3+465
	 +g4ppOn2hleQT3QVRyLNWa+aQdopfYRYmGlACxTZ2y8/F6e6xklh3JNnMUgtqCbxAvWor
	 JOWzCX56hKmo6T2yHBOZ8pgsbAfZPJ6J8lssUOrOdjAVx9lsZxzq0qRODOC7jbMvyFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjFADt3+;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43945606A68D
	for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 14:56:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43945606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xjFADt3+
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3688741f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 25 Nov 2026 06:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795618568; x=1796223368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
        b=xjFADt3+MZA2KAQVc+YScEASOKrlOLrSBp0zUy8vuyKuf7rHS0OBVN5x1ja7r2KE8L
         oK7q7BukxXff4eRiBiRFdINHTsc/EPIAaNEsiQ5JPfFO+6gc4SQ2MV+7Fk+u9v3tXWRD
         LVZ5SGzD32dLFKwVhvCqlz2L/2jNGdfuFiq6fNMvBjFSe3t+RCAA97mROvuuJbrR1X0H
         CKMUsRIJELkPRFpF6CmuOrIHN0Fu5bGrvGmnMal4RASOSec/QNer8NerHn++JT914EGE
         4EU/jA41+UBxoqvBgw6nu6Q34FwnWiXjnF8htNjxKjUuyVEu64LPUpDDBFKZ7yMV/xfj
         KDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795618568; x=1796223368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L2nTfBlCrLMu8yQMZld6sCbquIzEwn5biDFg2eMNzH8=;
        b=mkuIUHS0mi1hsSZo2/YLT/A74U5R/ExVwDxO3No7eTili39b3nLkna8jKVbFdNdzdh
         OnZNuym0PMGT/TnJrSFA7jhlkIJtIr/wgX75sbz2CgbSzOuRbOEGGwYNGiD890yd5cG2
         /4YqGMsE2DXZebRctm4pLvq6F8DXVq3kx8+TrTx8DgHY7x9gpyUGekZrvUa1x8SdgDUB
         EEElK/VLLWcDN1wjw2FqVsUTZCCzbgFzvy+AyH4nfwyLpERGz+jfcsZLzvfcwK6JVc9L
         loBYwBhhwOxHypQlCqODxou94YpTBucSLdwystEZcXJOThuKLub0WZN8yyI/qBrOSnAF
         Yryg==
X-Forwarded-Encrypted: i=1; AL+hErEvi6ozNb0N0n57XmjixhKC60DT6ycz3fMYY/ilvoexUubrK9KLGuq55SZVakQxealQhc1r4sSqOikG5xVCaobQiw==@vger.kernel.org
X-Gm-Message-State: APuU4Z8cYlv/huUkit9xKbVI4zXbGxiE05kdrM4Shlum0nparTYtYfQi
	+n+65RCiqav+1EXsTuI/4lkwwsaYAySDfaFVKWHoqLPdbF/3T8vkbS92
X-Gm-Gg: AZFdTZco8/iQ/DLA1OdOO/cCzv/OXLK/ZF5NcZB0aWzQfGCWAbNbuJXXuSUyAp1gSqC
	lbhWJTgp7k/iE2inymECEJ1snZjIYBy3xvd45cFMcMqaIrnKP3me3VrEhdSYKQd3wtaz9VE06I3
	MyQD3/1hjODuSQ+n96MUW/ZjUSXy+BgVcZ8GhL5zHFo/KHOVGcbBigN5dcgZDp8DLZA0YgVOP7Z
	ied28a5djCME9HZQLVkrefo37DpmSSWDwPLQPCY2texJaz8p0e4sHkprp3/V2GlVBmZzN/QHewM
	2h/tliLO9iWLJVQXPKJ4dP02L7D6OgeMtMT/E0TheSslhZYnxTUniGGKsVTxB9GmsAL8XT4K9U7
	vLaIOqB15pJ8vQ5K9/5x/5kh4UrdV214KOmKQF7t/LRueXaTx6D5S3GWKG52Pifmd6jOEsWpMfb
	jDIq74iqzixFKIblFORsJNSmXykF+l8DD7rJoU072eOaY36M6cdodFmXJajUBjzt1P9itr23uTv
	/8gVa9FYiuKDIn2sLL5iTJqbLq7C2cj+B5fWyKD3huY0y9TSD+SkMMyH6bEGd6SNf463iV9MnMm
	8EXrUC1qaqxcHIm7XyKiTfcSWlKT9vhZrvxr44swRweyadRb8fL82HgltajuvAqbdLLmi9J/aCH
	1GRwasEumwFvErVArQqJCsiIn9jA5toS1yA==
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr23328733f8f.38.1795618567632;
        Wed, 25 Nov 2026 06:56:07 -0800 (PST)
Received: from DavidArch.internal (catv-78-139-0-46.catv.fixed.one.hu. [78.139.0.46])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm36036139f8f.31.2026.11.25.06.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:56:07 -0800 (PST)
From: David Virag <virag.david003@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	David Virag <virag.david003@gmail.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/5] arm64: dts: exynos: Enable USB in Exynos7885
Date: Wed, 25 Nov 2026 15:54:55 +0100
Message-ID: <20261125145458.2594179-5-virag.david003@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125145458.2594179-1-virag.david003@gmail.com>
References: <20261125145458.2594179-1-virag.david003@gmail.com>
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Post: <mailto:linux-samsung-soc@vger.kernel.org>
List-Help: <mailto:linux-samsung-soc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-samsung-soc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add USB controller and USB PHY controller nodes to Exynos7885 SoC DTSI

The SoC theoretically supports USB3 SuperSpeed, but is not implemented
in any known device. The vendor kernel also stubs out USB3 functions, so
we disable it in device DTS.

It is though, perfectly capable of USB 2.0 high-speed mode, both as host
and device.

Signed-off-by: David Virag <virag.david003@gmail.com>
---
Changes in v2:
 - Keep dt nodes ordered by unit address.

Changes in v3:
 - Move maximum-speed property to device dts.

 arch/arm64/boot/dts/exynos/exynos7885.dtsi | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7885.dtsi b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
index 6b994b487107..33899f5fc5e5 100644
--- a/arch/arm64/boot/dts/exynos/exynos7885.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7885.dtsi
@@ -480,6 +480,37 @@ i2c_7: i2c@11cd0000 {
 
 			status = "disabled";
 		};
+
+		usbdrd_phy: phy@135d0000 {
+			compatible = "samsung,exynos7885-usbdrd-phy";
+			reg = <0x135d0000 0x100>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_ACLK_20PHYCTRL>,
+				 <&cmu_fsys CLK_FSYS_USB20PHY_CLKCORE>;
+			clock-names = "phy", "ref";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+			status = "disabled";
+		};
+
+		usbdrd: usb@13600000 {
+			compatible = "samsung,exynos7885-dwusb3",
+				     "samsung,exynos850-dwusb3";
+			ranges = <0x0 0x13600000 0x10000>;
+			clocks = <&cmu_fsys CLK_FSYS_USB30DRD_BUS_CLK_EARLY>,
+				 <&cmu_fsys CLK_FSYS_USB30DRD_REF_CLK>;
+			clock-names = "bus_early", "ref";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			status = "disabled";
+
+			usbdrd_dwc3: usb@0 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x10000>;
+				interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>;
+				phy-names = "usb2-phy";
+			};
+		};
 	};
 };
 
-- 
2.56.1

