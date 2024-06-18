Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF94B134AB
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 00:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718671073; cv=none; b=jAN7PEGZ+EyMTvxcC9n1Fn1Bw8X7ENyh7PQZEDN6PaT0ijmejqt60Zm7ycz7u+UHtmvVBUuMMR4glSmnowfwYQPNG1GIo6RGupT/LwDLDBKRYtv/vON4623xfhjGiFPi2B+ZbizpscHcwFe/OYL48rEKUdknnMJ9AdTrZNy/pJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718671073; c=relaxed/simple;
	bh=idQsCXTRSpteqMQ/ApU8QqN2v+CejLFr+G+P9eZMvmA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RNWABTZcPyIoVee2MgLMnMLBY3opAMlallUr3tWiy4l3CufxGop+tot2FidhEa53AJD8d/Uhqph+kPkqlzEIC3i+7cwMBy+L3GLS+dxeXbLyMmz6NLbxlsD8Zy4KtMmIrHsQlWGqWw4610F91i9gI8kJLytnYW0dkAv8aD2Nj4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Rq2edSdo; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Rq2edSdo"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5b9a35a0901so1664863eaf.0
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 Jun 2024 17:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718671069; x=1719275869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q/EO8T5rRTkiZ8LbuFbhP2DGGAGyuLlPjhaKm+CoFdc=;
        b=Rq2edSdoPiP/PVPV51jRdJNi/JGzv7NjujvKFSAc+VlJ+kg6PifKAO8X2a9+FyTjhi
         4x6OQFQ5qCmlFBdwTeR9ItFl/tLIW+liY7bmPnCtja4v9HyPwVukt3tUPInsORSB+OAV
         44rBSezwB+ijG2u7TWIMczkBlCJb+ecQ+T9bcgP7PG5btvUsOYqjqmQ1UH8japLMmIRL
         CA1hSYfdiqfUd6HYLBTOsCfhhQHy3XScL0YXmbMtiqjtHp33Yg56dLLVj8WIRTrrQHNi
         65Kj/dOkycuJp62P4sAaJIBrYwzb9ucdrSN2PIVCs+Rwz7/ejZqZ8OeFkMHwgwbIPoqQ
         sj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718671069; x=1719275869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/EO8T5rRTkiZ8LbuFbhP2DGGAGyuLlPjhaKm+CoFdc=;
        b=mhXmcpA76W5cM6FX/TvkOW7d6gjOe1hcO+dQOHlhufLSs3xdNbFfs48f7ZZ/qJydPZ
         rt/8UH+Rj45XI2zzxzbp/RdqJYdlvq5yfw0tAcXinskaXJ9cxXpMTIBo5CjSd2viSVOz
         8ouioXLigpONzwr3WaLv3uxaty2m+54hwFDoHyBJBJQdLjDm6gF+BPtiDSyIDW2w0ruW
         Ff2GUmNi+QZ16+ocvWQBK+IWez/p6j+kqZw9X3TZh5SlFRfBDz+cmOwZn9Be5HbRlsrO
         6CdO9ROVdU/48+V+LIWI+B2T2MK4D5Y7RB/8xBcjX0R4nKjdhzV3Zd95bKNvFlE0e8bk
         mhEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXt1DfuJrp5C0ambhPV+9eY36yP76c0XYYBFXq10s5AJNKBBnGLEKCkZo4awXGVBTGEahNGUsM7vpRneuTXl6wGT0fRyIXZDhN1jaljVsU9TKU=
X-Gm-Message-State: AOJu0YygS5gUFItP0CTUkloXIUwwDv+5E6KOAT1dpiFfIF3L5k8eoOOn
	wK4FxtyNAuxZv4yx4lsi169QaJvP7KOUC8jJO0pHaB16BURBVpjLgJe7BEHwKkg=
X-Google-Smtp-Source: AGHT+IEcoB3JmFJ9IpjpkDLM0gXNp4DcLepn0oB2jv35HwAPRgPQt+5YDdLNa1XcS8JrDiT3nZnRlg==
X-Received: by 2002:a4a:7651:0:b0:5bd:c2b0:f599 with SMTP id 006d021491bc7-5bdc2b0f7d3mr5945744eaf.9.1718671068698;
        Mon, 17 Jun 2024 17:37:48 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd5e19a4e7sm1320770eaf.20.2024.06.17.17.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 17:37:48 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: exynos850: Enable TRNG
Date: Mon, 17 Jun 2024 19:37:43 -0500
Message-Id: <20240618003743.2975-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240618003743.2975-1-semen.protsenko@linaro.org>
References: <20240618003743.2975-1-semen.protsenko@linaro.org>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add True Random Number Generator (TRNG) node to Exynos850 SoC dtsi.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index 0706c8534ceb..f1c8b4613cbc 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -416,6 +416,14 @@ pinctrl_core: pinctrl@12070000 {
 			interrupts = <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
+		trng: rng@12081400 {
+			compatible = "samsung,exynos850-trng";
+			reg = <0x12081400 0x100>;
+			clocks = <&cmu_core CLK_GOUT_SSS_ACLK>,
+				 <&cmu_core CLK_GOUT_SSS_PCLK>;
+			clock-names = "secss", "pclk";
+		};
+
 		pinctrl_hsi: pinctrl@13430000 {
 			compatible = "samsung,exynos850-pinctrl";
 			reg = <0x13430000 0x1000>;
-- 
2.39.2

