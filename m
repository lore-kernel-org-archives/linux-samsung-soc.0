Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635D7221DB3
	for <linux-samsung-soc@vger.kernel.org>; Sun,  2 Nov 2025 20:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762115254; cv=none; b=t8ST3268oddqi4lsqF/2xEBhWOcHFIC+x80I6KIrHFMoPPd67SDHDsOShehh4AGujblK4IXHnOGIUOglGJst4UnC6iEUOQm9m9TiK8odNGXi37Z3JGqmUrkgj6jfUfryVmjMV4taHo9WD2FGr57b6yD/znnvPMXFB5/InYmY6Fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762115254; c=relaxed/simple;
	bh=nN8tTkTawLljwHrR/jD0xbk9vXmrtVCl9Rq1rJpMFpY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rQU9pi+8udtDuiyrNoiBooiaXqr1f7OrxUYOn0uYnwgt85vnALs1Bg4sZV8V+s0PuMOL52ucL3MSZRrK/rKUEZT75Fgr8Q7Qb5mW5kYlxcRNeKkJqEDLa0H7mrXweq9jkxMFGdkYcLnpmmtpLZpA9Epj6g4+yOk56MgBOd9xhDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nlEo1vyG; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nlEo1vyG"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47710acf715so18079515e9.1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 02 Nov 2025 12:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762115251; x=1762720051; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TTngrYfAUFTcMg616558EOBLpim7WtyStRU50Tfvew8=;
        b=nlEo1vyG+hXK5BUqeN8CPsDAW3Hsl8GOMs403oONgLuiCY55xPx9JsAl5OOtEa0wob
         +1RUAp9qQ85jEbGFaAFzBzayhAXFg+RJdGiIfHyYJeQYRi02/d64MJgtOvGqdPH7dE6u
         RCK3x4flZnTCRM3sbehQpYSqaIu7shhmktrAz6XuVxlr4K4WR/ioqC69jJ3PGear4CpF
         iPxANshGKVOBprTEWTVdnj6vr2Lmm4Dr7L5YRM2BBzBNWRoRsT75GqTB+zrvjCSiegdi
         mALcAP4oEOwKDW6+VFMHOtVyJAmFcCSk7+82zW23KQroDQu8R2FsTXlaa6t/WiSFQINO
         X/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762115251; x=1762720051;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TTngrYfAUFTcMg616558EOBLpim7WtyStRU50Tfvew8=;
        b=H11+BVT7vCYp4Sd1HCGTSS2SNH4pjiJbUeCyhQAnMEr8CZnNvIoXfCzNZJwbV+kbDU
         C1K/6O2bJp5XnpeDvbwoL6Gpn7NPnTHuTpkaNlP5ZrsjOGd122hlVsXBdsu/tz1QROcG
         KbzE5CgaaHIY45TmLVke3h/eG0UV0L+5jI5F/WlfadHtu4tTIU5iurJhOKxsyrPat0L9
         Dda3o/uT0TyDv2yZwqW//c8OCesmmynMQoj7U5MNImXT2GNHhgwTu2TU2WNV4YC2Laev
         R7UNauITtA5i0JQVQyBlaSFlEKkG/zZjSmD53KHD7FR1YhMBwp07SldBaFIO2zNJk0oI
         CEgg==
X-Forwarded-Encrypted: i=1; AJvYcCWT4todp8Ni4w9sqOv3KJRnMjVNLz0oRa6RyCQ1vbMbCrXxzQwR4AU5do1nLEkJR8tHZoLyczo5aiJc1KxZGQFe8A==@vger.kernel.org
X-Gm-Message-State: AOJu0YySIjPkfr0Wuf2TksdGLPvL4O6ZjuN59r1bllJqc30fRYO6jgB2
	51Dn1m63Lp7FHyUXWwLT1pr0GNKh/HIfmspH1fV7HP329TIvKLZpDy0g16Aos5tPcpg=
X-Gm-Gg: ASbGncvP8M0ZHdSEei1yQW6MZxYytMPSxbOT6N9FLP/s3dZaF3vHvzMitCSI/qWj5tY
	SsVcbmv/87OHuz8/6OBza95RODKbYR/bteAq0464TbQyyjtI+Qtb+VYmeKWH2+p5p/SIm6Q9vEw
	zsfSNr084PuCD8r/GsJyGh7Hmh8iVWFtNGhr5X3z2UINJCoHZjuAK6Tm+jftNY/oJguCnavBTqY
	WCk4Q1CNXura0mHZ9CAkASItqn2a4/+SdFJs9bLmoZh2fLIRPiy8XfI9Hdx1D+ArXk3iKcdpNq2
	BbR22hQnkS46mYE9IHG5949trT24AgabFegdXhwLVRa8qAnNM8ylSoHgIqt4rYo17Sc8ZmL9Oqa
	BtzaKlvi44261UM+9Hfx8YckCOU4K/mwF23n3c8FRfgvrU16Eo6AdzbiX55r0CbhQpNk+u2iZb2
	6LkZW0bdaqP7UPM5twdKUa6AVgU/9Vmus=
X-Google-Smtp-Source: AGHT+IF7iJ+IgLBUP9LE7khd4BTeU79k3SW+Aq/qgYQ2ReUgs8miL0YqahEetcsdRE6/eSU7CMke4A==
X-Received: by 2002:a05:600c:3489:b0:477:58:7d04 with SMTP id 5b1f17b1804b1-477307e214dmr92032845e9.9.1762115250618;
        Sun, 02 Nov 2025 12:27:30 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4773c374f84sm114664165e9.0.2025.11.02.12.27.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 12:27:30 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Sun, 02 Nov 2025 20:27:15 +0000
Subject: [PATCH v3 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251102-automatic-clocks-v3-2-ff10eafe61c8@linaro.org>
References: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
In-Reply-To: <20251102-automatic-clocks-v3-0-ff10eafe61c8@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2207;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=nN8tTkTawLljwHrR/jD0xbk9vXmrtVCl9Rq1rJpMFpY=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpB76tYpUV3fOT+rf32etuSr6akf6snwSSeY/JQ
 uXlfMOQIJGJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaQe+rQAKCRDO6LjWAjRy
 usr2D/wID/WRNDiqnQlsa8OyzPlkf0/VUyOybWhKF0Kj5odKclbYF2mxiScH+cIq9O0KL65XXN9
 BeN/ur987Dump6bm/2RiO7OKViS6igi7fbZrb6xfY8yHXM97A3x8QM+s9y/K6HNTnW3ZfCbceeE
 qCWA7BQgey9BsTzvr9WBYq06XAVsqujR/vhd7U8xrO1ZWwYSR6os0mKeZ8iJIRmQv28Bbvk74I4
 RWP36iDmy46mIZCjcWQenVKLLB8wd//NzgF4+twS71jMrGyTCAyFtAkLYvjy4Hm/3QF3JD6IuDw
 SPM2IaGq2C2NRTE0P5HK97fsPI/2b6A/dYQpUcu8rjQdpBUr49RP89Azhn601bhgIKqydE0GZjI
 vQuban4CFg+pes9d3APbuvKQFVDDUpQWjTPLEpK70zw5sogUgzXlfXUA+zcpmzDeA2GpPo3YIPH
 p7z54RnNqv9HTnSCERNP5CqVdUIlYCVsVwk1E/v8ZLVy2T2yIiQXh/92tpgq+lKeZ7SIjBzHMBf
 78PLsvVuoaL4lDZQghUB8GBNXh6MAtg/eKTIpkgcTD53qPK3x68rMD0uImtxtqGynMEutGneU6k
 CrysUXcf6J4nvDbrssGgpWitEon14PdRMFpj1YwtRedtRksDMmmZZsJ54fgoYUb8MGwcQv8Jabl
 +Hfbv24jEDwvZGw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

sysreg bank contains BUSCOMPONENT_DRCG_EN and MEMCLK clock registers that
need to be initialized in the CMU clock driver.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..c39ca4c4508f046ca16ae86be42468c7245561b8 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -578,6 +578,7 @@ cmu_misc: clock-controller@10010000 {
 			clocks = <&cmu_top CLK_DOUT_CMU_MISC_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_MISC_SSS>;
 			clock-names = "bus", "sss";
+			samsung,sysreg = <&sysreg_misc>;
 		};
 
 		sysreg_misc: syscon@10030000 {
@@ -662,6 +663,7 @@ cmu_peric0: clock-controller@10800000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC0_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric0>;
 		};
 
 		sysreg_peric0: syscon@10820000 {
@@ -1208,6 +1210,7 @@ cmu_peric1: clock-controller@10c00000 {
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_BUS>,
 				 <&cmu_top CLK_DOUT_CMU_PERIC1_IP>;
 			clock-names = "oscclk", "bus", "ip";
+			samsung,sysreg = <&sysreg_peric1>;
 		};
 
 		sysreg_peric1: syscon@10c20000 {
@@ -1566,6 +1569,7 @@ cmu_hsi0: clock-controller@11000000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI0_USBDPDBG>;
 			clock-names = "oscclk", "bus", "dpgtc", "usb31drd",
 				      "usbdpdbg";
+			samsung,sysreg = <&sysreg_hsi0>;
 		};
 
 		sysreg_hsi0: syscon@11020000 {
@@ -1637,6 +1641,7 @@ cmu_hsi2: clock-controller@14400000 {
 				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
 				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
 			clock-names = "oscclk", "bus", "pcie", "ufs", "mmc";
+			samsung,sysreg = <&sysreg_hsi2>;
 		};
 
 		sysreg_hsi2: syscon@14420000 {
@@ -1697,6 +1702,7 @@ cmu_apm: clock-controller@17400000 {
 
 			clocks = <&ext_24_5m>;
 			clock-names = "oscclk";
+			samsung,sysreg = <&sysreg_apm>;
 		};
 
 		sysreg_apm: syscon@17420000 {

-- 
2.51.1.930.gacf6e81ea2-goog

