Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AB422F3C37
	for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 14:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758119985; cv=none; b=rNOoF3h7C0d/pFo45lzIzXi9cFHfyXmlzoz9yzV8XHQd8wjscx9bwKV8lclI2ZsBPIJoyNqWe8SkA8GsQI6f6j6YdvApbjXAV6/F+WhefWy5+YiCG5EFSt0B9yAOLO9DFnKA5OZvCPfj4FVaNv01E6w13wvPtFdINhYJn8nAXOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758119985; c=relaxed/simple;
	bh=hZTBRfz/ZMmGgfkxGvZJNqkrI3iVk75jFXYBuJXd97s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ufBa7lFfF6xaK4vwFM2LPKa5ISEznQKTLNkXBcYpI+HnvRy4vVd54G7DDJ1IE0znIZRPB0z/IJ4zafZjynbYk1mc4wA1lcsmxq4m+rf+WaWy+RfEHxpzTLO+GKLHRyM2lkgN+nY6UyTC9NiFKzv4um42lnrRlwgEokjHkjMNBPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MIyb62YM; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MIyb62YM"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-62733e779bbso10087662a12.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 Sep 2025 07:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758119981; x=1758724781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+JFxy0ygOdW3l3nHRVIFlZWqg48U5vYOHIigwzCCL4=;
        b=MIyb62YMh8mkOlC9HmVaLYveK+3njYXe2BhsbpWkrpgk8DneoeCiw1Ta4mpCwdE8Xq
         Oexsap5WtaCY+nkw4LyHqZk6hz1CSee8vXCtyv5q82Xug4Kpo6FwR1DofwGugdKrJlqe
         CgJ/5W9gyKVJHijQwMe48ooe18vb5e3TC8TcJhIcbbchpXJDK2Plh3Aa1sEg8yRDHvpG
         gqtWeK8NdJw6D7UPX5HTXMdbsFYkTGJ+xFIv6cEbdSj/qfnD3T3Og+jOGPfzG5lMrLGc
         CArhKefHV59pHnM1Kx5huu+SlOgbCztWlE+1ThT2ZkB1pE/lpmYXTcyCkFfXTcTuf8Wl
         YZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758119981; x=1758724781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+JFxy0ygOdW3l3nHRVIFlZWqg48U5vYOHIigwzCCL4=;
        b=vIlKd3PiYTZWDb3nHmADmyMs8FdjWgk0r2EclS27QtYlF3Z2QehoZBhpx3b3CXptW/
         JzPBnfZ39o8BsP3nvEa/slJaxx4fKumRANHM13nrEr/Z5H+o2d7bumGlD0rgoR3z4eKK
         4IP801Ai0wmuoPmauVaRnTTb0eh5xa/WIEMn0gMG+zsenu4PcHnKtOqQ+l0xbA9r6RiX
         vsWZec/ns1ywS+SMSL1mxkcxB2MOBpKYRmvnwfu/W0S5ooh8h0Ph5a2S+j2CSxCnYYoL
         96ADYePq2YKdA9OHyNj436hyEom2HCdLmXzOIeoBtpsrxqKbMwA8QqHW8Ka0q0oRwxAA
         i47g==
X-Forwarded-Encrypted: i=1; AJvYcCX/Px2LN7ET3zeEY/6YoMLRyehI56OtO1kR2gucOPDmA4/Dgd3FQMMVSDqFqVKbUcIzqDM+VGLnkCHAXv5MtTCbAQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy51K6j/eHeRg4Pxh9+AUZUaLrC+KyG9rp+yUR+DACxH9ABZpd7
	FZbUdTG+KY1Na/BWs0JbU2aKBndLsQZBEWN1iq6QuZ1atwtF6+66odrKxp29BL1Eyyc=
X-Gm-Gg: ASbGncvIxRgE2/0wJI1T5kE6xQ7uud7HDMIQUKbT4ZwMchmmS7fU0iOqaN0pv696rgi
	dyIOzXRSWYtPRSOS8y23sTsW+cveYFVjzn4PzYqJ0ENeQnwCQm6TjM4DRFLx+H7YtGUiTmQHs1k
	TNZsCq3ZSy8nAMdGfE4SeRfs0dKbDkAu5uiI0eUmE9p6bIg5Z7ug2wvoKZpKRk1hElX3aTX1/W/
	2Hil3M9UlFIIbsWuwH5TJI9MupvOJNIgmwiJgTfQ1AQm2AyJ9qlJcTBxoiFyS2uLKCCJos9sjQC
	WKYMI88eiVu9BSvVg0ASWb3pt2YoFoeY46V6PqWc2Bhsrp3OupTKAxXVr3D/9lejo3QmXBccZFY
	3FJzvxWGNzKgzMIGdCsGKxBRg+1T637yuqfx+/RTQP3jbq64IPJlZjElA707RD0CzwUCWR4T6cK
	MEzl9GLpvIjqsL
X-Google-Smtp-Source: AGHT+IE8VEnZlDl0+bIWDG3i7/q7d7hKEqhb51w8SDDyxzRAyEBFsV4sp9akw/faDA2uEjEVnVB25w==
X-Received: by 2002:a05:6402:5210:b0:628:12e9:5e41 with SMTP id 4fb4d7f45d1cf-62f84685255mr2219366a12.29.1758119981486;
        Wed, 17 Sep 2025 07:39:41 -0700 (PDT)
Received: from puffmais2.c.googlers.com (224.138.204.35.bc.googleusercontent.com. [35.204.138.224])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f317bf9f0sm7112464a12.49.2025.09.17.07.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 07:39:40 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 17 Sep 2025 15:39:33 +0100
Subject: [PATCH RESEND v5 2/2] clk: s2mps11: add support for S2MPG10 PMIC
 clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250917-s2mpg10-v5-2-9f9c9c4a44d9@linaro.org>
References: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
In-Reply-To: <20250917-s2mpg10-v5-0-9f9c9c4a44d9@linaro.org>
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
2.51.0.384.g4c02a37b29-goog

