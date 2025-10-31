Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C4434C156
	for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 12:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915376; cv=none; b=njzwPmYPgseQZttsiMQgrXrtUefEk511pst/vYyVFzN/FpkKOSe/8PxoCgM31g67pHRM7Xj2IolHLSTOB9AZkZT/Ua40o+U8D3kMAhKjUfs+wFSuDQ7sC72I32o40darq/0hK9bUKmX7YYY2t7TcgubPLvrpZ0P8/BWgeetfQPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915376; c=relaxed/simple;
	bh=FIHoekKrBczbbS2fXtyE+7Irx4O0EiIRwRvzO55FnY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RNYV6ADFljtR7T8Ip4XZApUqyU1UYIkE6Db5yUTCfT93bvNmoQ7sR0oWhy4xwbiaNN9dDgFzjF0DlWNmL2ooRCQmHv01mFIZSOGjzHa4MEp1NaDrrWWOYnk7s5sQef2vhwNhfTyfhXB6UPziWLogUYCSieQ2rz58ILD4rIWIU1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkP7DDkJ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkP7DDkJ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-475e01db75aso14786275e9.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Oct 2025 05:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761915371; x=1762520171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RV56NpH1lI5ED8FEKTPa6jAqZswvvDhZwVi486+R9e4=;
        b=NkP7DDkJqIfPwc30HpGIC9tTwvVmgvvX1iZq6OzQRMHEDLphKfqE31dFP6rHkWoRke
         IT6fGqav5r/lIgw0x8le9UkgTojnDyr9IjKYB6gH1D6XtAj8BNxnWoPU6cHj5ADN8piN
         1dI4lFWSixfuf2McCjGYAlSJAYJaZcsqukSyQ0tmRbHu97fK4VGHpuIt3cX5SAEABfXx
         ho5mQYj7uTylXD0ZW54JVIY7wjuIQbGOG3YL3usrkoU0x8XAIrdBuC3YrsVBPZn8doIB
         ZreiG92vzS6YWSc1ePsVHXF9SSAH9CxUhq3/mvby6jGmXkk3YqdgMH8eYt9a1khEChhe
         qRDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915371; x=1762520171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RV56NpH1lI5ED8FEKTPa6jAqZswvvDhZwVi486+R9e4=;
        b=FSt/GtsjimPo27x0k2D3LT/33h5CnMUa33d5RJy9T2d3J9UFmP3+SNUtIcoEctbToj
         oX8qpyqamF1jHv8SlS0K4QRDCRzLWbDWKozwrRCSVW/LTSpA5wY/5nYymdeyXR8icDWm
         2V0rTvW2oof78tHj3GVmsFtSEXdLXmF1kiqNgCIVk1yBxQNOWY1loQhPHwFApj13QQ7Y
         DB66CSx+4XtkdJwkaADRpNw5/Dx5EhwWzBu+4Biov5dQdLKA7mG5E4dAr0EvS1bB1XmN
         Aco/2hUSHi6BrcsUJNNrpy2azWdkemMnXtoNe/+xhAqALavqYjCLujL3UkJSNGBYwXI3
         bKkg==
X-Forwarded-Encrypted: i=1; AJvYcCX62E6PgPhihQpkIV3D0He8fssesWYCqgAaDKI+3PZ8X7R+gYkVIeZhDe8u6lnT/s0fTx6PhE8aFpTQUBIX3gzS9A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5xgEz5HbpNcJpdcGHM/p2WY1NXLwQoAz3kXJogWGnDGsUaHIy
	jo2alYYsfnKwQ8AIZ7HkTwST+ip+kCfU7vyOXoZ2YYlpCbCDvkcxwZm2VYuMRwgYh8A=
X-Gm-Gg: ASbGnctnu8ssUKW4Ugrw7bwo5TmeZXSH38ilRCf8+CsIJP45FNx1zpuyNkRdiPSupuT
	voHJVEytet2QwJpMUm/lvvTye4v73ww+WmNV/4eVuPLKw2zkBxZxHWJw6TsGs9isiIr2Id/QR4C
	HwDbaFIpcaNK1qrb9xYty7XSrM7zKqmC3O7QEgAOytXndG1usRgXTmaczsHGULLrp+SuPH/FVos
	kPtYN4KS8ZSWeOPCZMp8WjI2ZY2+NP0vxEHObOK+SPJoawt7iAWilyE2XpoKfRpsQnYM8pMJ/0F
	Tj52T0WoEizmAIGeCc/ZVACyO/rLCaJ5r27QDv4hD2TlSNWfz16sCHtplMrso2rdemBo/e5bUY7
	gT19heJx9WB3USSIXNgzdFQUnzyAo2zQVlsrlpdlYQWjo3ojVuAV6LSWDL3e7wezBDOuVlc6omO
	hG7W1/Na6xd4xpGuEvhANiUYDSf1xDOtJqxmk01FpJSpM9m7crvBJU
X-Google-Smtp-Source: AGHT+IFeggZ5me4AtsVkM9uFz8xqiFgrnYQxbJrRB9xgQZPpOldZCFch7kDit8HV51sz6CbJralSnA==
X-Received: by 2002:a05:600c:4591:b0:477:c37:2ea7 with SMTP id 5b1f17b1804b1-4773089c4acmr34565735e9.21.1761915370805;
        Fri, 31 Oct 2025 05:56:10 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47732fe1075sm31814585e9.11.2025.10.31.05.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:56:10 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Fri, 31 Oct 2025 12:56:08 +0000
Subject: [PATCH 09/11] soc: samsung: exynos-chipid: downgrade dev_info to
 dev_dbg for soc info
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-gs101-chipid-v1-9-d78d1076b210@linaro.org>
References: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
In-Reply-To: <20251031-gs101-chipid-v1-0-d78d1076b210@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, semen.protsenko@linaro.org, 
 willmcvicker@google.com, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761915362; l=1062;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=FIHoekKrBczbbS2fXtyE+7Irx4O0EiIRwRvzO55FnY8=;
 b=3OjTcS0UxbHqkoISucKjpZEuvX9vXYQp9nnD2kJ4+sGz7IPnIXZMCM6+YJE0WSVoEpcWN6fhL
 AHJDtb+21OcA7QBhRkXf2VyPH00dSPqRQdyZZ3BygbNy9FOa1XSl/mr
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

The SoC information is exposed to userspace using the standard soc
interface. Downgrade to dev_dbg to stop polluting the console log.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
 drivers/soc/samsung/exynos-chipid.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/samsung/exynos-chipid.c b/drivers/soc/samsung/exynos-chipid.c
index 92cd5dfc0a9b641428d0d047cfefd4256a893ac0..70e09ac656e4b95d5d252272bbe02bcf0f6fb2ab 100644
--- a/drivers/soc/samsung/exynos-chipid.c
+++ b/drivers/soc/samsung/exynos-chipid.c
@@ -241,9 +241,9 @@ static int exynos_chipid_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, soc_dev);
 
-	dev_info(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
-		 soc_dev_attr->soc_id, exynos_chipid->product_id,
-		 exynos_chipid->revision);
+	dev_dbg(dev, "Exynos: CPU[%s] PRO_ID[0x%x] REV[0x%x] Detected\n",
+		soc_dev_attr->soc_id, exynos_chipid->product_id,
+		exynos_chipid->revision);
 
 	return 0;
 

-- 
2.51.1.930.gacf6e81ea2-goog

