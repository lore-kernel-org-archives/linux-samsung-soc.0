Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3913C90A
	for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 15:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711465990; cv=none; b=l6ljPYiW0hIxA5XGpQwkUHAS0AoRmSrB3HjARD1aQAe+o98nqqfwQ/eJQWg9lZ1uI6559Ua+8XryWISoWjo94Bz+gI+Xm686BUaZaCvsmVOdxJVf8XEGMhm+VVXxR3VB+0I6kki4OWkEQg6g5552WACoLmAZz08UVi+C7sQLcMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711465990; c=relaxed/simple;
	bh=7lkzSUm1Ul8V+EdUeWY/X1nNxSh2jzQA9QP9ImmSGcc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UhYGxB08K1gG7+8YZGoVoqOfryIbAGel7zaIO8w3KWEK7ae6nzzzD0gFMqVmRNhS5IAQ/iaGByfSQpuHQ0B+Oc9Dapb9EzAP/vP7akp+hvYqWrEmAOu+fHJbFGQHMzCamswxrAhMacWitTC3d/1R31jPcOC9RWNHA18+TmHNa08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CYMttxlv; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CYMttxlv"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-341b9f6fb2eso2846639f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Mar 2024 08:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1711465987; x=1712070787; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWKDIY/u2md2wNjgeXLoADhUE8Z+aSwj/NWl7yNcIbo=;
        b=CYMttxlv7yNvDasdFvqrx67JTDU67YnFk7ZZXAgtMMh9DeIvbc5vHaxhrfmMg8exEz
         5AlWw06qHDh2wLYHRbeNTJgfdLH3el2yyUNaoDRPp6VmfVL3qPxXxEfPk+cBcithbxlI
         T2CkFiNbueSkUPon9RAsdjswm3UBGyngYzEharnW1d76lt1rWyBUigAaD3a9tGwUo9ib
         e0PfNuwdcelRnwT5+qs5Nv0916Xv5MuA1xg55oE3JtImeF1pm9Sz6sUGG4RV4hVjZVHf
         KAXZw8yI0n4cn77QCG4hzIxkjKtnJIP2YkjL6HNN00WiINimIZXT4FXL5aADW1hCeI5M
         7BOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465987; x=1712070787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWKDIY/u2md2wNjgeXLoADhUE8Z+aSwj/NWl7yNcIbo=;
        b=EQ/ipF/q7rB0PApmZLX1NrOOkRBkMMq/TG89aFOHV/zkJ3GwCnG66PaeCwSnonjfdN
         QYe4TAVT4wOg+q4uLQ1jznZm1TEl6Tj1aAIzSX2XlYVOBcgsXB3O7g5UmVwUW2miOkVW
         3FSIPLyQyHKV9rKoBrmc12t4lARk1ACXpKWIeTSR0oVfbiMGdkWuwhUvWPV79pQRuZzs
         44XWGy/nVMyC+PWrbJtBPolsKZNQesCgfyP6MpEUmMUiNob5wL+WkPvmK7sjwHddIOA8
         zOswVcSkR956ij9jC8I1p0CSYlzpjkRZPtQJzqy0SihhqKMmMBqJQSQzaCloQ7HyW4nP
         eZrg==
X-Forwarded-Encrypted: i=1; AJvYcCXUxAWWENn5UEDis15Ih4vcZaDz9lZ6ckvEfwpVjQDKuhDj+vvprwKDw1iXcLo3HwTjKOkDYkogKG2qB/CfwYQNHrHUcN1y0oGuoaNhMbA/2Q8=
X-Gm-Message-State: AOJu0YwBgHGeAZxPaCWC0NF+Usy+vv87yGpxendq2W/1ceHAXEZjNmf+
	pCKOg9DBdS5XvUmlBTFZaCuG2yFH9QiQ93tY01i9zh89CEd2IQqM6PaYgS0+L0w=
X-Google-Smtp-Source: AGHT+IGRhfxsdkHs1sY7r1Bc4R3NcncGG/37vNy8SK4lp3sdCXyiwe+1uY1F95BtgmWu/vUaWrS2QA==
X-Received: by 2002:adf:e28f:0:b0:33e:6833:8fa9 with SMTP id v15-20020adfe28f000000b0033e68338fa9mr8121240wri.44.1711465987252;
        Tue, 26 Mar 2024 08:13:07 -0700 (PDT)
Received: from ta2.c.googlers.com.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id b1-20020a5d40c1000000b0033e7a204dc7sm12325692wrq.32.2024.03.26.08.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 08:13:06 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peter.griffin@linaro.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org
Cc: alim.akhtar@samsung.com,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	andre.draszik@linaro.org,
	willmcvicker@google.com,
	kernel-team@android.com,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v3 4/5] arm64: dts: exynos: gs101: join lines close to 80 chars
Date: Tue, 26 Mar 2024 15:13:00 +0000
Message-ID: <20240326151301.348932-5-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
In-Reply-To: <20240326151301.348932-1-tudor.ambarus@linaro.org>
References: <20240326151301.348932-1-tudor.ambarus@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These lines fit 81 characters, which is pretty close to 80.
Join the lines for better readability.

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index cfb3ddc7f885..690deca37e4f 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -374,8 +374,7 @@ pinctrl_peric0: pinctrl@10840000 {
 		};
 
 		usi8: usi@109700c0 {
-			compatible = "google,gs101-usi",
-				     "samsung,exynos850-usi";
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
 			reg = <0x109700c0 0x20>;
 			ranges;
 			#address-cells = <1>;
@@ -403,8 +402,7 @@ hsi2c_8: i2c@10970000 {
 		};
 
 		usi_uart: usi@10a000c0 {
-			compatible = "google,gs101-usi",
-				     "samsung,exynos850-usi";
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
 			reg = <0x10a000c0 0x20>;
 			ranges;
 			#address-cells = <1>;
@@ -419,8 +417,7 @@ usi_uart: usi@10a000c0 {
 			serial_0: serial@10a00000 {
 				compatible = "google,gs101-uart";
 				reg = <0x10a00000 0xc0>;
-				interrupts = <GIC_SPI 634
-					      IRQ_TYPE_LEVEL_HIGH 0>;
+				interrupts = <GIC_SPI 634 IRQ_TYPE_LEVEL_HIGH 0>;
 				clocks = <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_PCLK_0>,
 					 <&cmu_peric0 CLK_GOUT_PERIC0_PERIC0_TOP1_IPCLK_0>;
 				clock-names = "uart", "clk_uart_baud0";
@@ -454,8 +451,7 @@ pinctrl_peric1: pinctrl@10c40000 {
 		};
 
 		usi12: usi@10d500c0 {
-			compatible = "google,gs101-usi",
-				     "samsung,exynos850-usi";
+			compatible = "google,gs101-usi", "samsung,exynos850-usi";
 			reg = <0x10d500c0 0x20>;
 			ranges;
 			#address-cells = <1>;
-- 
2.44.0.396.g6e790dbe36-goog

