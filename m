Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCA2217654
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231075; cv=none; b=M7irhoGhDMmmrJdMCsDVtPLBWVWT3k25O6LX5mM/t+/sd11lOvnLKSe8l2OIqIggONk2erUGv6HWiizdC0XqzxR+cnNWQOjzqkcoRzDGehADt6uxOhtWekHBa+DcKVbCxYQCpBhFXwJgru8u+iR/Z7ijWDprJxrYVq8o0IWDEg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231075; c=relaxed/simple;
	bh=9E57e45BxMl50555VhXLsBvSd4mm5Cl4BbZdxjc19jQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9itCoaxLCuC7T6X3FfGUB4lzFfYhU8mTt6Wzap66R7KSdlKWOPh7+fpi61jDGplOMa9E5FU2Ct1CB8ZFc9Mj1Af39KATdQdYJXsS9rxxo0g7FyYGoNP6hWaP+8tyZLlilPNe715bOqQSnQS+8TrAczStZ4iHMI4SnvBjhDKlTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dis10PpJ; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dis10PpJ"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-abbb12bea54so19174066b.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231065; x=1744835865; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aro3/v5oHaDdhAQCIG1fg5IWgisO7nOka33BpVTMzSM=;
        b=dis10PpJJhuLLHNlk8a/obGOaMJdSRYCXYh2upQuJb1jcQzWrlAC664y+VpfySvmQr
         UhVSEfDuvh0XFFSrh5FmL5wPe8zbp4Lj5rp2B6yWHqVJR3PEx9V+R7heoaSkq+ORV52i
         0Dr2NtbM6ALIb9Id10LekqdVU/hAp93o1u13B4MDR40LjI/j9BvYyqTWBvdA3qF3Td2g
         i+HFFQKseSUf0O9Pm9Hqg53z0nIBE6PGQls62GsR5T5JM/17Jf9EVDUiInOpdlMdl4QB
         0F7JmlU376JsFX6T1tAV8xZEVqKqSVWz/u1t86zWJtZbFbSK5QqTYkucdOA7k9hZkpBS
         mcPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231065; x=1744835865;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aro3/v5oHaDdhAQCIG1fg5IWgisO7nOka33BpVTMzSM=;
        b=tERNwcbY7bvfQYh7paYDZnrIhD96Y1laUPxwSsxqmNix5eKkA+NDdBcCFiJqcO1oMd
         iP3C75dMk+KL7fmYsuQT1mYwrzGQ1XirybYgtSxTrZKGn2mAbtFy4w29xflZakqjMEyF
         Ixhqp02EM64KtG6FXXuOxoes6jU4lOjwePmOGB+8IZ/xb9W72iiHyTtWuhG94vFndi5W
         8g6KLQp13kC6zad2jn50vVpUERIqEuiuBZ9bcRNkVFg9/LWkHxydSV/293fge6pokq6Z
         1iCGh18D7taRNDzZGtgRT0h71eKZMuSdI0AYELLoQAtK9bo3TFHAzjCCrNLbrwbOS9wx
         7HIA==
X-Forwarded-Encrypted: i=1; AJvYcCW0EpwXQ6cKUBFqz/tEIlppeAHuzRGQ5HwQ5AxkBXaOqY+qd1OYqFC0/4kmKhtePwZahiek1h3guzZ/KbIkWvSKFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSJs8vZBUUZBei2XWbTArpisS4SCXl96uB62cqs5VcReXwWRCF
	U9WuXXodA2JF5dzjBanfjdueROOdvaqujCy0NC/idE4M4bpnvM994NxdNa2lADk=
X-Gm-Gg: ASbGnctSiW2uYTK9Sh2YSd6aanY5scMJzI9ojLTIS1h+hQRlFLz52JauQ3WUTepj9BM
	Y8ydb44RiDjrY50lDyvQyuWGeyzoTGKmt/kPwec0nrDbtnJekCs52Sjhflpa4gf+/QjaMVkpHS8
	XLfDfHtQ6Z0ZK+G/7rCbMJUdulPzqwNVFd+9k1Nn7wf17+CVs3XyQsawwHYkAcr/SIuVj1CgMNk
	vlZtxwWUgg8yu7iB3v4NbFiBcEcHLc+IYT35nXlR0hH+yiC9JhoznvHZNK2byhk8nBZiuk8umq8
	DONdlccTq1+0thfGY4CLRLieWgs5Sm9UQzkOl13jQnhrI6HENFu4vdEHqz8oyfd+SIPVYgsHZIE
	Kecu4OAEP9hoVyCsO8xq6lJXBiDY=
X-Google-Smtp-Source: AGHT+IEdkkXow6n79ZWPbZRhN5XFCjydXvQNxgGlSC/PrHUaOACC0tp9PiBCaVoIN+0xJ5YXvd/Wlg==
X-Received: by 2002:a17:907:3e0f:b0:ac7:391a:e159 with SMTP id a640c23a62f3a-acabd4d8449mr5988466b.60.1744231065076;
        Wed, 09 Apr 2025 13:37:45 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:51 +0100
Subject: [PATCH v4 30/32] rtc: s5m: replace regmap_update_bits with
 regmap_clear/set_bits
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-30-d66d5f39b6bf@linaro.org>
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

The regmap_clear_bits() and regmap_set_bits() helper macros state the
intention a bit more obviously.

Use those.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index f4caed953efdd23fd0132d74d5199dec9cdfd294..27115523b8c25794a9f3ac8e734bb1ed998e9518 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -338,8 +338,8 @@ static int s5m8767_rtc_set_alarm_reg(struct s5m_rtc_info *info)
 
 	/* On S2MPS13 the AUDR is not auto-cleared */
 	if (info->device_type == S2MPS13X)
-		regmap_update_bits(info->regmap, info->regs->udr_update,
-				   S2MPS13_RTC_AUDR_MASK, 0);
+		regmap_clear_bits(info->regmap, info->regs->udr_update,
+				  S2MPS13_RTC_AUDR_MASK);
 
 	return ret;
 }
@@ -351,10 +351,8 @@ static int s5m_rtc_read_time(struct device *dev, struct rtc_time *tm)
 	int ret;
 
 	if (info->regs->read_time_udr_mask) {
-		ret = regmap_update_bits(info->regmap,
-				info->regs->udr_update,
-				info->regs->read_time_udr_mask,
-				info->regs->read_time_udr_mask);
+		ret = regmap_set_bits(info->regmap, info->regs->udr_update,
+				      info->regs->read_time_udr_mask);
 		if (ret) {
 			dev_err(dev,
 				"Failed to prepare registers for time reading: %d\n",

-- 
2.49.0.604.gff1f9ca942-goog

