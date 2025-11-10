Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8933128CB
	for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 14:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762784519; cv=none; b=hqSEMHatMiYpv2paSFaix5QECmLXQHC4mUJiRGe17g46BTB6pGY8eEsC3PdUWudUV0wW6W5S/ghZJMxm8ceYpHOoENNK9UtHxPGQ8j1+boLYBKT37b0MTdrzrEN+KGGFQcm6P7NE6O5C22N5AiwVD5G42HG7U7qcuciVwBnkJlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762784519; c=relaxed/simple;
	bh=ziekP3Cu0EpRasXBxiEfoJmDDNZFdXrwdJ5OCgftxWw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mOf2hupWTwySa6HHKHp/4w5hvMqNAcXmepNtyn0WUFhkGwNs2AjUyMbKUMYS0axxg0Sh5HnjuQcsyzGYTpmHFz0at6yo5Emn+3pCi1bM3s2tzOAZycuoM9v/8IR+wqA+1ErG9gh0MeePH7EyFcoZWQIhwA4KYfdz4JtQSwcJAVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rf4vcQ1d; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rf4vcQ1d"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47773cd29a4so9882825e9.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 10 Nov 2025 06:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762784514; x=1763389314; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+kNxvGMLv8nikKD5V7gvYAWirshtGm1lcEv3uAq4Bs=;
        b=rf4vcQ1dvNveXtWdBbcGRU9tvNXIGq5NjJctl8cRY7GrpSLQYxfhUytLa/hDsw8Yj6
         d0otIkA54o8KicCu/GlQZtH8iHYE5dOTqnKZkXeOBCPT8uCpIfVTq2Ip0yzZSiskM0ax
         0eyCDp/lNnxLindX391FLflN/Kd5SdOb44Yxznb0G+DkCOX48YwfnX1KKbO4itsGZvn/
         4w/NqVTiYQNFt9zw9Q8CbsR2dy+aJ1S8ii/EEOC/9Vjh9Vbv7i8Fi0Yb3tzUVi1cwU7k
         wIlucX84e4UmLYYWoRbXMQc/fgh2cJGVx5AkCS7LhFR3Vw0qRhP6B1sYTylz5ao9gh4f
         S5NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762784514; x=1763389314;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+kNxvGMLv8nikKD5V7gvYAWirshtGm1lcEv3uAq4Bs=;
        b=j03rps3eMXDwoja4UrY7QObHjM8QXGfRz7q53V04FQAvpcqS4bG7kqwx/7EEdmTFir
         MHacK8JE7vdrGgL25FJwFnLSZTNDyKdxiXm3V3gI9UbxjLzdBGwNiUOc6I8yiUOcJsiH
         tVz6hDlOp3Pqv0spQVyfiIxhtB+mYA1tLMLIRV0p63wp6SiQmkyvymjEejdnTlqjzA2u
         yL9AeIU6bIv0XhQOIGYHDYf9RKhNkIbKmvhoJQSOywtbJ9tzeZDCLJKQlRDST+OvcYo9
         ycUKBlFGt+O7KO1UZ7xtzPIlx1girF6dQtGYo/GolrZAWnKdltCZLqk0ieJobLZK7WD/
         iyWg==
X-Forwarded-Encrypted: i=1; AJvYcCUPEyaw8oM3SliujP5aUqvWg1NasuGAvwTflF8jr5+L3EatFINzvmlVdTehqvnewy2iuW98HGQYKlvP5euNGKI4FQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3TdbJ+xXbqi2lsivl1Xx484amFO3cDI51GR/GHVYEL7S6+D7Q
	zH6TUfHIsGdWqGrBbGz7IIscpcQYTEP9u1KABvfqplVT0bfYH57WJ9sHTgkejnnXRKJYuQX+Im9
	niYHVC44=
X-Gm-Gg: ASbGncsJqzQ8UnSaeDNokvGoVeFekKpDRM5i7sTu0y/K53LMWf7b5KpE4yvl3CPiJ7g
	cBMZcrxzkhYjfv/ludembUGS8KY/Gw5HMuGBVvNJPNvvHkv7k33Ay4NRjTyY+4VPR4tXfNj2/lE
	EkIG9kD1/E00bqzFSTvIz/L1TqQ4n4RNT1D8vPIi0b355KvEfEE0KQH9jiRWXqtWC9JMN7plPr/
	/lsRDan5GaMk0UYdzEwFCN/xBao61/JkWaQRt4nqBKqev4oW7wh/lVWHtu2YQcP1pcwBW06NXp3
	LeMde4kSyOmtYoln3mWhG5a2Jgm0G72OoRdxf+qd41ArHGuOFCnEkZgv2aBEwh5ezNBan9uUam0
	GgFVBX6rhZrfeTaYOASb7KPcG7aOhH4oJ4wLmsABntXqcNbW/va4ivYRBS47LFx0/g/wSTq19mI
	Nre83mvcvVLhoIEe6r5KFaVGu/Si/d3hwExJThubIl
X-Google-Smtp-Source: AGHT+IFs74p1QlslCAvC8vOV037XOkHMy0WjN9V1up8sDi5c/lrPsdoENM4mMiP24XnD3NBbIn1//A==
X-Received: by 2002:a05:600c:4f94:b0:46e:48fd:a1a9 with SMTP id 5b1f17b1804b1-47773293992mr80137005e9.33.1762784514106;
        Mon, 10 Nov 2025 06:21:54 -0800 (PST)
Received: from gpeter-l.roam.corp.google.com ([145.224.90.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4776a953414sm104369435e9.0.2025.11.10.06.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 06:21:53 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 10 Nov 2025 14:21:41 +0000
Subject: [PATCH v4 2/4] arm64: dts: exynos: gs101: add samsung,sysreg
 property to CMU nodes
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-automatic-clocks-v4-2-8f46929f50b7@linaro.org>
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
In-Reply-To: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2740;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=ziekP3Cu0EpRasXBxiEfoJmDDNZFdXrwdJ5OCgftxWw=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBpEfT7FGiMsEstVCKGb2cNl5JOVfCu7fpvJVdBw
 C5dI2aDaLOJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaRH0+wAKCRDO6LjWAjRy
 ukamD/45GTYto3C1g00lUnggUJ4361CD99eYDzuffC3kpS2dwn8cIlO4NMGs+iwXuEoA4RlJRRV
 N8oWpNmkRrHZbyjp+Lv5OlmFW+5XbSEv9mddsGjHIZvuZFZ9uoU+ATY4A7Qf2nGHeO5OjQeig65
 bbrHPLbONata4oiGav16Oeds/6H64Ji5InVgfBn+FOUq8H2YgYBXlS8h6iMpT202wiKSFLachLU
 2d9yGIiIQHqyggUORvWg36wtzI1CzdgxT2BAeJpI551XKqsD75puKhvfEV3XVf1/T82D/3j4LTs
 6jKPtX74iCKYugZjFtL3RAlG54coaAWvfveuX6jieIH4IUVNf4aXz5wBGZco86U+Smh1REx6ieD
 DSXzRXyjXZhXYA7atHw56vnEysmmE+MpfxgE1B9F5Cu3c9wlu1uX+gafvj6lxh7CrtgJ6uhJkna
 bJoU3Nrs2L7vGi26dWNWpAOM1SRG7Oyvg+/WzrW4aOsdVfjKnid/BYxEbQAopEmbamp9ao66I7D
 cVX1xy97hQ79J9Uy37F78P0JyL1v/Ydoc7UrK/2NcmHFdZEtDdVBfnbKMX3co7Wj11SkrH6DMY1
 5YydgXH3zTlCqzbQY0GHt/u4KzjIpPxnciTFZ4WvsnPdbT2REmmRLcMcfnUCyllQnQVjA/ZZZc8
 5X5ejS3tzKBfKYw==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

With the exception of cmu_top, each CMU has a corresponding sysreg bank
that contains the BUSCOMPONENT_DRCG_EN and optional MEMCLK registers.
The BUSCOMPONENT_DRCG_EN register enables dynamic root clock gating of
bus components and MEMCLK gates the sram clock.

Now the clock driver supports automatic clock mode, provide the
samsung,sysreg property so the driver can enable dynamic root clock
gating of bus components and gate sram clock.

Note without the property specified the driver simply falls back to
previous behaviour of not configuring these registers so it is not an ABI
break.

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
Changes in v4:
- Update commit message (Peter)
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
2.51.2.1041.gc1ab5b90ca-goog

