Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D9A2333433
	for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 11:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761131983; cv=none; b=tk3+UYJrftsxmNkBmXgQXVY8meU4bTYT81uhioZ0me9TSe6fHjhbppaHcPTXC7o1JNBrrigifdn63v420EEJJk2u+/J4eC8ptXwLu16hVgvgDGL7A8qqZ3sXIxAcql4SYBrJqCdrgao7aQCgm3VYe+4GWkNMNmkxaHTECqIuOEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761131983; c=relaxed/simple;
	bh=1mrG/yol1/JtpGKNAwtm5R1RG+GDRE/X9WA1wtY9TFw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=swifioaztxBUydsjQ7Hx/ppL1w/De/NzR/mxoyGe4bRH4rs4iAvr18EvuRdmp4rG6w20V3JOaDL2vbsyWr6Ljmj9NbfSDaVaV15/nn49jQRQkrKu80dOx84EKMBFzLBYuTpCO6njpF7nhweMnCeoTQZtXkerWhzvriyqSG2NvSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WujvrG1h; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WujvrG1h"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-426fc536b5dso3753630f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Oct 2025 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761131980; x=1761736780; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SUARhHfbTngybzaWH5xMNt4+HQhGBHN+eDo+AihXMvI=;
        b=WujvrG1hcHgP29j9/I8E0gdlqc8glzhqA2TPs11VcjqGvWX+kOT/PKzGbMnFuDeaxj
         JttUpcEvS0ENS++sDY2JMFmuJHvszXaKMM3e9spRFWxX5weNsGAaUe1hsOMHBzVae26I
         f2AbePcRhjipIolQFFWxeNNO6c27MJ619Jwsgnuh3hWVMsvGJ/4aCsGlOoz2ytN+wB3K
         Kqg2sUZ/dofOxgA8Va+XlV7qPGlWu9oZ1QhsH5tbPGyWcwFk85aM5zJul1fMXtlYrnTQ
         uXgo1FXQ4vrjco7rU0epox4E8i2GTxucMjrvNCtOzS/cwYdoTAnBwzjCZ2py8me6kmeF
         GZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761131980; x=1761736780;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUARhHfbTngybzaWH5xMNt4+HQhGBHN+eDo+AihXMvI=;
        b=NRahQnL95pr3SOfThxyhFG5yhRH4+3UpJvXByDYp0ymfJVCrBzCXY4/yooVCbcyLXT
         s0zi1PixEVujPQIoUrW6Vk3UQBQxzePTcLeM2HhX4C+32Lw/e7sUj8TfJwUfQmw2CTXG
         fddf3khbXHi5lTv4Eka2Qgjjvec1C/e6jaEg/zAcsmYbhNJk7OElOIA9ZmcOywl6F/vI
         j+dQxu3I+6aEjMhqkBUlFzKQZ/vQzSQxiAxsrvzt6bIHY2uzPlVkRM36DcLvZxR7Xgqe
         57vfDsBGDDZyT2HcytS4dbjAKtqLnd8J5b+oK4O1kN/7kE3AIhnZhQMGLKqUHNwqIJ89
         TXHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3/Os5QItNDFmjjZObG5KdK6ZTxjDn0foOZ1XnVrtZTtyi2kqxFf1j/wDuKonypZs9h692ELIkbPQ53FLPOXUc8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxtgiNmIGufoIEFbDp8IJorrz+OmYP7yMrES0VFJQmO0wxc2sqx
	xCGcJiAKjGFUIgWIKmy1oHT70kL7fw2uBWD0Y3Cxc+t+JgSfzS3/fASr78GtRf+U7Ps=
X-Gm-Gg: ASbGnctGH+i7B1PuEFXkcccN8ei/50o2jktByJL7rauSFZKI+9PqhUG02aUiTfhfvBl
	zKd3g2eecbPYmk8X8eYcikQm9ougbPTweAp8MZQ1dd+6/Xb2rHttv7vXxFaJdB6jKELdUjQ3yFV
	JeW2QDdWpIO6r8ZmFwkw3qoo7AtgetI5I3ZoZxtjVwA6a/0Uk/deK/EXSE4F6wsP6pzo3r7jWtG
	Wqtx6BIkglNOPBUGkEEzQ/5eA+UdcwhHhkoKtOR5MdfMiA6giV/4ZPFk9GH4fWLKwzwud6DRj7W
	UWGSS3iV1iVgc2a+/wg9bgnjEtKlIq1timoc/BG8GS+JD7gbPpVcMzgPbouPwG5CfIwzKryE6V9
	qR5l5XmstA7PmJx78QvEMcQzD3fRsPpL5QcxQPARxrUfbmvWT2SNJC+Vvbe+cpd1/URn/n62nPt
	H2JAevBlLFjj58AWtMuWR+4coVsCqmc4O0AC4mQLU74KjdD2RwcxNgJuies3jlQKQ=
X-Google-Smtp-Source: AGHT+IGVU7PNSg91ufp9cPjVd4Gpkg96hHzSv4SIyKY7C0GpIrtxcWnGzFIXHyAzs+v1iGiF52UTjw==
X-Received: by 2002:a5d:59af:0:b0:427:60d:c4fb with SMTP id ffacd0b85a97d-427060dc744mr14141519f8f.60.1761131980105;
        Wed, 22 Oct 2025 04:19:40 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-427f009a78csm24820692f8f.26.2025.10.22.04.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 04:19:39 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Wed, 22 Oct 2025 11:19:36 +0000
Subject: [PATCH 2/2] arm64: dts: exynos: gs101: add TRNG node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251022-gs101-trng-v1-2-8817e2d7a6fc@linaro.org>
References: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
In-Reply-To: <20251022-gs101-trng-v1-0-8817e2d7a6fc@linaro.org>
To: =?utf-8?q?=C5=81ukasz_Stelmach?= <l.stelmach@samsung.com>, 
 Olivia Mackall <olivia@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 linux-samsung-soc@vger.kernel.org, linux-crypto@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761131977; l=1126;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=1mrG/yol1/JtpGKNAwtm5R1RG+GDRE/X9WA1wtY9TFw=;
 b=N48x9p6uzGpyNoZtQ8hAMytjHe8+vJa5kkVV3y1m06z+AB9vHk0dNsc9uu/baMA5o2430cy1j
 F397zeVUFBlCxW6+4mUwrPVIDH0nAoJpuD4Xo1txP/TALKLTxBnAyBu
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Define the TRNG node. GS101 TRNG works well with the current
Exynos850 TRNG support. Specify the Google specific compatible
in front of the Exynos one.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
index d06d1d05f36408137a8acd98e43d48ea7d4f4292..380f7e70910ab8bcc28690782532fff87ca7e30b 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
@@ -630,6 +630,15 @@ watchdog_cl1: watchdog@10070000 {
 			status = "disabled";
 		};
 
+		trng: rng@10141400 {
+			compatible = "google,gs101-trng",
+				     "samsung,exynos850-trng";
+			reg = <0x10141400 0x100>;
+			clocks = <&cmu_misc CLK_GOUT_MISC_SSS_I_ACLK>,
+				 <&cmu_misc CLK_GOUT_MISC_SSS_I_PCLK>;
+			clock-names = "secss", "pclk";
+		};
+
 		gic: interrupt-controller@10400000 {
 			compatible = "arm,gic-v3";
 			#address-cells = <0>;

-- 
2.51.0.915.g61a8936c21-goog

