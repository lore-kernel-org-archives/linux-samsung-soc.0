Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5598D35E528
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 13:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763474188; cv=none; b=Jl5GGLy7QqtY08w0+WZK0zi1xJW2uKBkwrH5uJ/TpT4NhRO296FBS4CLSmufTd82VgFDBbLz1f9cRuKPPDRmkX2lrwhNZnO9SzyIUn3vkTjz8QNRPFpcmCGo9wjuqnWU2sejZ5eECC2nnVMHWOL/Tww/W2t/zklXtl4CNQNYt6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763474188; c=relaxed/simple;
	bh=bpikWqcBMsiIMl/jbWq2QmBbah7xAa4FAfmzSq15MIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C3ko2KR7hDrm0bP5zO3ctOFFy3t3T3q3D4sryzvyuPWZYbzGjeSX99BQRviGlUQ8QYJIjPFxqVOEfFLRfVHUlhxmi7k2CFCkHESyAXfi4EV9u1Xk8rM+DMD2VZGPI6QmElFBUODZ3XcBCrsmt4K5d0L1kUEYZHHJO76tronn+gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z0af4GzS; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z0af4GzS"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42b3b29153fso3037101f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Nov 2025 05:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763474183; x=1764078983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/NH+ihGTI+pHubvmXFI57IU6F78/DwM75gJfoYXgOw=;
        b=Z0af4GzSfgWhcD+p4/nJUxlG7WTRimOgYFd/FeaXyJmbZt8wOmgi5xvGyQOz0hXEBc
         5c+Y+yFPcvluuy3H7ANN8SBfxRoJ4BiIhwK3Wsdsqe9dIbRWyMaowwxC0q0DOCs4hsyS
         QZX+rgd4pGfW1OyiyCzD9DU3T5ApXPfQ49R7vjk+rmWlwuQBFMIdHLzRRVtTpt+jT7gR
         avK79shS4MTW+7m571H+khtis2sBsxMC+8hHBHJ1wp+WVGl9CogLWcQgh5q45Plf/DX9
         BOrC18oQKmlzs6C0+andAfpjADzbB4cDKGboLYTb05vr5LbqHBGX8dd7kT6wmYFf0S67
         +lVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763474183; x=1764078983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A/NH+ihGTI+pHubvmXFI57IU6F78/DwM75gJfoYXgOw=;
        b=Cfj3+04GnOLquZlj5vpAJbjs+IuAFjfUXKAwMHDC0P7mWjdv2iX8LiH0VRkOt5rZ+U
         6gYuQlSWJeEAcSziQGLifAKpb0Xu6Q7v3ozBtwjuFMk1bc6sul6efyeOjH7XKcWCrn5T
         vY9XMeRsmJ67DYPQXRu98ofWR9ZnmxgwVG2e6zvTmEZdpP5gUwd6TPqinvuWgBhEoIGl
         fB+YNse6WMk0l7zgwHZlI2nOLmsZn7/zWYxfs95GGBCbGoQ30aCdHa7s6So9QFysQhyd
         6dE9eSV+HTpRi2n7CzCu+DNgOAK0b3/nJpKvp7WHI9v8nn/VzWG9KZMhfbinu3gXBnSr
         i/5w==
X-Forwarded-Encrypted: i=1; AJvYcCUiV8dcPNwkfLwbYwPq7XhnzgZIAbBb2SsKr/BXjpPPcG1zpLSq8o/yydAzmfzNFWTwWUuNuJXJVW/Ncf71HwlB1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxqtmEAhRc/KJ07mwHKC28ICNDVgPPtjCsCp+78sp92AcMahZ6U
	NFIsmr5Rfk84VQFttYILBpGqlihYu+2TKhaQmQW3SFEhxemqWxYma567x0Qcp2pQjkc=
X-Gm-Gg: ASbGncv/J6jpuyjpNS3hGUcUmWkazjArMUrGTQKhIzdYcfm/h5wsL8rQkx/3lgnHDtL
	z7+ANom9J8z1+BNRTahlThYLJyEKF+dywJ76AvZgucyf15Jnha2sw9qsawwNpnbMfCbA3WFd/bD
	T/J9D1GHghAFMSxYV0ODH8xke/iIpnPkwVIvLA7HEYvEKvc98D7BOvakJMTllf3vsuQ6VCs+nU7
	I2FfOpk4tRYPiKAOU0436SurR0h2B6TfPlyFhs/srj3fV4I3AH18J9uQjJqmZRO0CWSdU+I1u70
	C9m0c0y8lTLNafrKT5Ge5ej13KqpqZdF2AV85cAj04MJiIEkDmVEr1O+3qU738pCZuPpIVgmE6R
	xDxyVwf4KECKMJMjP+pugTuEC9/twj8Y0CCuvYr3lKhnTZmi8oHNlFjY/FJ+SGJgfBj6uqRBNl9
	gIQwIwCYbmPvbucAYCJM9nHmKHRCDoefs57H8mDXfjLZ+2q0rlMGBBIoAR28to1h4dPOxGvPQvD
	p3C9g==
X-Google-Smtp-Source: AGHT+IHMTuoXSa5b/I85TLgO75MjoFjkVVohZVJUHjTj4z9Z02iCD1czvc9CTvoOMfIKnhdLi+Ctxg==
X-Received: by 2002:a05:6000:644:b0:42b:3e20:f1b2 with SMTP id ffacd0b85a97d-42b593246d6mr13598497f8f.4.1763474182903;
        Tue, 18 Nov 2025 05:56:22 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53e7ae16sm32728666f8f.3.2025.11.18.05.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:56:22 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 18 Nov 2025 13:56:14 +0000
Subject: [PATCH v2 7/7] arm64: dts: exynos: gs101: add OTP node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-gs101-chipid-v2-7-e9f1e7460e35@linaro.org>
References: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
In-Reply-To: <20251118-gs101-chipid-v2-0-e9f1e7460e35@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763474177; l=968;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=bpikWqcBMsiIMl/jbWq2QmBbah7xAa4FAfmzSq15MIU=;
 b=sGizZvDLkNesCQsmcBtCebaKnu3wBtFVyhLh+rpTbGIRZoAB8h0gn5q//8UvrhTXEduaucJCA
 N2W+Mx34ojOCfvhbdAC7Lo9YW+xVqqJ32Y5MBNgEch+eIaSOLRmNfoE
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add the OTP controller node.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..4be983d4e291b3afe3530fbea0163f70c1a74671 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -571,6 +571,13 @@ soc: soc@0 {
 		#size-cells = <1>;
 		ranges = <0x0 0x0 0x0 0x40000000>;
 
+		efuse@10000000 {
+			compatible = "google,gs101-otp";
+			reg = <0x10000000 0xf084>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_OTP_CON_TOP_PCLK>;
+			interrupts = <GIC_SPI 752 IRQ_TYPE_LEVEL_HIGH 0>;
+		};
+
 		cmu_misc: clock-controller@10010000 {
 			compatible = "google,gs101-cmu-misc";
 			reg = <0x10010000 0x10000>;

-- 
2.52.0.rc1.455.g30608eb744-goog

