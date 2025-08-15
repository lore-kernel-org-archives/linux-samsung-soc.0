Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E4812D1900;
	Fri, 15 Aug 2025 07:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755241520; cv=none; b=W1UIZ2/MjmA23XLvxHemPUl9Dk2MQbjBaNrbIqNlbWbF84ixYwIvNtIkXaEwfKrA+7OIXVrjt7kDcB4q7dgApZJklSAzU1zT3Cm+o2/htP8/UqwiQpKL20pGHRbFZjjl36K/U2tHwP1wsx7k8mW+Sasq3tHX1+2/ZfuKsJ4MDEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755241520; c=relaxed/simple;
	bh=VbLQDxGquo8ELD1QCg1kIt35ML7KSrvit7i/0YMFppM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lR4s7RRZ62fYTUfFpiNsAX2TFZVZfTZxQyfRHgN2kulPWBPc+kLv/UZRRkL4OsAiXSxkXNx3SNJQz2g+Yw2e+MvU5hZWcuYlAO+j+DrU/9Ea2mM5unhrPSSmRQTUWr7IO+nqCHw6NwMaM3PTIVDI6D21cBRD1XVTEsDB+OG7Lfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCYyZZn9; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCYyZZn9"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-afcb7acfde3so213348166b.3;
        Fri, 15 Aug 2025 00:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755241516; x=1755846316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jGNseYWJek5Azr5uNJhZwVkFVh/FoAy6ND+2oSz2dvs=;
        b=fCYyZZn9Dm3ZiYDuGAUL78DuLNs3CzuXDsVOVuimoWUFEIJDaM1bvblEBRLf8UEfHk
         9oC/qJYN488tDUPToQj5jTLjR4ghX0lK2LtQqWWyyZzaLS9eiRsFkdB6UrUQ1K+YRFov
         5Ch/Rikf8G98O38cD4UgDX2DFyvTbC1pYaWb4lMrqS9R5SC1lcz4x3wHMqjz0LvvD/RC
         c2SPmBk+mG6BMCaF0XgqpZOqJPaP4WyAt1q2RY3FXTYIDXDpJEo0XMVLve+rdiyEqiyr
         YHkwc3Y52UTXqLIhv05NSX6up1EBSCLMcvSMh/Tylsd8ZF28d7vdYCFQQz1iu5PxzipL
         sGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755241516; x=1755846316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jGNseYWJek5Azr5uNJhZwVkFVh/FoAy6ND+2oSz2dvs=;
        b=qcytK3OraN0DWVkzNuAIogcp+qAMbpGUvslp58ZnBID1t7kG+7HgiHUmsbM04kNmnS
         OtDWlX0CTg6+TJ/ee7Ax48bJXSfAaVeUVeIeEzKkNGxDeTHgoi8839EcnXYYJCvD29Kj
         lesF6MRhyw45tle6gNt6k/CH4U6NIcCs9ES53naKxInwefSGWBj97Oo16BpBbWcSWIeV
         /ZWIstNphoP5YG/BHwzY8l8qeOFZaHyIMUGyTECqplLrWbrlXaMXKljCMzlaDlqvkCs6
         9AfnXOUoUmoYAzaNVGvdXlioo/5qeWymqzrGpR3kQMihSEX7LkhROAR5nzSl+P+syfy+
         f1kg==
X-Forwarded-Encrypted: i=1; AJvYcCUy4ErbWzfrYFDX92kIYDU1SGM2/kQn1U/MohcEQ07z90fePcTO+ghXrUM26Tv8xBA2D4ysHmBZxpll@vger.kernel.org, AJvYcCWCO/4mH4kMllsQNyZjRHLVf+XkH+QMMgHZq0J/uKbuXLJbSF76ijCVbnBIScXa7lO1NF8WtS20JvU3a3Hp@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7StozTa73hrncTUdqv2JGGZ8Zr5NGHvHV/0cGGAwqTSbbmbhu
	1fPrQQFHUsxNKLVCziROqjFohJ4eeJ/xlT5DoMjmhEbo7UtzfpiqgYSr
X-Gm-Gg: ASbGncuABvLJRFmnCTbeo2K1T/7hehv7KYC3lz+UI0IagTgZ4c4AUuEscnr4gj7LNk7
	jO8GocQWLvQDgK5yaqruIVj3hj69NiOK5eXIpJ74+DRLMV2FcXjAACAjjg7ZriOZyZuTbfZ27hq
	QpekiLQfZesLsHEHFZBtqQ9Eh5Dn60jBZISzAF2RmyMGiHu1YJY2O9xJwmjIv1wiQvhLegUZ8Dl
	1x5j6IMN773/f/6ePiV+Xl1ufuwMQv2nmK/P3eiHvTycbXW8v3OfrE2hLoai5ynZZUXkDFRcGSx
	lv8lRT0L8zOsQUjWaj/FhWJl/PuWtCnouu0w3wPAJKg0J8klZlmb1aPvMGxLFRuVF45NfKIyBNc
	yZ6zl8pPcc2j+oI9H21yMauZqnDfIxQN9XBXQKr+TJhCudm9GaJM73fFiT1b6JtUCgpkNO/iP5c
	6JlbT5jUtl
X-Google-Smtp-Source: AGHT+IGj7vBYUE1quBMaFjbNLwReG7Th8g72pDzSLCH8avdjLFGI6YWDdzOBtuyrxZNJ6yrn4QIfCw==
X-Received: by 2002:a17:907:7ea8:b0:af9:38ed:5b49 with SMTP id a640c23a62f3a-afcdc2062c1mr90228266b.5.1755241515430;
        Fri, 15 Aug 2025 00:05:15 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcfcb2ddsm74269266b.74.2025.08.15.00.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 00:05:14 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] arm64: dts: exynos2200: fix typo in hsi2c23 bus pins label
Date: Fri, 15 Aug 2025 10:04:57 +0300
Message-ID: <20250815070500.3275491-2-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250815070500.3275491-1-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The '2' in 'hsi2c23' was missed while making the device tree. Fix that so
we can properly reference the node.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
index f618ff290..5877da7ba 100644
--- a/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos2200-pinctrl.dtsi
@@ -1438,7 +1438,7 @@ i3c11_bus: i3c11-bus-pins {
 		samsung,pin-drv = <EXYNOS7_PIN_DRV_LV1>;
 	};
 
-	hsi223_bus: hsi2c23-bus-pins {
+	hsi2c23_bus: hsi2c23-bus-pins {
 		samsung,pins = "gpp11-2", "gpp11-3";
 		samsung,pin-function = <EXYNOS_PIN_FUNC_3>;
 		samsung,pin-pud = <EXYNOS_PIN_PULL_UP>;
-- 
2.43.0

