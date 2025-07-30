Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63DE227467A
	for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 09:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753867915; cv=none; b=Kac49QHYIlkF46aP9b7cDmn28A80hP7eSZQdxca4z0vpScs/bG7g2sGcqDfcARFQqgdOb+/Ozp4Oyojyk7X1rpn+6/ej32p51KxQSMdlDdUPeRVXaqj/bX8ccSFwEZ1T04UoiIJ8Mu3X/gjYeQougu5L1DLPJ+3GCn8NrIiXqYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753867915; c=relaxed/simple;
	bh=UrLx/HnIyYtmVFp3GLCZaWBR+1sYwrgF6xX3qNmU/Ps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Oyh7TNZjIp3S/CibDWmp1hUSKn/695CTak3jLjmDknTaJ771q9L2qqwr8w4DtYS4K8kRCQhox7zRYn5JwFFZhNE+CTQgp6AJ9huRGdfLNwOrXz0N9J3hepG7/RjaA+lUBh9b7Q3CiKSDDpAAgbOfVJnJ6m93ahADI4J5nI4LU54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LMIxw3zg; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LMIxw3zg"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-60c9d8a169bso10500894a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Jul 2025 02:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753867911; x=1754472711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8pReZwdLuvK2x7nnnNc/6AC+XTJeKDHlZAHO11VcmSA=;
        b=LMIxw3zgAucoiBnzSWYiPMEhuVXGOybEo3Xen78Roq/LyDUVvfgxD2Fb3ojWszx7Lz
         lH+kVpvRs9IuduVOf83ADOGBOTS6PQcTbCLcUWQQoc5J8H7pfc7ODh/GSSgJErpUrHBV
         +wRXClYmS4HNmW57l1/t0ZtN2XCvQn2kYgNaFwY4ZcTGSZESxnYHntev8jHrEa60+EZH
         2kIO1WNFjM3qzP7lEg3uBBkskMxJ4hbmHzdp3G3iy6iTYrXSYYKUkB1phuO2foUIA4IO
         0W0xd/FrcMHi9c5yLKKCTnHWJN9PeZeq2XpyhNjU+gkgJaqpKF8YtGFvHlHfDSnDu8ey
         QjaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753867911; x=1754472711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8pReZwdLuvK2x7nnnNc/6AC+XTJeKDHlZAHO11VcmSA=;
        b=se3xEnPDXAdH7mdjkuhvnLgm9/rhsIB2/GdbngFAfsf+o0GjODnRGBj24ge3qCAnDA
         lCpI9LzV8R/ddDbVor2Wf0SvtbI/FjwbQrbUjRWHnsGVGvQk2DritlsFa91TmO3PDrS0
         RN8eCatcHjfl5w3hvCqVsGF9zLn4u0K0ulG7z1p85vGA/Jo2xd+stnK0nwmPpK4wpjrf
         TqXkWbDc77Yt5BQhytSiBEkH5BsmSyLytZYZPtRRVu4uSBIUhrjnM6Ggvcihe93NSUfD
         ncgt1Jt01k9HUfgJ6wqVer6vsuoclF0OEY04qKpmsldaYj865wZy90zXzb2IsXZj6Xpt
         2iYg==
X-Forwarded-Encrypted: i=1; AJvYcCUpSxsPflAqqDBcJkplR8U0W+4ZkVQ+A591XxxW+h1EKX8PwVYMsye8LWO9EzdX5pqUxBjF68k02LMn776kubLIrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYSt9oqBkqOAui7UrgNEmEb3nG3EtYygVt64JAXL0O3LjTaFBk
	bNCI1IR5TW/tIiv2vvZN1ng3mpZlj7n51u9lldZv0ptEfImBWAtmTRIYpoog4F/nEVw=
X-Gm-Gg: ASbGnctN41ivMb2T8MlzhzTUVJGCcz6wLJ6LHsaCO8JEANxME/6Q4d3KAtstNH7GGhF
	RdNniqpj98mMlMnI4APVnAs+yL/PjU0lpROjBIa8Aw7TzUJrEI6o/dC/dvEfAQEnWTAdwtFoNkq
	eowgdrcSMCxXnF52rckEqH3C2DS7q6bxdBOhOfgcC4PnA5qVa505TXIQXl1pBz1qmxcnbFGs50u
	ctNKbfrExDE04r+ZbbXBKlUHSjcZbB9M4cJWLWKdg8dwbb53ll3Z/VTkOCx9sjJ7Yzk3p0vIAXs
	qE5kNOuf8z4QizMx1yhKqN7dHmWh+WamoO5YxNsDbCqeo6PK7c6UoR+q6oYaRahPsKkMe2+K95G
	8+gx8bmL6CMw46tKE8aWl4FjlUtN58IA/DeZ2r0mXbHfgdFBR02fogoWGvqYq3vNFM+ClCHlay1
	H6RnE7Wg==
X-Google-Smtp-Source: AGHT+IFAIKlwhaRCqnP2buBcT0RopLWu8QC5KSLz/f0m4GU4n7vGaomxMURhZGUWklTnaKUlIOKM1w==
X-Received: by 2002:a17:907:3f16:b0:ada:4b3c:ea81 with SMTP id a640c23a62f3a-af8fd957532mr287123966b.39.1753867911166;
        Wed, 30 Jul 2025 02:31:51 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61536916dbasm4090424a12.43.2025.07.30.02.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 02:31:50 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 30 Jul 2025 10:31:35 +0100
Subject: [PATCH v5 2/2] clk: s2mps11: add support for S2MPG10 PMIC clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250730-s2mpg10-v5-2-cd133963626c@linaro.org>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
In-Reply-To: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Acked-by: Stephen Boyd <sboyd@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/clk/clk-s2mps11.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index d4e9c3577b35dec8d9ec67c489b7b5ae27211f55..ff7ce12a5da6b437b5c92b9a32dcaf9423647cde 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -11,6 +11,7 @@
 #include <linux/regmap.h>
 #include <linux/clk-provider.h>
 #include <linux/platform_device.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -140,6 +141,9 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	clk_data->num = S2MPS11_CLKS_NUM;
 
 	switch (hwid) {
+	case S2MPG10:
+		s2mps11_reg = S2MPG10_PMIC_RTCBUF;
+		break;
 	case S2MPS11X:
 		s2mps11_reg = S2MPS11_REG_RTC_CTRL;
 		break;
@@ -221,6 +225,7 @@ static void s2mps11_clk_remove(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_clk_id[] = {
+	{ "s2mpg10-clk", S2MPG10},
 	{ "s2mps11-clk", S2MPS11X},
 	{ "s2mps13-clk", S2MPS13X},
 	{ "s2mps14-clk", S2MPS14X},
@@ -241,6 +246,9 @@ MODULE_DEVICE_TABLE(platform, s2mps11_clk_id);
  */
 static const struct of_device_id s2mps11_dt_match[] __used = {
 	{
+		.compatible = "samsung,s2mpg10-clk",
+		.data = (void *)S2MPG10,
+	}, {
 		.compatible = "samsung,s2mps11-clk",
 		.data = (void *)S2MPS11X,
 	}, {

-- 
2.50.1.552.g942d659e1b-goog

