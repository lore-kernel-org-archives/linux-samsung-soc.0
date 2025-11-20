Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BA732D455
	for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 11:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763638191; cv=none; b=I4qixk28zn669GIRwjdpF4JTKqvZu7AFAOo5Y2AYMM4uX1zDv9xE9XYGTpfwuEhVg3ShNmatEnzY7d1Bdwcj0D2Jn8KjVsw4LvmXY6RNzJXZ3qU3Ua8LKEfNSK/MBGf0RHJ0vsEbc4L6AEr4zs0AR7leIr7YZJuWyt6kT2LjD5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763638191; c=relaxed/simple;
	bh=bpikWqcBMsiIMl/jbWq2QmBbah7xAa4FAfmzSq15MIU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a8PMowl1Xh/53Z8blX11nVYpolh1xOex/HpeSZAqemLxfQARm/h5kiX4Q8nZpMZUkHS0PIWoGZdphxYArcUdhPrKdvJ+31ZqoIF0A8ru2OiNnwDSMuymQMxHuV7No9zAUp6GJHzHF9HObfQZfvbm8UsqPHw2uGuy1XgOva41JFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c+Pg5BX3; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c+Pg5BX3"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-429c48e05aeso475078f8f.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Nov 2025 03:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763638188; x=1764242988; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/NH+ihGTI+pHubvmXFI57IU6F78/DwM75gJfoYXgOw=;
        b=c+Pg5BX3PuLiYyuKuEtQVmZ+lO2kTrZQyqJ28q5rJPKlot5QynzX2g6FK/+jX6efmr
         s+Jyg/3R7VRpO3yGmheBmFvaOAyrI3NVGsQX4ea8zjVkn/nCndPsb1mxVUNEAj4omGys
         l3mpJufsx2exAZRgEWCg6IlIk/KlZZu0aSSXbJyl//RDu5sKHQQxqOC0ORj8W/iJcZuQ
         dFp+4mKrli6MZVz7OKYyQUlbA5wOTJt8K4EEiFCoi5a6ZD6lZK4ALODo0oSB1W2nsOZP
         ITPNOijIkFOm31howfBpeRtxKhjwKAQzzLntHrykPnvzclaH7TkBDnUfexIJ1BXtXXzq
         N9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763638188; x=1764242988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A/NH+ihGTI+pHubvmXFI57IU6F78/DwM75gJfoYXgOw=;
        b=j04VH6DGCGvDSJRvoYmoXrfn2lpSfOxPcFroQxt8uC0jemwezuAVmcHN6yk1s82/OO
         H36TCeV8SvzJZGtanZbds5GgXfYr5+eZ7FJupq0mJvNuAxbElItCU9395+kLnSJPBDvj
         kpr4NNefaQYRhHjv1pmB+WU2D+71FLpljYv8iTVuZSPjE4CxkfCVK834AEeCIPRlsss5
         kHig0bR2yR5lUuMzLQDorYJBl/9jmTpS+sOhaOv9k4Y472jm0K6Q4z/DVMnLK0sM0U5m
         hMJdED0fRUIsNZoiVNQfSXjacHccAtEmExAmA8GnW/YT3AsNKCD2kyObGADMo//oBbos
         2N6A==
X-Forwarded-Encrypted: i=1; AJvYcCWcSheVblDVK+37OapR0NJ0f0el/hr1Eo2EfTVF0zwuqVwtHACZKxjW95jrKX9RVRskXkr20jeph24xW8UN3enj0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUf/sjnLfI6vWuGAWHU01xbUI30GokGZalz4hThzzebqH6hjv4
	I2Ckq5CHPBB4GiZvu52C1MbCRWbHHZuFUUjupL0MOlml+InWlyy6d24Imetpy3TbiD4=
X-Gm-Gg: ASbGncvtgstg/c/+2Lifn0O8GFOxWnQS8ktEc3G6A6d1OaKOVYkrE7Kyxh1MMm1YWhT
	rWFJ8ZFvDtUQxBfj7BvrTuG3Oyjo+NqH8lSpxejjwDvPjy6rXiCNjJA+4fgichrovmgeqVn/tXI
	d6s+Sj0bI0QRJTr3Q8SkWHEdZ1NQsoILGdZ6Ns4wlPIDEo1oNIIyWYhqzOWyiH9lREE+fa5gpEN
	2rE3PUUrjDLCf1GoNuA/pM6jQK7xBnAgI3915/KEK/LIocjbrlDASPNyF5mhIcGFNa5CGBSOeLO
	DkC/j6C8nm8EYPkneQybLXPxW+S+optZuG9WAs0qIq00oZBkCo2Si8wDBMS2TfMy/kGj6KRg3pL
	OH6eUlboucDw2kcHAvAp2YBO6l17NHyQllDQpl/KQsfbpfszpckn2VdTbM2N05QpCHRHq2ugmXV
	Eu7XhEXZiXQxGsGf6xEakVlIBouI3bFmH4omO9W4a4qEVcCNgHVsmHAcnWnkRVA43AioI=
X-Google-Smtp-Source: AGHT+IH8k/MswTwGLqwMNfZfEAxN7h+lqxYRkrxtUElx9mhpAEHdT/2K3XzbTjmmMw+BEdrQo+kzoQ==
X-Received: by 2002:a5d:45cd:0:b0:429:c8f6:5875 with SMTP id ffacd0b85a97d-42cba767c05mr2038488f8f.20.1763638185369;
        Thu, 20 Nov 2025 03:29:45 -0800 (PST)
Received: from ta2.c.googlers.com (17.83.155.104.bc.googleusercontent.com. [104.155.83.17])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42cb7f34fd1sm4961040f8f.11.2025.11.20.03.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Nov 2025 03:29:44 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Thu, 20 Nov 2025 11:29:40 +0000
Subject: [PATCH v3 6/6] arm64: dts: exynos: gs101: add OTP node
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251120-gs101-chipid-v3-6-1aeaa8b7fe35@linaro.org>
References: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
In-Reply-To: <20251120-gs101-chipid-v3-0-1aeaa8b7fe35@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763638176; l=968;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=bpikWqcBMsiIMl/jbWq2QmBbah7xAa4FAfmzSq15MIU=;
 b=oujFnjxZs2wibNVC2xxzFlbBl/q8pivW+chJMAutHAp5GASDYX9ux7hOfoiFw5KOgRgKW8M/n
 DHqqDaSpRwBBr9VAPGAejPUE/N7kvAgZxqQMLNxJPWpBv35J5h4lmpA
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

