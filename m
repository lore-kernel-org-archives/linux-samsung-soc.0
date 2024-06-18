Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E711849CE
	for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 20:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718743533; cv=none; b=t2trvGm5Qb8JmxEWYuA0LvSh36cG/36cBCPHYL7wev0IIdB5dOJqgF2U3weE83MJ1MBv4XZLMwgktdC+5ePXbIEbpwpSPCr2/zv1ZMFagL35p1afMxgm4yp0iXxu35zdj2Q/kws9c/Di1WF7NhAqo+NetRNaQQsd6YN7xIwvx+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718743533; c=relaxed/simple;
	bh=OTr12Bi8/NXL7P/8SsOisfRk21WzJPQ5t6rWot8jDSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lPCRzPiEZQmjqLT+FZ5meLPnd9N/pTyAWq9aj35bKlWyCzbrwNPJhO/Mc7Ac+lp7kgsep0reHJJp3SY4RSZsJh2rKWz4iak1hV7XnR1E5pnEdU2n8NEhVafKMnqqtNrHlrgOEDbqCHlSS3ICKPrr/tBP41fSv0LvhAAQ2liVjuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fwD1UANX; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fwD1UANX"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6f8d0a1e500so4359490a34.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 18 Jun 2024 13:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718743530; x=1719348330; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=An62MJeGUMiGGgvWvJTRH6LH32AiZhil1QbTJRqvu4k=;
        b=fwD1UANXPhuQFNeXn3tyjKPmjRgb0RzjMolQ5d+F8KZyOdw1ybhQ7kbI28aoLCxeUk
         se5th8eZJ/O9caG/Z5Rvt/Bv32NwRX3cg/QNEiV6gsHJvEm2n6yP13eFGYFoyiHaYtFH
         Cwx/he5GGrhUQ6qTez3iPi9xBh00e8smX0UTEPqmJeNSySSWFECVX8BXIjcdovHfEcAE
         YwUDDYZopGHj//69Qdjy8B8o2yH79W8/SGuhDWfC9xFCPEdB5D5/P+Y5VHyL4eK5+Jzp
         d0zwSwXHpAvjRpHbg93M94OmDdkR1SzLupirHUVnCS/thwvaWaJbMdwjiRmOfFDZKbVx
         VGfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718743530; x=1719348330;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=An62MJeGUMiGGgvWvJTRH6LH32AiZhil1QbTJRqvu4k=;
        b=PUX1rY2RiPhuLFtFnyloKNwrOWwSQnpZy/QWuOaLB7CI26jEjofwuCeiF8efx0NJdM
         0Ta2SqmqFIaGKoRzBaDgPMM9eZv6NkiHdjbAu9R1vp/wVNX0hQsGPOcecgyAQgaIMjEC
         p4dkhNfuJTm0VlXtpPhziXeuJ92t4pZDnJWMLf6YPOlRBG7PBsQPLkFFHWn0uoWdBWlo
         4pJpO6PV203ThoqqM02FECDibFGWfhupDOanHyzYbAWB66HjxMZaJZKQGmiwJQQo4iOF
         eaDc/gAu4DlFI+ELksmP0GzgeUcJgZG+/POm90ZreteofmDagQANqdoaLydOVFcsXNso
         /eeg==
X-Forwarded-Encrypted: i=1; AJvYcCWdw1gXYXabY17RsEou6q5nCLwE2xbSCIpKmz3pDj8py7fhcMw+LAeDAuBQjinm41ZkCAhKyFHAz4QFHS9n/MFnwjwCnf9p/4BLqOuLp5aOxZk=
X-Gm-Message-State: AOJu0YwEFm4SdVWdPWhz4ruDV0ftA8W5tOoOik2su27OzswfwBNWobrj
	Irv+X3SD8KaoB72zO3TmedNfJIy8RmC1KciOkLVWoJGhk14VuZy+U0dRKbrWK7I=
X-Google-Smtp-Source: AGHT+IF/wZnyEwlmp014WzzyEzK86air2V/fRVppB5R1D3+8KBOP7B7VGADdvbG4uR9hRt+kJZiG5w==
X-Received: by 2002:a9d:7d05:0:b0:6f9:72ca:fdcb with SMTP id 46e09a7af769-70075a7530bmr843183a34.36.1718743530058;
        Tue, 18 Jun 2024 13:45:30 -0700 (PDT)
Received: from localhost ([136.62.192.75])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-6fb5b1e3adesm1931562a34.36.2024.06.18.13.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 13:45:29 -0700 (PDT)
From: Sam Protsenko <semen.protsenko@linaro.org>
To: =?UTF-8?q?=C5=81ukasz=20Stelmach?= <l.stelmach@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Anand Moon <linux.amoon@gmail.com>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/7] arm64: dts: exynos850: Enable TRNG
Date: Tue, 18 Jun 2024 15:45:23 -0500
Message-Id: <20240618204523.9563-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240618204523.9563-1-semen.protsenko@linaro.org>
References: <20240618204523.9563-1-semen.protsenko@linaro.org>
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
Changes in v2:
  - (no changes)

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

