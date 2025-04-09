Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B8821ADD4
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231073; cv=none; b=Vl6K2aTECrda1DfMzMD6+ROTRHZ1+kqkJFCmapvpkIEhYt6gvvQEYVYNRKyAIXGTsd+V5a4tkHxV5c0gRhwzGy0G/vw9341CO5yEjZTnEZNDni3dz+XxX/9vMVsUe9gtcaqAjhskZK6G1QlZvbd8ITC45rxWv8e1XMjMtMf0PUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231073; c=relaxed/simple;
	bh=JZoZsQGu+qys2atTASOCtFxTZ7xGv8u8FbjT8AQa4aw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mFE0yfjAbfA+1+CV9RpJCLUmmJAlAcqdEveKhPr5RT/6Cf1z9blfO+xVhcSpRqFYZzxUrtdiFpwQ+eMQ7lLWuDAgEnB0D6kEaYisp0cEa0edbCVxhzIl3aqvvlB/ghWwMuQTpe/pE83MQ4aXEEluAoXLjSnxQotWJBU+MvEhj60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V6tCAMuX; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V6tCAMuX"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aaf0f1adef8so16968066b.3
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231062; x=1744835862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJnt4X6YdY/BFyT2FERwCeV5jxdImTZ9iH94rwv0lzU=;
        b=V6tCAMuXmzCFCqLb2nBg7n5ZdExxfGIyLS/rgWf+FIH9xts46XEDLeAjHGY5yMQnMj
         QIMhTx3wruviBDs+GGJ862QPA2W/IxgxmnuRYzk4hSKyiH2vPYlxZgNzPET/DU5W9P5e
         +k4azMVU4JVy1tAAXABoi0kQHoVWs/mqFmLoov7/Qzn1C0QqvfYLKhQfCF11Z9Y2KDGz
         VjNsVKc/zwmZ3tluwcaUKa/CrwacU/LsfIkjPSoHjkpSgsHrbuk/G2aMJ/7P0neb/eSp
         pGYnuxbcv9w8v1cL9Q2fy436IKvW7D1eAdTTqZUzcNH3vsxgiFfqS2jeJ16id0+ulS1T
         JStw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231062; x=1744835862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PJnt4X6YdY/BFyT2FERwCeV5jxdImTZ9iH94rwv0lzU=;
        b=SV3FDOhuvpuib83sujOBCOpqSfFWgHXaLytVRRn4T2lNwJHaK1/FUzESTalm9Qvv4/
         1Rj88CTdIc+UT6soFWzZSIsdFG0Lru/MJV6OvVKQSpT43BA4CkKgs3W+4L4TutL2905+
         m+VYgkwbdxaquEXPM8t0mMniXhNbLEP16Voc+9DAbBUfSZkieaTfyM2zZc5J69sMTitk
         aa/obbzDvwFGsucAY8OwvgNgWfI2y8e/chMPYFxr/OLvNOC7gKVHMoH3ey9yHP5P8NWY
         3R1Irafr0OJpSdhoJjexWqRlYLtfw8bAtE4lwJFKkuHGTMi+6TYZCy52sq6F+715/dHq
         TioQ==
X-Forwarded-Encrypted: i=1; AJvYcCURxCzUR7PSPoxph3BwM3kJkcfOuTF5uxth2BAUmWZU7uWPwjl49TTajd8pfKsCvOlplNvzBorcueEjDSrKh3sjNg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCED/yRR3r2m4o18t8jLJM+yFn7BL5JiC14iemPmMsIIpHEzxJ
	rJkNK7a4qJDI09MKKTnck79I8gohWUVeDW26SaifyAwaU7aw2epWRMMZDZEMqVU=
X-Gm-Gg: ASbGncsCn0NaWktz71RTYtJwiWvZHFfZIEmoTr/3uMsm/r41CaJFg8dTVfwN1UhTarV
	CIYJ51tl9jYe2o5FDxT6Hd+5GMM1NTGLRFcaGklfrfBEhtME0yeZVOd/1UJ/4C5wuHJfemU/ewn
	cS/V/VmmEVm2+ZOvnrU7D/X2yMZTq6RaoK8SlVhl8XV3fd+9/ZPoNAciXIi1FBz2xQn4+lLd3sH
	peZtx0pqWqvb7v31aVRcBQl9j4RwAnWg+/aq0XRh3Gv9aHeI6s7k0J8D3gzRrRQ4MQ9n+AbLmre
	gwM/Ot3FuUGF1kzoaMu2eVTpJ71rBY05JXfLbZcXkfDCSoE0Y9yV+ZqfalBtXRzU5iDYNp0+V4k
	5QtsPNpyvwLIs+9TBO1Nf2fc0QkA=
X-Google-Smtp-Source: AGHT+IGcGvyBEozGeWIYo1Wmu1QpRypnZWsnec23s92Whxrsp0WWnRhv1muM1X5KK7DjvKkeOCkkGA==
X-Received: by 2002:a17:907:7248:b0:ac2:9093:6856 with SMTP id a640c23a62f3a-acabd4db31bmr9024966b.54.1744231061967;
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:41 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:45 +0100
Subject: [PATCH v4 24/32] clk: s2mps11: add support for S2MPG10 PMIC clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-24-d66d5f39b6bf@linaro.org>
References: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
In-Reply-To: <20250409-s2mpg10-v4-0-d66d5f39b6bf@linaro.org>
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
index 8ddf3a9a53dfd5bb52a05a3e02788a357ea77ad3..92c8d36dafcf8a448873567fb3541a1b90cd9837 100644
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
2.49.0.604.gff1f9ca942-goog

