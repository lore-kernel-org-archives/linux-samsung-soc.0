Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFE2230BFF
	for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 13:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743168673; cv=none; b=TfaaNo+679BbT+FiF5iim4VUMQV3Kv1ONkpNKH9dXowqvSNVNjsrq5O7LV3erH1zKIwzpyUzo01bwEWGkI0OLeFxwy3jE6Dq1Umd7sD32tUfZgfeb6ItFu9PoEuYEKUoN825/uxXQu+KoSdi6BpYIMACWdVnnSgLOIeowMETgHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743168673; c=relaxed/simple;
	bh=YO4AyBJQaRYJNR3M/qB00qaKZDbH/de1lTqDCM4IY8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D2UZXBX/Ptk36auT3RIV1SJnXy5w1cb/Owbu7tZngL6FDNUIxYiOQij0cqzvQZPuNfKCS8jkrGCvjIp4nTEnO6/rh+voUlnpP7qNKhF5g3Zkk5P6BncXrq/UKuBn7BcpzhDAejYO3Md2qtsr7J+100oI/fywF3LHiI9GTuoL2EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gORXIOrL; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gORXIOrL"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so4054176a12.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Mar 2025 06:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743168666; x=1743773466; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=gORXIOrLV0Reqn502HStGud/KS6kxHJt9isdhCx3dPSaS8AXIHBWsH8TTydPylvhFG
         O8KJ2SRRownPzmDgjjDtF4y5XCcH50tQ17eFiYLTUQYy871O05MgFiKnVqs8PBKw5k3I
         xGwTbw6MTD5tI0omjwLsnCk3vKwpVFL3UHeoJ96Tu8uTLmS549Z931MzhcjetYfJZYfD
         t25nA5RmANq5WtSw/w+muie6xqkpUL+f3ydVr1qbG2vPVlLXBRz34ea8x8UnzPrMQIsP
         JZFNu7DrezOTD7mvZ8dkLef25WWRen83ttLZCfr7hmiIMyzyP//savSWV8221WfsicT7
         RHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743168666; x=1743773466;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6KRr6Qm0gpuwraE+pyT1hJyit2ZkidoO0SCeL3UgR+0=;
        b=hXX3cinH6g96XefpZ6Ryr932L5Hj8EQcpXqPe7Fzer2/X0R0vayCK8SFFz1+ITSeFA
         G7AGygyq+muPMqNHfyeqChw7u4cFAzcvmjCqHZaJMvD5wjaTNt3c3AZl9ccanBx9vk7f
         AFyBXiOke/lKoi9ouY3bDJG+38bQX4BQ4SpHZoPHcUc/g5o1jXfYb2QJekFP7kco/ZCD
         3UtQMfsW7u6zUTKjB/ZQhly580bH4PFsZgk/eOfykKCN5iu/LP+lRqYKtH4iYqDhNXEX
         dY9ZKBhGlAAhBWlxm6c0OvMMzAcmPr0jApuMjXzH5gslFZuNU7IIoxZIOGq2QWWNEMqA
         V9MA==
X-Forwarded-Encrypted: i=1; AJvYcCXDXyvGE+1b7XNkJf3LHkqlMAtW2jP3jD7BDvB2pC9zfmSZjD2BJkj0LgNooL/dtHj9oNN6ExmDu2OXcuQ3E81UpA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc8Hrb0aJ7H0c+uJH4NQ0opWQHuVHeaQsiXg23okFID8kU97Jj
	Hedz2MYJAFOJ9h1uMXHiiPHijIw2fcNATmgtyAzkr2vFdHJGoQTWAImYe3/d9hQ=
X-Gm-Gg: ASbGncvHDfF69u28JMX2kdZu4OeB5NsZDwN7QuGtjfiTH16ErdIYizs9i/spMcabq/y
	0kwuRbd+I30hioOCG42IKloQMjgme0qOP5lhIggnc1ShAcT2bN5+io7GByND2sr3qydrgpe2Gkz
	wnwzaLZjWUREx8kAxX/39wbuk1/eChnmA0D8WzSpzOoxY+E9hvORuz+HJNu97jSrWi/iLJimLbj
	CVDRsz2JPgcGECjeLp0SbsigSKpYjkKRxokQIn7M6OT2rO9iu/0qfhoRZu4+uFZlR8U9gVhPmKR
	XAphJsWDKowko5x/jnDxZZWnj4WE0nwvIrerB9pUYwnkS2O3KxNM8LDz8mCXW8kEzVL5fBHz22D
	s6a1EPxLARb5ibAjOALHgQD8EFL5d
X-Google-Smtp-Source: AGHT+IG7PqQiTAeCLYeu4XFO7xoUmzB0J+twGC6cGhlHhLLeNWFRkIRumwPXFqyHrKLHI6/YYrbfIg==
X-Received: by 2002:a05:6402:241d:b0:5ec:6feb:5742 with SMTP id 4fb4d7f45d1cf-5edc4c93702mr2791136a12.16.1743168666473;
        Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
Received: from puffmais.c.googlers.com (8.239.204.35.bc.googleusercontent.com. [35.204.239.8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e01f7sm1355284a12.79.2025.03.28.06.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 06:31:06 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 28 Mar 2025 13:29:10 +0000
Subject: [PATCH v2 24/32] clk: s2mps11: add support for S2MPG10 PMIC clock
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250328-s2mpg10-v2-24-b54dee33fb6b@linaro.org>
References: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
In-Reply-To: <20250328-s2mpg10-v2-0-b54dee33fb6b@linaro.org>
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
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

Add support for Samsung's S2MPG10 PMIC clock, which is similar to the
existing PMIC clocks supported by this driver.

S2MPG10 has three clock outputs @ 32kHz: AP, peri1 and peri2.

Acked-by: Stephen Boyd <sboyd@kernel.org>
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
2.49.0.472.ge94155a9ec-goog

