Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30BF321C9EF
	for <linux-samsung-soc@vger.kernel.org>; Wed,  9 Apr 2025 20:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231077; cv=none; b=EYJHg3gi8fwZX4XDLosaBlMS5w6RPyleA+XhzNK10pwvMbtzdXoejIYYiBzvLeIbiN+VBCHKy+b/xG7rByMyuCx99SBY8QIteVgAzgIcbCo4Zm/uNV7CGZUx8FyQv5lA1uzrq2kA4I/jhANACPczRZZYufJehyaaGJlWsEOG3jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231077; c=relaxed/simple;
	bh=AQOh1SAmTjWO6vzJ8CZkmZ+2uws48CsZYe/GOw/fK5s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KoIAZmcCMWzZaYQXJIgebNrycTSaNQxJ4jDR8CTjl0GxQI0hiNmPHSzF3ZnAkDjLBeT/13UJiXfcvDcyunkBGH3kw/CncgmQmrJccguGMUp1gi8nR6Va5jTzT6+tQmU27aUuwV8J4KkG6B+tj9wBNVgLZafQDHHY5/mvEuV6pZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qWvQaglg; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qWvQaglg"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e8be1bdb7bso198692a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2025 13:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744231064; x=1744835864; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+zcRydoPq0e3uOYwLlj7ABnDIgPKatAxdb7+TG8s1Ss=;
        b=qWvQaglgLv2lTaKwxS+lfEzU8PLEEPSwpZhB8yOV5+a4qJvgRYG4O37f5tzZWZPqla
         OLTr20EO3qW96L7iGj2qKI9Z9Q5MmG15dYUtsP5VwoWnpbv2X5ruOon3QunQk7ETp/OA
         F1ZmsA7OcDzf89HOaPwm5sTZqgClRg/869lniWKsBIRbOtHwpxCoYq2IcvUZTYHZfg4Z
         Tq+4WppFDucsk2p9QNhttj8dx1ft47D7ul0UJYq6yRtWis3rI8DGw7QcTrm3wZkAm3yr
         Sd/jKbmTmBUHGH0ui3/QIMCs1chenKUEb/PUVwr2lQwLlVCMW+cY7U31W2TlImumNmGm
         v5HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744231064; x=1744835864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+zcRydoPq0e3uOYwLlj7ABnDIgPKatAxdb7+TG8s1Ss=;
        b=OVwhGmXcnXv0ZdtqPtIxtsL3mvsP3RHgErsmZt0/aAAIpg8/uYyAr3qc70tuZ4hV9D
         idlEc5QHVRHHnGbBlyuoOknZHIMV78bTMcAySr0oPhTbRGjb8+xx9O1NhUX0ha4vXHcI
         Nfz/Dlk8/EPtxjejuPNQWvCvutuAWk38Jw9soVM/NxhjZ30twq6sn3aG4sz9FRbNFECE
         b2IxyDeku79xgNxxDMEORwIQqjY2Pm1LDzbRgqA/UWMKUirN/XCj2jbY0vYsg7xwomGs
         zz3n+b0U1jvUY6zPmy+kLzg90a4BfOTnFqTW086z+1zOa3rPWhgyI4azx231WuoK48DD
         F4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUl0yNvxaB1VyITRX6nq3CIni/qZoSX2x2tRSDuhcWHreRAAUlHQJHHNT1qiv6QGtho5K6IQqcqDJTZ9vFN5U1s3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxsctbQ8GoD7bdPnnIUv7E5jei3nufvIIwtLY8nnj3Nq7Xvaxm2
	3Ks+29RskzycmQZTBwvyIAdxYfRSEAvXs6aVP1+FHGQTAueQPH8XZDpUBvP4BqI=
X-Gm-Gg: ASbGnct9RUzJIwfdNq1BsPqSA8ttq8fqC5A3ya48mC82Z9rZAupaSBqkHdRPL7avwAU
	kvnyVs6JxADakoiExUBxec3wTpFVoY5xE0LS/NQoGE4hWdX4OsEOsopz+Jg9YDU9mksQR/hw8nI
	T2+aTrbL8o9GBrGe+UiSPEhYjgsiBjXMIPIOy+eqApFnvVEQx0N3rVKXW9eKHIcy9UYwKCt7Kne
	p/jP52NMAq2r0rjJZ0qbU4+Bhlpt7h4ciPI7pNCZ0BwOwa6C+UHm6Zw98ooO3TFkalBxQPHZSfk
	dOtnScsUoM6NFI8/gKI8ZzOKXjURRr1EWbJARYB86B8rWZkjt3zN9NEFybtJ5OMlyUuOE3PmVO1
	SxkzxNwkaqZ9l33IggJuvZVMWNeA=
X-Google-Smtp-Source: AGHT+IGvuuLoVK2j6sMyyQsZa8p1VCqZY8y0EZ8duJvRWZG85z91U/cgYPqYUZihq20x9iTbe4XZTg==
X-Received: by 2002:a17:907:7203:b0:ac7:19f0:aa5a with SMTP id a640c23a62f3a-acabd2517dcmr7867666b.27.1744231064521;
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
Received: from puffmais.c.googlers.com (40.162.204.35.bc.googleusercontent.com. [35.204.162.40])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ccc001sm145850366b.126.2025.04.09.13.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 13:37:44 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 09 Apr 2025 21:37:50 +0100
Subject: [PATCH v4 29/32] rtc: s5m: switch to devm_device_init_wakeup
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250409-s2mpg10-v4-29-d66d5f39b6bf@linaro.org>
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

To release memory allocated by device_init_wakeup(true), drivers have
to call device_init_wakeup(false) in error paths and unbind.

Switch to the new devres managed version devm_device_init_wakeup() to
plug this memleak.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/rtc/rtc-s5m.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-s5m.c b/drivers/rtc/rtc-s5m.c
index 095b090ec3949e0e8074cc344105daa00b795245..f4caed953efdd23fd0132d74d5199dec9cdfd294 100644
--- a/drivers/rtc/rtc-s5m.c
+++ b/drivers/rtc/rtc-s5m.c
@@ -779,7 +779,11 @@ static int s5m_rtc_probe(struct platform_device *pdev)
 			return dev_err_probe(&pdev->dev, ret,
 					     "Failed to request alarm IRQ %d\n",
 					     info->irq);
-		device_init_wakeup(&pdev->dev, true);
+
+		ret = devm_device_init_wakeup(&pdev->dev);
+		if (ret < 0)
+			return dev_err_probe(&pdev->dev, ret,
+					     "Failed to init wakeup\n");
 	}
 
 	if (of_device_is_system_power_controller(pdev->dev.parent->of_node) &&

-- 
2.49.0.604.gff1f9ca942-goog

